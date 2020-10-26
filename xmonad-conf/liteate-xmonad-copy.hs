import System.IO (openFile)
import System.Posix.IO
import System.Posix.Types (CPid(..))
import System.Process (system, readProcess)
import System.Posix.Process (executeFile, getProcessID)
import System.Posix.Signals (signalProcess, sigKILL)
import Control.Concurrent (threadDelay)
import System.Environment (getArgs, getEnv)
import System.Exit (ExitCode(..))
import Control.Exception (try, displayException, someException)
import GHC.IO.Handle (hclose, hDuplicateTo)
import System.FilePath.Posix ((</>))
import System.Directory
import Data.Time

import Relude as R
import Relude.Extra.Foldable1
import Relude.Extra.Tuple
import Relude.Extra.Bifunctor
import qualified Relude.Extra.Map as M
import qualified Relude.Unsafe as Unsafe
import qualified Preludeas P
import Data.Char
import qualified Data.Text as T
import qualified Data.Text.Lazy as TL
import Data.Function
import qualified Data.List as L

import XMonad hiding (Color, whenJust)
import qualified XMonad.StackSet as W

import XMonad.Util.Run
import XMonad.Layout.LayoutModifier (ModifiedLayout)
import XMonad.Util.Types

import XMonad.Util.EZConfig (mkKeymap, checkKeymap)

import XMonad.Util.Font (Align(..))
import XMonad.Actions.Submap (submap)

import XMonad.Util.Cursor(setDefaultCursor, xC_left_ptr)

import Text.Printf
import Data.Text.Format (Only(..))
import qualified Data.Text.Format as F

import XMonad.Config.Dmwit (outputOf)

import XMonad.Hooks.DynamicLog (PP(..))
import XMonad.Hooks.DynamicBars
import XMonad.Hooks.ManageDocks (docks, avoidStruts, AvoidStruts)

import XMonad.Util.WorkspaceCompare (getSortByIndex)

import XMonad.Hooks.ServerMode

import qualified Graphics.X11.Xlib as X11
import qualified Graphics.X11.Xlib.Extras as X11

import Options.Applicative

import XMonad.Actions.WorkspaceNames

import XMonad.Prompt

import qualified XMonad.Actions.Warp as Warp

import XMonad.Layout.Decoration
import XMonad.Layout.NoBorders

import XMonad.Layout.Tabbed
import XMonad.Layout.Simplest

import XMonad.Layout.Renamed


-- utils
wrap :: Text -> Text -> Text -> Text
wrap left right middle = left <> middle <> right

pad :: Text -> Text
pad = wrap " " " "

shorten :: Int -> Text -> Text
shorten maxlen text = case text `T.compareLength` maxLen of
  GT -> T.snoc (T.take maxlen text) ellipsis
  otherwise -> text
  where ellipsis = "..."

format fmt = TL.toStrict . F.format fmt
format1 str item = format str (Only item)

-- parsing
withInfo opts desc = info (helper <*> opts) $ progDesc desc

-- dealing with three-tuples
mapThd3 f (a, b, c) = (a, b, f c)
dropSnd3 (a, b, c) = (a, c)
dropThd3 (a, b, c) = (a, b)


-- measuing timeings
logDuration :: MonadIO m => m a -> ma
logDuration action = do
  startTime <- io getCurrentTime
  result <- action
  endTime <- io getCurrentTime
  putStrLn $ "Time taken: " ++ show (diffUTCTime endTime startTime)
  return result

-- rename
nameLayout newName = renamed [Replace newName]


-- signal handler
withoutSignalHandlers :: X a -> X a
withoutSignalHandlers action = do
  uninstallSignalHandlers
  result <- action
  installSIgnalHandlers
  return result


withCurrentWorkspace :: (WorkspaceId -> X a) -> X a
withCurrentWorkspace action =
  withWindowSet (action . W.currentTag)

currentWorkspace :: X WorkspaceId
currentWorkspace = gets (W.currentTag . windowset)

withCurrentScreen :: (ScreenId -> X ()) -> X ()
withCurrentScreen action =
  withWindowSet (action . W.screen . W.current)


---- markup(s)
-- Dzen
type Color = Text

dzenFg, dzenBg :: Color -> Text -> Text
dzenFg color string = format "^fg({}){}^fg()" (color, string)
dzenBg color string = format "^bg({}){}^bg()" (color, string)


-- lemonbar, enumerate the mouse buttons
data MouseButton
  = LeftClick
  | MiddleClick
  | RightClick
  | ScrollUp
  | ScrollDown
  | DoubleLeftClick
  | DoubleMiddleClick
  | DOubleRightClick
  deriving (Eq, Ord, Show, Enum)

fromMouseButton :: MouseButton -> Int
fromMouseButton = succ . fromEnum

-- then we define formating in lemonbar markup
data LemonbarFormatting
  = Foreground Color
  | Background Color
  | Reverse
  | Underline Color
  | Overline Color
  | Font Int
  | Offset Int
  | Action MouseButton Text
  derving (Eq, Show)

lemonbarFormatOne :: LemonbarFormatting -> Text -> Text
lemonbarFormatOne fmt = case fmt of
  (Foreground color)      -> wrap (bracket $ format1 "F{}" color) (bracket "F-")
  (Background color)      -> wrap (bracket $ format1 "B{}" color) (bracket "B-")
  (Reverse)               -> wrap (bracket "R") (bracket "R")
  (Underline color)       -> wrap (bracket (format1 "u{}" color) <> bracket "+u") (bracket "-u")
  (Overline color)        -> wrap (bracket (format1 "o{}" color) <> bracket "+o") (bracket "-o")
  (Font index)            -> wrap (bracket (format1 "T{}" index)) (bracket "T-")
  (Offset size)           -> (bracket (format1 "O{}" size) <>)
  (Action button cmd)     -> wrap (bracket (format "A{}:{}:" (fromMouseButton button, (escape ':' cmd))))
                                  (bracket "A")
  where
    bracket = wrap "%{" "}"
    escape char =
      let charT = T.singleton char in
      T.replace charT (T.cons '\\' charT)

lemonbarFormat :: [LemonbarFormatting] -> Text -> Text
lemonbarFormat fmts = foldr (.) id (lemonbarFormatOne <$> fmts)

-- colors
onedarkBlack  = "#282c34"
onedarkRed    = "#e06c75"
onedarkGreen  = "#98c379"
onedarkYellow = "#e5c07b"
onedarkBlue   = "#61afef"
onedarkPurple = "#c678dd"
onedarkCyan   = "#56b6c2"
onedarkGrey   = "#abb2bf"

onedarkGreenDarker = "#68a349"


-- which-key
displayTextFont :: String
displayTextFont = "Iosevka:pixelsize=15"



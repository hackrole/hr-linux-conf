import XMonad
import qualified XMonad as X
import XMonad.Actions.CycleWS
import XMonad.Actions.GridSelect
import XMonad.Actions.SpawnOn
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Minimize
import XMonad.Layout.Maximize
import XMonad.Layout.Named
import XMonad.Layout.NoBorders
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig
import XMonad.Util.Run(spawnPipe)
import System.IO
import System.Exit (ExitCode(ExitSuccess), exitWith)

-- multi bar
import qualified XMonad.Hooks.DynamicBars as Bars
import qualified XMonad.Hooks.DynamicLog as DLog
import qualified XMonad.Hooks.WorkspaceHistory as WH
import qualified XMonad.Util.Run as Run


-- manage hook for auto windows
myManageHook = composeAll
    [ className =? "mpv"    --> doFloat
    , className =? "Gimp"   --> doFloat
    , className =? "Steam"  --> doFloat
    ]

{----------------
-  Colors, &c.  -
----------------}
myNormalFG    = "#ffffff"
myNormalBG    = "#000000"
myCurrentFG   = myNormalFG
myCurrentBG   = "#888888"
myVisibleFG   = myNormalFG
myVisibleBG   = "#444444"
myUrgentFG    = myNormalFG
myUrgentBG    = "#ff6600"
mySpecial1FG  = "#aaffaa"
mySpecial1BG  = myNormalBG
mySpecial2FG  = "#ffaaff"
mySpecial2BG  = myNormalBG
mySeparatorFG = "#000066"
mySeparatorBG = "#000033"
myCopyFG      = "#ff0000"

myFont = "xft:Hack-12"

-- my log hook for status bar
-- trayer = "trayer --edge top --align right --SetDockType true --SetPartialStrut true " ++
--          "--expand true --width 7 --transparent true --tint 0x0c1014 --alpha 0 --height 15"
-- myStatusBar = "conky | dzen2 -w 1695 -ta r -h 16 -x 210 -fn \"WenQuanYi Zen Hei:size=10\""
-- myXmonadBar = "dzen2 -w 210 -ta l -h 16 -fn \"WenQuanYi Zen Hei:size=10\""


-- myLogPP :: DLog.PP
-- myLogPP = DLog.defaultPP
--   { DLog.ppCurrent = DLog.xmobarColor myCurrentFG myCurrentBG . DLog.pad
--   , DLog.ppVisible = DLog.xmobarColor myVisibleFG myVisibleBG . DLog.pad
--   , DLog.ppHidden  = DLog.xmobarColor myNormalFG myNormalBG
--   , DLog.ppUrgent  = DLog.xmobarColor myUrgentFG myUrgentBG . DLog.wrap ">" "<" . DLog.xmobarStrip
--   , DLog.ppTitle   = DLog.xmobarColor mySpecial1FG mySpecial1BG . DLog.shorten 75
--   , DLog.ppLayout  = DLog.xmobarColor mySpecial2FG mySpecial2BG
--   , DLog.ppSep     = DLog.pad $ DLog.xmobarColor mySeparatorFG mySeparatorBG "|"
--   }

-- myLogPPActive :: DLog.PP
-- myLogPPActive = myLogPP
--   { DLog.ppCurrent = DLog.xmobarColor myCurrentBG myCurrentFG . DLog.pad
--   }

barCreator :: Bars.DynamicStatusBar
barCreator (X.S sid) = Run.spawnPipe $ "xmobar --screen " ++ show sid

barDestroyer :: Bars.DynamicStatusBarCleanup
barDestroyer = return ()


myStartupHook = do
  Bars.dynStatusBarStartup barCreator barDestroyer
  spawn "xrandr --output DP-1-3 --primary --auto --left-of eDP-1-1  --output eDP-1-1 --auto"
  spawn "/usr/bin/stalonetray"
  spawn "nm-applet"
  spawnOnce "compton -b"
  spawnOnce "fcitx &"
  spawnOnce "sleep 3; xmodmap /home/hackrole/.xmodmap"
  spawnOn "1" "termite"
  spawnOn "4" "telegram-desktop"

myTerminal = "gnome-terminal"

myKeys = [ ("C-t C", spawn "chromium")
         , ("C-t t", spawn "gnome-terminal")
         , ("C-t e", spawn "emacs")
         , ("M-z", spawn "amixer set Master 3%-")
         , ("M-x", spawn "amixer set Master 3%+")
         , ("M-u", spawn "mpc prev")
         , ("M-i", spawn "mpc next")
         , ("M-p", spawn "mpc toggle")
         , ("M-s", spawn "scrot")
         , ("M-S-s", spawn "sleep 0.5 && scrot -s")
         , ("M-o", spawn "rofi -show run")
         , ("M-S-d r", spawn "pkill trayer; pkill dzen2; xmonad --recompile; xmonad --restart")
         , ("M-S-d q", X.io (exitWith ExitSuccess))
         , ("M-g", goToSelected def)
         -- , ("M-v", withFocused minimizeWindow)
         , ("M-f", withFocused (sendMessage . maximizeRestore))
         -- , ("M-S-v", sendMessage RestoreNextMinimizedWin)
         , ("M-b", sendMessage ToggleStruts)
         , ("M-<Tab>", moveTo Next NonEmptyWS)
         , ("M-S-<Tab>", moveTo Prev NonEmptyWS)
         ]
main = do
    -- spawn trayer
    -- spawn myStatusBar
    -- dzproc <- spawnPipe myXmonadBar
    (xmonad $ ewmh) =<< DLog.dzen desktopConfig
        { manageHook = manageDocks <+> manageSpawn <+> myManageHook <+> manageHook desktopConfig
        , layoutHook = nameTail $ nameTail $ desktopLayoutModifiers $ smartBorders $ maximizeWithPadding 0 $ minimize $ layoutHook desktopConfig
        , startupHook = myStartupHook
        , handleEventHook = handleEventHook desktopConfig <+> fullscreenEventHook
        -- , logHook = dynamicLogWithPP $ def
        --                 { ppOutput  = hPutStrLn dzproc
        --                 , ppLayout  = dzenColor "#edb443" ""
        --                 , ppCurrent = dzenColor "#66d9ef" "" . wrap "[" "]"
        --                 , ppTitle   = (\s -> "")
        --                 }
        -- , logHook     = Bars.multiPP myLogPPActive myLogPP
        , X.handleEventHook = Bars.dynStatusBarEventHook barCreator barDestroyer
        , modMask = mod4Mask
        , terminal = myTerminal
        , focusedBorderColor = "#599cab"
        , borderWidth = 1
        } `additionalKeysP` myKeys


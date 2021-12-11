----------------------------------------------
-- move windows
----------------------------------------------
global_logger = hs.logger.new("debug", "debug")

hs.hotkey.bind({"alt", "ctrl"}, "h", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind({"alt", "ctrl"}, "l", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + max.w / 2
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind({"alt", "ctrl"}, "k", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h / 2
    win:setFrame(f)
end)

hs.hotkey.bind({"alt", "ctrl"}, "j", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y + max.h / 2
    f.w = max.w
    f.h = max.h / 2
    win:setFrame(f)
end)

hs.hotkey.bind({"alt", "ctrl"}, "Left", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end)

hs.hotkey.bind({"alt", "ctrl"}, "Down", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y + max.h / 2
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end)

hs.hotkey.bind({"alt", "ctrl"}, "Up", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + max.w / 2
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end)

hs.hotkey.bind({"alt", "ctrl"}, "Down", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + max.w / 2
    f.y = max.y + max.h / 2
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end)


----------------------------------------------
-- max/min/close/kill window
----------------------------------------------
hs.hotkey.bind({"alt", "ctrl"}, "f", function()
    local win = hs.window.focusedWindow()
    if win ~= nil then
        win:setFullScreen(not win:isFullScreen())
    end
end)

hs.hotkey.bind({"alt", "ctrl"}, "m", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind({"alt", "ctrl"}, "n", function()
    local win = hs.window.focusedWindow()
    if win ~= nil then
        win:minimize()
    end
end)

hs.hotkey.bind({"alt", "ctrl"}, "c", function()
    local win = hs.window.focusedWindow()
    if win ~= nil then
        win:close()
    end
end)

hs.hotkey.bind({"alt", "ctrl"}, "q", function()
    local win = hs.window.focusedWindow()
    if win ~= nil then
        win:application():kill()
    end
end)

----------------------------------------------
-- lauch application
----------------------------------------------
hs.hotkey.bind({'ctrl', 'cmd'}, 'i', function()
    ret = hs.application.launchOrFocus('iTerm')
end)

hs.hotkey.bind({'cmd', 'ctrl'}, 'g', function()
    ret = hs.application.launchOrFocus('MacVim')
end)

hs.hotkey.bind({'cmd', 'ctrl'}, 'c', function()
    ret = hs.application.launchOrFocus('Google Chrome')
end)

hs.hotkey.bind({'cmd', 'ctrl', 'shift'}, 'd', function()
    ret = hs.application.launchOrFocus('DingTalk')
end)

hs.hotkey.bind({'cmd', 'ctrl'}, 'f', function()
    ret = hs.application.launchOrFocus('Firefox Developer Edition')
end)

--hs.hotkey.bind({'cmd', 'ctrl'}, 'e', function()
--    ret = hs.application.launchOrFocus('Emacs')
--end)
hs.hotkey.bind({"cmd", "ctrl"}, "e", function()
    local wins = hs.window.allWindows()
    local win = nil
    for k, v in pairs(wins) do
        if v:application():name() == "Emacs" then
            win = v
        end
    end

    global_logger.d("emacs window value: ", win)
    if win == nil then
        hs.execute("nohup /usr/local/bin/emacs >/dev/null &2>&1 &")
    else
        win:focus()
    end
end)


hs.hotkey.bind({"cmd", "ctrl"}, "d", function()
    local wins = hs.window.allWindows()
    local win = nil
    for k, v in pairs(wins) do
        if v:application():name() == "Emacs" then
            win = v
        end
    end

    global_logger.d("emacs window value: ", win)
    if win == nil then
        hs.execute("nohup /usr/local/bin/emacs --with-profile doom >/dev/null &2>&1 &")
    else
        win:focus()
    end
end)

hs.hotkey.bind({'cmd', 'ctrl'}, 'w', function()
    ret = hs.application.launchOrFocus('WeChat')
end)

hs.hotkey.bind({'cmd', 'ctrl'}, 'p', function()
    ret = hs.application.launchOrFocus('QQ')
end)

hs.hotkey.bind({'cmd', 'ctrl'}, 'm', function()
    ret = hs.application.launchOrFocus('Mail')
end)

hs.hotkey.bind({'cmd', 'ctrl'}, 'v', function()
    ret = hs.application.launchOrFocus('Visual Studio Code')
end)

--hs.hotkey.bind({"cmd", "ctrl"}, "v", function()
--    ret = hs.application.launchOrFocus("VMware Fusion.app")
--end)

hs.hotkey.bind({"cmd", "ctrl"}, "j", function()
    ret = hs.application.launchOrFocus("IntelliJ IDEA.app")
end)

hs.hotkey.bind({"cmd", "ctrl"}, "n", function()
    local win = hs.window.get('NyaoVim')
    global_logger.d("neovim window value: ", win)
    if win == nil then
        --local nvim = hs.task.new("/usr/bin/nohup /Users/daipeng/.nodenv/shims/nyaovim >/dev/null &2>&1 &", nil)
        --nvim:start()
        hs.execute('nohup /Users/daipeng/.nodenv/shims/nyaovim --cmd "cd ~" >/dev/null &2>&1 &')
    else
        win:focus()
    end
end)

hs.hotkey.bind({"cmd", "ctrl"}, "t", function()
    hs.application.launchOrFocus("Hammerspoon.app")
    local app = hs.application.find("hammerspoon")
    app:selectMenuItem("Console...")
end)
----------------------------------------------


----------------------------------------------
-- change focus
----------------------------------------------
function focus_left()
    local win = hs.window.filter.new():setCurrentSpace(true)
    -- local win = hs.window.focusedWindow()
    if win == nil then
        return
    end
    win:focusWindowWest(nil, false, true)
    -- win:focusWindowWest(nil, nil, True)
end

function focus_right()
    local win = hs.window.filter.new():setCurrentSpace(true)
    if win == nil then
        return
    end
    win:focusWindowEast(nil, false, true)
end

function focus_north()
    local win = hs.window.filter.new():setCurrentSpace(true)
    if win == nil then
        return
    end
    win:focusWindowNorth(nil, false, true)
end


function focus_south()
    local win = hs.window.filter.new():setCurrentSpace(true)
    if win == nil then
        return
    end
    win:focusWindowEast()
end

hs.hotkey.bind({'cmd', "shift"}, 'h', focus_left)
hs.hotkey.bind({'cmd', "shift"}, 'l', focus_right)
hs.hotkey.bind({'cmd', "shift"}, 'j', focus_south)
hs.hotkey.bind({'cmd', "shift"}, 'k', focus_north)

-- change focus with hints. not use now.
hs.hotkey.bind({'cmd', 'alt'}, 'p', hs.hints.windowHints)
hs.hotkey.bind({'cmd'}, 'p', hs.hints.windowHints)

-- draw red border for focus window
global_border = nil

function redrawBorder()
    win = hs.window.focusedWindow()
    if win ~= nil then
        top_left = win:topLeft()
        size = win:size()
        if global_border ~= nil then
            global_border:delete()
        end
        global_border = hs.drawing.rectangle(hs.geometry.rect(top_left['x'], top_left['y'], size['w'], size['h']))
        global_border:setStrokeColor({["red"]=1,["blue"]=0,["green"]=0,["alpha"]=0.8})
        global_border:setFill(false)
        global_border:setStrokeWidth(8)
        global_border:show()
    end
end

redrawBorder()

allwindows = hs.window.filter.new(nil)
allwindows:subscribe(hs.window.filter.windowCreated, function () redrawBorder() end)
allwindows:subscribe(hs.window.filter.windowFocused, function () redrawBorder() end)
allwindows:subscribe(hs.window.filter.windowMoved, function () redrawBorder() end)
allwindows:subscribe(hs.window.filter.windowUnfocused, function () redrawBorder() end)


---------------------------
-- cherry-clock config
---------------------------
hs.loadSpoon("Cherry")
spoon.Cherry.duration = 30
spoon.Cherry.notification = hs.notify.new({ title = "Done! 🍒", withdrawAfter = 1})
mapping = {
    start = {{"cmd", "ctrl"}, "s" }
}
spoon.Cherry:bindHotkeys(mapping)
hs.hotkey.bind({"cmd", "ctrl", "shift"}, "s", function()
    spoon.Cherry:reset()
end)


----------------------------------------------
-- move space. XXX not support by office.
----------------------------------------------


----------------------------------------------
-- move screen. XXX not use now.
----------------------------------------------
hs.hotkey.bind({'cmd', 'shift', 'alt'}, 'h', function()
    hs.window.focusedWindow():moveOneScreenWest()
end)

-- auto reload. XXX put this last
hs.window.animationDuration = 0
hs.alert.show('Config loaded!')

function reloadConfig()
    if configFileWatcher ~= nil then
        configFileWatcher:stop()
        configFileWatcher = nil
    end

    hs.reload()
end

configFileWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/init.lua", reloadConfig)
configFileWatcher:start()

local REPEAT_FASTER = 10 * 1000
local REPEAT_SLOWER = 100 * 1000
local NO_REPEAT = -1

local function keyStroke(mod, key, repeatDelay)
    hs.eventtap.event.newKeyEvent(mod, key, true):post()
    if repeatDelay <= 0 then
        repeatDelay = REPEAT_FASTER
    end
    hs.timer.usleep(repeatDelay)
    hs.eventtap.event.newKeyEvent(mod, key, false):post()
end

local function keyStrokeSystem(key, repeatDelay)
    hs.eventtap.event.newSystemKeyEvent(key, true):post()
    if repeatDelay <= 0 then
        repeatDelay = REPEAT_FASTER
    end
    hs.timer.usleep(repeatDelay)
    hs.eventtap.event.newSystemKeyEvent(key, false):post()
end

-- Map sourceKey + sourceMod -> targetKey + targetMod
local function keymap(sourceKey, sourceMod, targetKey, targetMod, repatDelay)
    sourceMod = sourceMod or {}

    repeatDelay = repeatDelay or REPEAT_FASTER
    noRepeat = repeatDelay <= 0

    local fn = nil
    if targetMod == nil then
        fn = hs.fnutils.partial(keyStrokeSystem, string.upper(targetKey), repeatDelay)
    else
        targetMod = utils.splitStr(targetMod, '+')
        fn = hs.fnutils.partial(keyStroke, targetMod, targetKey, repeatDelay)
    end
    if noRepeat then
        hs.hotkey.bind(sourceMod, sourceKey, fn, nil, nil)
    else
        hs.hotkey.bind(sourceMod, sourceKey, fn, nil, fn)
    end
end

-- ------------------
-- move
-- ------------------
local arrows = {
    h = 'left',
    m = 'down',
    k = 'up',
    l = 'right'
}
for k, v in pairs(arrows) do
    keymap(k, 'alt', v, '')
    keymap(k, 'alt+ctrl', v, 'alt')
    keymap(k, 'alt+shift', v, 'shift')
    keymap(k, 'alt+shift+ctrl', v, 'alt+shift')
end

-- keymap('y', 'alt', 'home', '')
-- keymap('u', 'alt', 'end', '')
keymap('\'', 'alt', 'pageup', '')
keymap(';', 'alt', 'pagedown', '')
keymap('[', 'alt', 'end', '')
keymap('p', 'alt', 'home', '')

-- keymap('a', 'alt', 'home', '')
-- keymap('e', 'alt', 'é', '')
-- keymap('i', 'alt', 'í', '')
-- keymap('o', 'alt', 'ó', '')
-- keymap('u', 'alt', 'ú', '')
-- keymap('n', 'alt', 'ñ', '')
-- keymap('y', 'alt', 'ü', '')

-- ------------------
-- delete
-- ------------------
keymap('d', 'alt', 'delete', '')
keymap('f', 'alt', 'forwarddelete', '')
keymap('d', 'alt+shift', 'delete', 'alt')
keymap('f', 'alt+shift', 'forwarddelete', 'alt')

-- ------------------
-- functionalities
-- ------------------
-- keymap('n', 'alt', 'tab', 'ctrl+shift', REPEAT_SLOWER)
-- keymap('m', 'alt', 'tab', 'ctrl', REPEAT_SLOWER)
keymap(',', 'alt', 'tab', 'ctrl+shift', REPEAT_SLOWER)
keymap('.', 'alt', 'tab', 'ctrl', REPEAT_SLOWER)

-- keymap('q', 'alt', 'e', 'alt')
-- keymap('w', 'alt', 'n', 'alt')

-- ------------------
-- system
-- ------------------

-- keymap('p', 'alt', 'PLAY', nil, NO_REPEAT)
-- keymap('[', 'alt', 'REWIND', nil, NO_REPEAT)
-- keymap(']', 'alt', 'FAST', nil, NO_REPEAT)
-- keymap(',', 'alt', 'SOUND_DOWN', nil)
-- keymap('.', 'alt', 'SOUND_UP', nil)
-- keymap('/', 'alt', 'MUTE', nil)

-- keymap('1', 'alt', 'PLAY', nil, NO_REPEAT)
-- keymap('2', 'alt', 'REWIND', nil, NO_REPEAT)
-- keymap('3', 'alt', 'FAST', nil, NO_REPEAT)
-- keymap('f1', 'alt', 'MUTE', nil)
-- keymap('f2', 'alt', 'SOUND_DOWN', nil)
-- keymap('f3', 'alt', 'SOUND_UP', nil)


-- hs.hotkey.bind('alt', 's', hs.hid.capslock.toggle, nil, nil)

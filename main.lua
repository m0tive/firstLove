--------------------------------------------------------------------------------
-- firstLove, a simple game made in the Lua game engine `LOVE'
--------------------------------------------------------------------------------

-- Lua performance. Good reading about writing good lua :
-- http://trac.caspring.org/wiki/LuaPerformance

-- create a shutdown function
function shutdown()
    love.event.push('q')
end

window = { width = 100, height = 100 }

-- get largest display from possible fullscreen modes
local modes = love.graphics.getModes()
for i = 1, #modes do
    local mode = modes[i]
    local width = mode.width
    local height = mode.height

    if width > window.width and width > height then
        window.width = width
        window.height = height
    end
end

-- set to fullscreen and set title
local setModeOk = love.graphics.setMode(window.width, window.height, true, true, 0)
if not setModeOk then shutdown() end

--------------------------------------------------------------------------------
-- game sub-modules
require 'input'

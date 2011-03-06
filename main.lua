--------------------------------------------------------------------------------
-- firstLove, a simple game made in the Lua game engine `LOVE'
--------------------------------------------------------------------------------

-- Lua performance. Good reading about writing good lua :
-- http://trac.caspring.org/wiki/LuaPerformance

g_game = { shutdown = nil,
           window = { width = 100, height = 100 },
           dt = 0.000001,
           assets = {} }

-- create a shutdown function
function g_game.shutdown()
    love.event.push('q')
end

-- get largest display from possible fullscreen modes
local modes = love.graphics.getModes()
for i = 1, #modes do
    local mode = modes[i]
    local width = mode.width
    local height = mode.height

    if width > g_game.window.width and width > height then
        g_game.window.width = width
        g_game.window.height = height
    end
end

-- set to fullscreen
local setModeOk =
    love.graphics.setMode(g_game.window.width, g_game.window.height,
                          true, true, 0) -- fullscreen, vsync, fsaa
if not setModeOk then shutdown() end

--------------------------------------------------------------------------------
-- game sub-modules
require 'init'
require 'input'
require 'update'

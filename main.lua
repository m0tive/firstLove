--------------------------------------------------------------------------------
-- firstLove, a simple game made in the Lua game engine `LOVE'
--------------------------------------------------------------------------------

----------------------------------------
-- Lua performance. Good reading about writing good lua :
-- http://trac.caspring.org/wiki/LuaPerformance

----------------------------------------
-- game data
g_game = {
    window = {
        width = 100, height = 100,
        fullscreen = true },
    dt = 0.000001,
    state = "",
    assets = {},
    shutdown = function () love.event.push('q') end,
    menu = {},
}

----------------------------------------
-- game sub-modules
require 'init'
require 'input'
require 'update'


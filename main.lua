--------------------------------------------------------------------------------
-- firstLove, a simple game made in the Lua game engine `LOVE'
--------------------------------------------------------------------------------

----------------------------------------
-- Lua performance. Good reading about writing good lua :
-- http://trac.caspring.org/wiki/LuaPerformance

----------------------------------------
-- start the random numbers flowing
local loveTime = love.timer.getTime() + os.time()
math.randomseed( loveTime )
math.random() -- pop the first, bad random number

----------------------------------------
-- game data
g_game = {
    window = {
        width = 100, height = 100,
        center = { x = 0, y = 0 },
        fullscreen = true },
    dt = 0.000001,
    state = "",
    assets = {},

    birds = {},
    newBird = nil, -- function defined in bird.lua

    start = nil, -- function defined in game.lua

    shutdown = function () love.event.push('q') end,
    menu = {},
}

----------------------------------------
-- game sub-modules
require 'init'
require 'input'
require 'update'

require 'bird'
require 'game'

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
        centre = { x = 0, y = 0 },
        fullscreen = true },
    dt = 0.000001,
    state = "",
    substate = "",
    selection = "",

    assets = {},

    world = {
        x = 0, y = 0,
        width = 100, height = 100 },

    play = { -- functions defined in game.lua
        start = nil,
        update = nil,
        draw = nil,
        keyPressed = nil, },

    shutdown = function () love.event.push('q') end,
    menu = {},
}

----------------------------------------
g_debug = {
    track = function (id, val) end,
    update = function (dt) end,
    draw = function () end
}

require 'game_debug'
require 'game_run'

----------------------------------------
-- game sub-modules
require 'game'

require 'init'
require 'input'
require 'update'


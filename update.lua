--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
local g_debug_update = g_debug.update
local updateState = {
    play = g_game.play.update,
    quit = g_game.shutdown,
}
----------------------------------------
function love.update(dt)
    g_game.dt = dt
    g_debug_update(dt)

    local doUpdate = updateState[g_game["state"]]
    if doUpdate then doUpdate(dt) end
end

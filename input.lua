--------------------------------------------------------------------------------
-- Input functions
--------------------------------------------------------------------------------

----------------------------------------
function love.keypressed(key, unicode)
    if key == 'escape' then
        g_game.shutdown()
        return
    end

    if g_game.state == "toPlay" then
        if key == "down" then
            g_game.state = "toQuit"
        elseif key == "return" then
            g_game.state = "play"
        end
    elseif g_game.state == "toQuit" then
        if key == "return" then
            g_game.state = "quit"
        elseif key == "up" then
            g_game.state = "toPlay"
        end
    end
end


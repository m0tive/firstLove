--------------------------------------------------------------------------------
-- Input functions
--------------------------------------------------------------------------------

function love.keypressed(key, unicode)
    if key == 'escape' then
        g_game.shutdown()
        return
    end
    if gameState == "toPlay" then
        if key == "down" then
            gameState = "toQuit"
        elseif key == "return" then
            gameState = "play"
        end
    elseif gameState == "toQuit" then
        if key == "return" then
            gameState = "quit"
        elseif key == "up" then
            gameState = "toPlay"
        end
    end
end

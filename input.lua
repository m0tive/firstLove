--------------------------------------------------------------------------------
-- Input functions
--------------------------------------------------------------------------------

----------------------------------------
function love.keypressed(key, unicode)
    if key == 'escape' then
        if g_game.state == "play" then
            g_game.state = "pop"
            g_game.menu.state ="yes"
            return
        elseif g_game.state == "pop" then
            g_game.state = "play"
        end
    end


    if g_game.menu.state =="yes" then
        if key == "down" then
            g_game.menu.state = "no"
        elseif key =="return" then
            g_game.state ="play"
        end
    end

    if g_game.menu.state =="no" then
        if key == "up" then
            g_game.menu.state = "yes"
        elseif key =="return" then
            g_game.state ="quit"
        end
    end

    if g_game.menu.state == "play" then
        if key == "down" then
            g_game.menu.state = "quit"
        elseif key == "return" then
            g_game.state = "play"
            g_game.start()
        end
    end

    if g_game.menu.state == "quit" then
        if key == "up" then
            g_game.menu.state = "play"
        elseif key == "return" then
            g_game.state = "quit"
        end
    end
end

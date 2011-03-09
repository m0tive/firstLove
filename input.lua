--------------------------------------------------------------------------------
-- Input functions
--------------------------------------------------------------------------------

----------------------------------------
local function findModifiers()
    return
        love.keyboard.isDown("lshift") or love.keyboard.isDown("rshift"),
        love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl"),
        love.keyboard.isDown("lalt") or love.keyboard.isDown("ralt")
end

----------------------------------------
function love.keypressed(key, unicode)
    local shiftDown, ctrlDown, altDown = findModifiers()

    local keyString = key
    if altDown == true then keyString = "alt + " .. keyString end
    if ctrlDown == true then keyString = "ctrl + " .. keyString end
    if shiftDown == true then keyString = "shift + " .. keyString end
    g_game.lastKey = keyString
    
    if key == 'escape' then
        if g_game.state == "play" then
            g_game.state = "popMenu"
            g_game.menu.state ="yes"
            return
        elseif g_game.state == "popMenu" then
            g_game.state = "play"
        end
    end

    if key == "return" then
        if g_game.state == "startMenu" then
            if g_game.menu.state == "play" then
                g_game.state = "play"
                g_game.start()
            elseif g_game.menu.state == "quit" then
                g_game.state = "quit"
            end
        elseif g_game.state == "popMenu" then
            if g_game.menu.state == "yes" then
                g_game.menu.state = "yes"
                g_game.state = "play"
            elseif g_game.menu.state == "no" then
                g_game.menu.state = ""
                g_game.state = "quit"
            end
        end
    end

    if key == "up" then
        if g_game.state == "startMenu" then
            if g_game.menu.state == "quit" then
                g_game.menu.state = "play"
            end
        elseif g_game.state == "popMenu" then
            if g_game.menu.state == "no" then
                g_game.menu.state = "yes"
            end
        end
    end

    if key == "down" then
         if g_game.state == "startMenu" then
            if g_game.menu.state == "play" then
                g_game.menu.state = "quit"
            end
        elseif g_game.state == "popMenu" then
            if g_game.menu.state == "yes" then
                g_game.menu.state = "no"
            end
        end
    end
end

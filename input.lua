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

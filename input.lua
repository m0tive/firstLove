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
local function menuKeyPressed(key, unicode)
    if key == "up" then 
        if g_game.selection == "quit" then
            g_game.selection = "play"
        end
    elseif key == "down" then 
        if g_game.selection == "play" then
            g_game.selection = "quit"
        end
    elseif key == "return" then 
        if g_game.selection == "play" then
            g_game.state = "play"
            g_game.play.start()
        elseif g_game.selection == "quit" then
            g_game.state = "quit"
        end
    end
end

----------------------------------------
local function pauseKeyPressed(key, unicode)
    if key == "up" then 
        if g_game.selection == "no" then
            g_game.selection = "yes"
        end
    elseif key == "down" then 
        if g_game.selection == "yes" then
            g_game.selection = "no"
        end
    elseif key == "return" then 
        if g_game.selection == "yes" then
            g_game.state = "play"
        elseif g_game.selection == "no" then
            g_game.state = "quit"
        end
    elseif key == "escape" then g_game.state = "play"
    end
end

----------------------------------------
function love.keypressed(key, unicode)
    local shiftDown, ctrlDown, altDown = findModifiers()

    --_DEBUG
    local keyString = key
    if altDown == true then keyString = "alt + " .. keyString end
    if ctrlDown == true then keyString = "ctrl + " .. keyString end
    if shiftDown == true then keyString = "shift + " .. keyString end
    g_debug.lastKey = keyString
    --]]

    if g_game.state == "menu" then
        menuKeyPressed(key, unicode)
    elseif g_game.state == "play" then
        g_game.play.keyPressed(key,unicode)
    elseif g_game.state == "pause" then
        pauseKeyPressed(key, unicode)
    end

--[[
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
--]]
end

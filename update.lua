--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------

local love_graphics = love.graphics
local love_draw, love_setBackgroundColor, love_setColor, love_rectangle =
    love_graphics.draw,
    love_graphics.setBackgroundColor,
    love_graphics.setColor,
    love_graphics.rectangle

----------------------------------------
function love.update(dt)
    g_game.dt = dt
    g_debug.update(dt)
end

----------------------------------------
local function drawGame ()
    -- make the background
    love_setBackgroundColor(183, 227, 229)

    -- draw the ground
    love_setColor(51, 27, 19)
    love_rectangle("fill",
        0, g_game.world.height,
        g_game.world.width, g_game.window.height )

    -- draw all the birds
    local local_birds = g_game.birds
    local birdCount = #local_birds
    local birdImage = g_game.assets.bird
    for i = 1, birdCount do
        local bird = local_birds[i]
        if bird then
            love_draw(birdImage, bird.pos.x, bird.pos.y)
        end
    end
end

----------------------------------------
--offsetx and offsety
local function drawImageCentred(_image, _offsetX, _offsetY )
    local centreX = g_game.window.center["x"]
    local centreY = g_game.window.center["y"]

    love_draw( _image, centreX - _image:getWidth()/2 + _offsetX, centreY - _image:getHeight() / 2 + _offsetY)
end
----------------------------------------
local assets = g_game.assets
----------------------------------------
--draw start menu
local function drawMenu()
        love_setBackgroundColor(255, 255, 255)
        if g_game.selection == "play" then
            drawImageCentred(assets.menu_playHover, 0, -assets.menu_playHover:getHeight()/2)
            drawImageCentred(assets.menu_quit, 0, assets.menu_quit:getHeight()/2)
        elseif g_game.selection == "quit" then
            drawImageCentred(assets.menu_play, 0, -assets.menu_playHover:getHeight()/2)
            drawImageCentred(assets.menu_quitHover, 0, assets.menu_quit:getHeight()/2)
        end
end

----------------------------------------
--draw pop up menu
local function drawPause()
        drawImageCentred(assets.menu_pop, 0, 0)
        if g_game.selection == "yes" then
            drawImageCentred(assets.menu_yesHover, 0, -assets.menu_yes:getHeight()/5)
            drawImageCentred(assets.menu_no, 0, assets.menu_no:getHeight()/4)
        elseif g_game.selection == "no" then
            drawImageCentred(assets.menu_yes, 0, -assets.menu_no:getHeight()/5)
            drawImageCentred(assets.menu_noHover, 0, assets.menu_no:getHeight()/4)
        end
end

----------------------------------------
function love.draw()
    if g_game.state == "menu" then
        drawMenu()
    elseif g_game.state =="pause" then
        drawGame()
        drawPause()
    elseif g_game.state == "play" then
        drawGame()
    elseif g_game.state == "quit" then
        g_game.shutdown()
    end

    g_debug.draw()
end

--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------

local centreX = g_game.window.width/2
local centreY = g_game.window.height/2

local floor = { r = 51, g = 27, b = 19,
                x = 0, y = g_game.window.height - 25,
                width = g_game.window.width, height = 25 }


----------------------------------------
function love.update(dt)
    g_game.dt = dt
    g_debug.update(dt)
end

----------------------------------------
local function drawGame ()
    -- make the background
    love.graphics.setBackgroundColor(183, 227, 229)

    -- draw the ground
    love.graphics.setColor(floor.r, floor.g, floor.b)
    love.graphics.rectangle("fill", floor.x, floor.y, floor.width, floor.height )

    -- draw all the birds
    local birdCount = #g_game.birds
    local birdImage = g_game.assets.bird
    for i = 1, birdCount do
        local bird = g_game.birds[i]
        if bird then
            love.graphics.draw(birdImage, bird.pos.x, bird.pos.y)
        end
    end
end

----------------------------------------
--offsetx and offsety
local function drawImage(_image, _offsetX, _offsetY )
    love.graphics.draw( _image, centreX - _image:getWidth()/2 + _offsetX, centreY - _image:getHeight() / 2 + _offsetY)
end
----------------------------------------
local assets = g_game.assets
----------------------------------------
--draw start menu
local function drawStartMenu()
        love.graphics.setBackgroundColor(255, 255, 255)
        if g_game.menu.state == "play" then
            drawImage(assets.menu_playHover, 0, -assets.menu_playHover:getHeight()/2)
            drawImage(assets.menu_quit, 0, assets.menu_quit:getHeight()/2)
        elseif g_game.menu.state == "quit" then
            drawImage(assets.menu_play, 0, -assets.menu_playHover:getHeight()/2)
            drawImage(assets.menu_quitHover, 0, assets.menu_quit:getHeight()/2)
        end
end
----------------------------------------
--draw pop up menu
local function drawPopMenu()
        drawImage(assets.menu_pop, 0, 0)
        if g_game.menu.state == "yes" then
            drawImage(assets.menu_yesHover, 0, -assets.menu_yes:getHeight()/5)
            drawImage(assets.menu_no, 0, assets.menu_no:getHeight()/4)
        elseif g_game.menu.state == "no" then
            drawImage(assets.menu_yes, 0, -assets.menu_no:getHeight()/5)
            drawImage(assets.menu_noHover, 0, assets.menu_no:getHeight()/4)
        end
end
----------------------------------------
function love.draw()
    if g_game.state == "startMenu" then
        drawStartMenu()
    elseif g_game.state =="popMenu" then
        drawGame()
        drawPopMenu()
    elseif g_game.state == "play" then
        drawGame()
    elseif g_game.state == "quit" then
        g_game.shutdown()
    end

    g_debug.draw()
end

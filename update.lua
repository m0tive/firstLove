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
end

----------------------------------------
local function drawGame ()
    -- make the background
    love.graphics.setBackgroundColor(183, 227, 229)

    -- draw the ground
    love.graphics.setColor(floor.r, floor.g, floor.b)
    love.graphics.rectangle("fill", floor.x, floor.y, floor.width, floor.height )

    -- draw all the birds
    love.graphics.draw(g_game.assets.bird, 100, 100)
end

----------------------------------------
local function drawImage(_image, _offset)
    love.graphics.draw( _image, centreX - _image:getWidth()/2, centreY - _image:getHeight() / 2 + _offset)
end
----------------------------------------
function love.draw()
    if g_game.state == "toPlay" then
        drawImage(g_game.assets.menu_playHover, -g_game.assets.menu_playHover:getHeight()/2)
        drawImage(g_game.assets.menu_quit, g_game.assets.menu_quit:getHeight()/2)
        love.graphics.setBackgroundColor(255, 255, 255)
    elseif g_game.state == "play" then
        drawGame()
    elseif g_game.state == "toQuit" then
        drawImage(g_game.assets.menu_play, -g_game.assets.menu_playHover:getHeight()/2)
        drawImage(g_game.assets.menu_quitHover, g_game.assets.menu_quit:getHeight()/2)
        love.graphics.setBackgroundColor(255, 255, 255)
    elseif g_game.state == "quit" then
        g_game.shutdown()
    end
end

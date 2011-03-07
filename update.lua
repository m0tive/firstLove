--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------

local centreX = g_game.window.width/2
local centreY = g_game.window.height/2

local floor = { r = 51, g = 27, b = 19,
                x = 0, y = g_game.window.height - 25,
                width = g_game.window.width, height = 25 }

local dt_b_size, dt_b_index = 10, 0
local dt_buffer = {}
for i = 1, dt_b_size do dt_buffer[i] = 0 end

----------------------------------------
local function calculateFps(dt)
    -- calculate average time
    dt_buffer[dt_b_index+1] = dt

    local average = 0
    for i = 1, dt_b_size do
        average = average + dt_buffer[i]
    end

    if dt_b_index == 0 then
        g_game.fps = math.floor(0.6/(average / dt_b_size))
    end

    dt_b_index = (dt_b_index + 1)%dt_b_size
end

----------------------------------------
function love.update(dt)
    g_game.dt = dt
    calculateFps(dt)
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
local function drawDebug()
    love.graphics.setColor(0, 0, 0, 255/2)
    love.graphics.rectangle("fill", 0, 0, 50, 30)

    love.graphics.print(g_game.fps, 10, 10)
end

----------------------------------------
--offsetx and offsety
local function drawImage(_image, _offsetX, _offsetY )
    love.graphics.draw( _image, centreX - _image:getWidth()/2 + _offsetX, centreY - _image:getHeight() / 2 + _offsetY)
end

----------------------------------------
function love.draw()
    local assets = g_game.assets
    if g_game.state == "menu" then
        love.graphics.setBackgroundColor(255, 255, 255)
        if g_game.menu.state == "play" then
            drawImage(assets.menu_playHover, 0, -assets.menu_playHover:getHeight()/2)
            drawImage(assets.menu_quit, 0, assets.menu_quit:getHeight()/2)
        elseif g_game.menu.state == "quit" then
            drawImage(assets.menu_play, 0, -assets.menu_playHover:getHeight()/2)
            drawImage(assets.menu_quitHover, 0, assets.menu_quit:getHeight()/2)
        end
    elseif g_game.state =="pop" then
        drawImage(assets.menu_pop, 0, 0)
        drawGame()
        if g_game.menu.state == "yes" then
            drawImage(assets.menu_yesHover, 0, -assets.menu_yes:getHeight()/5)
            drawImage(assets.menu_no, 0, assets.menu_no:getHeight()/4)
        elseif g_game.menu.state == "no" then
            drawImage(assets.menu_yes, 0, -assets.menu_no:getHeight()/5)
            drawImage(assets.menu_noHover, 0, assets.menu_no:getHeight()/4)
        end
    elseif g_game.state == "play" then
        drawGame()
    elseif g_game.state == "quit" then
        g_game.shutdown()
    end

    drawDebug()
end

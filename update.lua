--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------

local love_graphics = love.graphics
local love_draw, love_setBackgroundColor, love_setColor, love_rectangle =
    love_graphics.draw,
    love_graphics.setBackgroundColor,
    love_graphics.setColor,
    love_graphics.rectangle

local g_game_update, g_debug_update = g_game.update, g_debug.update

----------------------------------------
function love.update(dt)
    g_game.dt = dt

    g_debug_update(dt)
    --g_game_update(dt)
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
            local pos = bird["pos"]
            love_draw(birdImage, pos["x"], pos["y"])
        end
    end
end

----------------------------------------
--offsetx and offsety
local function drawImageCentred(image, offsetX, offsetY )
    local centre = g_game["window"]["center"]

    local posX, posY =
        centre["x"] + offsetX,
        centre["y"] + offsetY

    love_draw( image,
        posX - image:getWidth()/2,
        posY - image:getHeight()/2)
end

----------------------------------------
local assets = g_game.assets

----------------------------------------
--draw start menu
local function drawMenu()
    local selection = g_game["selection"]

    -- initialise the images so they are in this scope
    local play, quit
    if selection == "play" then
        play, quit = assets["menu_playHover"],
                     assets["menu_quit"]
    elseif selection == "quit" then
        play, quit = assets["menu_play"],
                     assets["menu_quitHover"]
    else
        error( "bad selection" )
    end

    love_setBackgroundColor(255, 255, 255)
    drawImageCentred(play, 0, -play:getHeight()/2)
    drawImageCentred(quit, 0,  quit:getHeight()/2)
end

----------------------------------------
--draw pop up menu
local function drawPause()
    local selection = g_game["selection"]

    -- initialise the images so they are in this scope
    local yesbut, nobut
    if selection == "yes" then
        yesbut, nobut = assets["menu_yesHover"],
                        assets["menu_no"]
    elseif selection == "no" then
        yesbut, nobut = assets["menu_yes"],
                        assets["menu_noHover"]
    else
        error( "bad selection" )
    end

    drawImageCentred(assets.menu_pop, 0, 0)
    drawImageCentred(yesbut, 0, -yesbut:getHeight()/5)
    drawImageCentred(nobut,  0,  nobut:getHeight()/4)
end

----------------------------------------
function love.draw()
    local state = g_game["state"]

    if state == "menu" then
        drawMenu()
    elseif state =="pause" then
        drawGame()
        drawPause()
    elseif state == "play" then
        drawGame()
    elseif state == "quit" then
        g_game.shutdown()
    end

    g_debug.draw()
end

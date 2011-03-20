--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------

local love_graphics = love.graphics
local love_draw, love_setBackgroundColor, love_setColor, love_rectangle =
    love_graphics.draw,
    love_graphics.setBackgroundColor,
    love_graphics.setColor,
    love_graphics.rectangle

local g_debug_update = g_debug.update
local g_game_state = g_game.state

local updateState = {
    play = g_game.play.update,
    quit = g_game.shutdown,
}

----------------------------------------
function love.update(dt)
    g_game.dt = dt
    g_debug_update(dt)

    local doUpdate = updateState[g_game["state"]]
    if doUpdate then doUpdate(dt) end
end

----------------------------------------
--offsetx and offsety
local function drawImageCentred(image, offsetX, offsetY )
    local centre = g_game["window"]["centre"]

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

local g_game_play_draw = g_game.play.draw

local drawState = {
    menu = drawMenu,
    pause = function () g_game_play_draw() drawPause() end,
    play = g_game_play_draw,
    -- quit calling shutdown is now in update above.
}

----------------------------------------
function love.draw()
    local doDraw = drawState[g_game["state"]]
    if doDraw then doDraw() end

    g_debug.draw()
end

--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------

local posMenuX = (g_game.window.width-256)/2
local posMenuY = (g_game.window.height-256)/2-256/2

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
function love.draw()
    if g_game.state == "toPlay" then
        love.graphics.draw(menuPlayHoverImage,posMenuX,posMenuY)
        love.graphics.draw(menuQuitImage, posMenuX, posMenuY+256)
        love.graphics.setBackgroundColor(255, 255, 255)
    elseif g_game.state == "play" then
        drawGame()
    elseif g_game.state == "toQuit" then
        love.graphics.draw(menuPlayImage,posMenuX,posMenuY)
        love.graphics.draw(menuQuitHoverImage, posMenuX, posMenuY+256)
        love.graphics.setBackgroundColor(255, 255, 255)
    elseif g_game.state == "quit" then
        shutdown()
    end
end


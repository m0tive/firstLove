--------------------------------------------------------------------------------
-- bird functions
--------------------------------------------------------------------------------

local rand = math.random

local birds = {}
local function newBird(x, y)
    return {
        state = "awake",
        pos = { x = x, y = y },
        vel = { x = 0, y = 0 },
    }
end

----------------------------------------
local function preStart()
    -- Clear the bird list
    birds = {}

    local limitX, limitY =
        g_game.window.width - 16, g_game.window.height - (25 + 16)
    local birdCount = 40 -- rand(40)
    for i = 1, birdCount do
        birds[i] = newBird(rand(limitX), rand(limitY))

        local bird = birds[i]
        bird.vel.x = 1
        bird.vel.y = 1
    end
end

----------------------------------------
function g_game.play.start()
    preStart()

    g_game.substate = "start"
end

local love_graphics = love.graphics
local love_draw, love_setBackgroundColor, love_setColor, love_rectangle =
    love_graphics.draw,
    love_graphics.setBackgroundColor,
    love_graphics.setColor,
    love_graphics.rectangle

----------------------------------------
function g_game.play.update(dt)
    local vScale = dt * 100
    local nBirds = #birds
    for i = 1, nBirds do
        local bird = birds[i]
        local pos, vel = bird.pos, bird.vel
        pos.x = pos.x + vel.x * vScale
        pos.y = pos.y + vel.y * vScale
    end
end

----------------------------------------
function g_game.play.draw ()
    -- make the background
    love_setBackgroundColor(183, 227, 229)

    -- draw the ground
    love_setColor(51, 27, 19)
    love_rectangle("fill",
        0, g_game.world.height,
        g_game.world.width, g_game.window.height )

    -- draw all the birds
    local local_birds = birds
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

local keyDown = {
    escape = function()
        g_game.state = "pause"
        g_game.selection = "yes"
    end,
}

----------------------------------------
function g_game.play.keyPressed (key, unicode)
    local doKeyDown = keyDown[key]
    if doKeyDown then doKeyDown() end
end

--------------------------------------------------------------------------------
-- bird functions
--------------------------------------------------------------------------------

local g_game_birds = g_game.birds

----------------------------------------
local function preStart()
    -- Clear the bird list
    g_game.birds = {}

    local limitX, limitY =
        g_game.window.width - 16, g_game.window.height - (25 + 16)
    local birdCount = 40 -- math.random(40)
    for i = 1, birdCount do
        g_game.birds[i] =
            g_game.newBird(math.random(limitX), math.random(limitY))

        local bird = g_game.birds[i]
        bird.vel.x = 1
        bird.vel.y = 1
    end
end

----------------------------------------
function g_game.start()
    preStart()

    g_game.substate = "start"
end

----------------------------------------
function g_game.update(dt)
    local vScale = dt * 100
    local nBirds = #g_game.birds
    for i = 1, nBirds do
        local bird = g_game.birds[i]
        local pos, vel = bird.pos, bird.vel
        pos.x = pos.x + vel.x * vScale
        pos.y = pos.y + vel.y * vScale
    end
end

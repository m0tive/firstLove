--------------------------------------------------------------------------------
-- bird functions
--------------------------------------------------------------------------------

----------------------------------------
local function preStart()
    -- Clear the bird list
    g_game.birds = {}

    local center = g_game.window.center
    local birdCount = math.random(40)
    for i = 1, birdCount do
        g_game.birds[i] =
            g_game.newBird(center.x, center.y)
    end
end

----------------------------------------
function g_game.start()
    preStart()

    print( "num birds: " .. #g_game.birds )
end

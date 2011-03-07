--------------------------------------------------------------------------------
-- bird functions
--------------------------------------------------------------------------------

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
    end
end

----------------------------------------
function g_game.start()
    preStart()

    print( "num birds: " .. #g_game.birds )
end

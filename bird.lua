--------------------------------------------------------------------------------
-- bird functions
--------------------------------------------------------------------------------

----------------------------------------
function g_game.newBird(x, y)
    return {
        state = "awake",
        pos = { x = x, y = y },
    }
end

--set menu state
gameState = "toPlay"
--------------------------------------------------------------------------------
function love.load()
    -- REMEMBER. Love is delicate. All images must be power-of-2
    -- ie. 1 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192 16384
    -- read more: http://love2d.org/wiki/PO2_Syndrome

    g_game.assets.bird = love.graphics.newImage("images/bird.png")

    menuPlayImage = love.graphics.newImage("images/menuPlay.png")
    menuPlayHoverImage = love.graphics.newImage("images/menuPlayHover.png")
    menuQuitImage = love.graphics.newImage("images/menuQuit.png")
    menuQuitHoverImage = love.graphics.newImage("images/menuQuitHover.png")
end

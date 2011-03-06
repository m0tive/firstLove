--set menu state
gameState = "toPlay"
--------------------------------------------------------------------------------
function love.load()
    birdImage = love.graphics.newImage("images/bird.png")
    menuPlayImage = love.graphics.newImage("images/menuPlay.png")
    menuPlayHoverImage = love.graphics.newImage("images/menuPlayHover.png")
    menuQuitImage = love.graphics.newImage("images/menuQuit.png")
    menuQuitHoverImage = love.graphics.newImage("images/menuQuitHover.png")
end

local posMenuX = (window.width-256)/2
local posMenuY = (window.height-256)/2-256/2
function love.draw()
    if gameState == "toPlay" then
        love.graphics.draw(menuPlayHoverImage,posMenuX,posMenuY)
        love.graphics.draw(menuQuitImage, posMenuX, posMenuY+256)
        love.graphics.setBackgroundColor(255, 255, 255)
    elseif gameState == "play" then
        love.graphics.draw(birdImage, 100, 100)
        love.graphics.setBackgroundColor(255, 255, 255)
    elseif gameState == "toQuit" then
        love.graphics.draw(menuPlayImage,posMenuX,posMenuY)
        love.graphics.draw(menuQuitHoverImage, posMenuX, posMenuY+256)
        love.graphics.setBackgroundColor(255, 255, 255)
    elseif gameState == "quit" then
        shutdown()
    end
end

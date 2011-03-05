-- get largest display from possible fullscreen modes
local modes = love.graphics.getModes()
local best = { w = 0, h = 0 }
for i = 1, #modes do
    local mode = modes[i]
    local width = mode.width
    local height = mode.height

    if width > best.w and width > height then
        best.w = width
        best.h = height
    end
end

-- set to fullscreen and set title
love.graphics.setMode(best.w, best.h, true, true, 0)
love.graphics.setCaption("My First Love")

-- create a shutdown function
function shutdown()
    love.event.push('q')
end

function love.keypressed(key, unicode)
    if key == 'escape' then
        shutdown()
    end
end


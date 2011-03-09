--------------------------------------------------------------------------------
-- debug code
--------------------------------------------------------------------------------

g_debug = {
    fps = 0,
    lastKey = "",
    tracker = {}
}

----------------------------------------
local dt_b_size, dt_b_index = 10, 0
local dt_buffer = {}
for i = 1, dt_b_size do dt_buffer[i] = 0 end

function g_debug.update(dt)
    -- calculate average time
    dt_buffer[dt_b_index+1] = dt

    local average = 0
    for i = 1, dt_b_size do
        average = average + dt_buffer[i]
    end

    if dt_b_index == 0 then
        g_debug.fps = math.floor(0.6/(average / dt_b_size))
    end

    dt_b_index = (dt_b_index + 1)%dt_b_size
end

----------------------------------------
function g_debug.draw()
    love.graphics.setColor(0, 0, 0, 255/2)
    love.graphics.rectangle("fill", 0, 0, g_game.window.width, 30)

    love.graphics.print(g_debug.fps, 10, 10)
    love.graphics.print("\"" .. g_debug.lastKey .. "\"", 50, 10)
end

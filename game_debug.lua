--------------------------------------------------------------------------------
-- debug code
--------------------------------------------------------------------------------

g_debug = {
    fps = 0,
    lastKey = "",
    _tracks = {}
}

--_tracks["name"] = { buffer = {}, writePoint = 1, average = 0 }

local tracBufSize = 10

local function init_track( id, default )
    local trac = {
        buffer = {},
        writePoint = 0,
        average = default,
        last = default
    }
    for i = 1, tracBufSize do
        trac.buffer[i] = default
    end

    return trac
end

function g_debug.track( id, val )
    local trac = g_debug._tracks[id]
    if not trac then
        trac = init_track( id, 0 )
    end

    local nextWrite = trac.writePoint + 1
    trac.buffer[nextWrite] = val
    trac.last = val

    local total = 0
    for i = 1, tracBufSize do
        total = total + trac.buffer[i]
    end

    trac.average = total / tracBufSize
    trac.writePoint = nextWrite % tracBufSize

    g_debug._tracks[id] = trac
end

----------------------------------------
local dt_b_size, dt_b_index = 10, 0
local dt_buffer = {}
for i = 1, dt_b_size do dt_buffer[i] = 0 end

----------------------------------------
function g_debug.update(dt)
    g_debug.track("fps", math.floor(0.6/dt))
end


local draw_skip = 0
local draw_tracks = {}
----------------------------------------
function g_debug.draw()
    if draw_skip == 0 then
        local i = 1
        draw_tracks = {}
        for k, v in pairs(g_debug._tracks) do
            if v then
                draw_tracks[i] = { key = k, val = v.average }
                i = i + 1
            end
        end
    end
    draw_skip = (draw_skip + 1) % 10

    love.graphics.setColor(0, 0, 0, 255/2)
    love.graphics.rectangle("fill", 0, 0, 150, g_game.window.height)

    love.graphics.print("\"" .. g_debug.lastKey .. "\"", 10, 10)

    local height = 10
    for i = 1, #draw_tracks do
        height = height + 20
        love.graphics.print(draw_tracks[i].key .. " :", 10, height)
        love.graphics.print(draw_tracks[i].val, 70, height)
    end
end

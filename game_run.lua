function love.quit()
    print( "bye bye" )
    if love.audio then love.audio.stop() end
end

function love.run()
    if not love.graphics then error( "love.graphics is nil" ) end
    if not love.timer then error( "love.timer is nil" ) end
    if not love.update then error( "love.update is nil" ) end
    if not love.event then error( "love.event is nil" ) end
    if not love.draw then error( "love.draw is nil" ) end
    if not love.quit then error( "love.quit is nil" ) end
    --if not love.audio then error( "love.audio is nil" ) end

    local love_step, love_getDelta, love_sleep =
        love.timer.step, love.timer.getDelta, love.timer.sleep
    local love_clear, love_present =
        love.graphics.clear, love.graphics.present
    local love_poll, love_handlers = love.event.poll, love.handlers
    local love_update, love_draw =
        love.update, love.draw

    if love.load then love.load(arg) end

    local dt = 0

    -- Main loop time.
    while true do
        love_step() -- love.timer.step
        love_update(love_getDelta()) -- love.timer.getDelta

        love_clear() -- love.graphics.clear
        love_draw()

        -- Process events.
        for e,a,b,c in love_poll() do -- love.event.poll
            if e == "q" then
                if not love.quit() then
                    return
                end
            end
            love_handlers[e](a,b,c)
        end

        love_sleep(1) -- love.timer.sleep
        love_present() -- love.graphics.present
    end
end

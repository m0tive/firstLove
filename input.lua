--------------------------------------------------------------------------------
-- Input functions
--------------------------------------------------------------------------------

function love.keypressed(key, unicode)
    if key == 'escape' then
        shutdown()
    end
end

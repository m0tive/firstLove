--------------------------------------------------------------------------------
-- Load and initialise things
--------------------------------------------------------------------------------

----------------------------------------
-- get largest display from possible fullscreen modes
local modes = love.graphics.getModes()
for i = 1, #modes do
    local mode = modes[i]
    local width = mode.width
    local height = mode.height

    if width > g_game.window.width and width > height then
        g_game.window.width = width
        g_game.window.height = height
    end
end

----------------------------------------
-- set to fullscreen
local setModeOk =
    love.graphics.setMode(g_game.window.width, g_game.window.height,
                          g_game.window.fullscreen,
                          true, 0) -- vsync, fsaa buffer count
if not setModeOk then g_game.shutdown() end

----------------------------------------
function love.load()
    g_game.state = "toPlay"

    -- REMEMBER. Love is delicate. All images must be power-of-2
    -- ie. 1 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192 16384
    -- read more: http://love2d.org/wiki/PO2_Syndrome

    g_game.assets.bird = love.graphics.newImage("images/bird.png")

    g_game.assets.menu_play = love.graphics.newImage("images/menuPlay.png")
    g_game.assets.menu_playHover = love.graphics.newImage("images/menuPlayHover.png")
    g_game.assets.menu_quit = love.graphics.newImage("images/menuQuit.png")
    g_game.assets.menu_quitHover = love.graphics.newImage("images/menuQuitHover.png")
end

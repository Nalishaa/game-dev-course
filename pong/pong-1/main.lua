--[[
    push is a library that will allow us to draw our game at a virtual 
    resolution, instead of however large our window is; used to provide 
    a more retro aesthetic
]]

push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

function love.load()
    -- use nearest-neighbor filtering on upscaling and downscaling to prevent blurring of
    -- text and graphics; try removing this function to see the difference!
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- initialize window as before
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        resizable = true,
        fullscreen = false,
        vsync = true
    })

    -- initialize our virtual resolution, which will be rendered within our
    -- actual window no matter its dimensions
    push.setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, { upscale = 'normal' })
end

--[[
    Keyboard handling, called by LÖVE2D each frame;
    passes in the key we pressed so we can access
]]
function love.keypressed(key)
    -- keys can be accessed by string name
    if key == 'escape' then
        -- function LÖVE gives us to terminate application
        love.event.quit()
    end
end

--[[
    Called after update by LÖVE2D, used to draw anything to the screen, 
    updated or otherwise.
]]
function love.draw()
    -- begin rendering at virtual resolution
    push.start()

    -- condensed onto one line from last example
    -- note we are now using virtual width and height for text placement
    love.graphics.printf("Hello Pong!",0, VIRTUAL_HEIGHT / 2 - 6, VIRTUAL_WIDTH, 'center')

    -- end rendering at virtual resolution
    push.finish()
end

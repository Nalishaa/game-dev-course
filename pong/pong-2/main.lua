push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- more "retro-looking" font object we can use for any text
    smallFont = love.graphics.newFont('font.ttf',8)

    -- set LÖVE2D's active font to the smallFont object
    love.graphics.setFont(smallFont)

    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        resizable = true,
        fullscreen = false,
        vsync = true
    })

    push.setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, { upscale = 'normal' })
end

function love.keypressed(key)
    if key == 'escape' then 
        love.event.quit()
    end
end

function love.draw()
    push.start()

    -- clear the screen with a specific color; in this case, a color similar
    -- to some versions of the original Pong
    love.graphics.clear(40/255, 45/255, 52/255, 255/255)

    -- draw welcome text toward the top of the screen
    love.graphics.printf('Hello Pong!', 0, 20, VIRTUAL_WIDTH, 'center')

    -- paddles are simply rectangles we draw on the screen at certain points, as is the ball

    -- render first paddle (left side)
    love.graphics.rectangle('fill',10, 30, 5, 20)

    -- render second paddle (right side)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH - 10, VIRTUAL_HEIGHT - 50,5,20)

    -- render ball (center)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)

    push.finish()
end
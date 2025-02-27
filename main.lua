local liveRelode = require "lib/livereload"
local anim8 = require "lib/anim8"
local love = require "love"
Gravity = 144
JumpSpeed = 144
love.graphics.setDefaultFilter("nearest", "nearest")


function love.load()
    love.window.setTitle("Flappy Bird Clone")
    love.window.setMode(765, 765)
    liveRelode.reset = true

    --Player Stuff
    Player = {}
    Player.x = 400
    Player.y = 200
    Player.targetY = Player.y
    Player.lerpSpeed = 10  -- Adjust this value to control smoothing speed
    Background = love.graphics.newImage("assets/Background/Background1.png")
    Player.spritesheet = love.graphics.newImage("assets/Player/StyleBird1/Bird1-1.png")
    Player.grid = anim8.newGrid(16,16, Player.spritesheet:getWidth(), Player.spritesheet:getHeight())
    Player.animation = anim8.newAnimation(Player.grid('1-4', 1), 0.2)

    -- Collidor Stuff
    Collidor = {}
    Collidor.spriteSheet = love.graphics.newImage("assets/Tiles/Style 1/PipeStyle1.png")
    Collidor.grid = anim8.newGrid(16, 16, Collidor.spriteSheet:getWidth(), Collidor.spriteSheet:getHeight())
    Collidor.sprite = Collidor.grid('1-1', 1)

end

function love.keypressed(key)
    if key == "space" then
        Player.targetY = Player.y - JumpSpeed
    end
end

function love.update(dt)
    -- Lerp the position
    Player.y = Player.y + (Player.targetY - Player.y) * Player.lerpSpeed * dt
    
    -- Apply gravity to the target position
    Player.targetY = Player.targetY + Gravity * dt
    Player.animation:update(dt)
end

function love.draw()
    love.graphics.draw(Background, 0, 0, 0, 3)
    Player.animation:draw(Player.spritesheet, Player.x, Player.y, 0, 3 ,3, 8 , 8 )
    
end

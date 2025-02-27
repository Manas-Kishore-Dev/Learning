local liveRelode = require "lib/livereload"
local anim8 = require "lib/anim8"
local love = require "love"
local isInFrame = true

Gravity = 144
JumpSpeed = 144
love.graphics.setDefaultFilter("nearest", "nearest")


local world = love.physics.newWorld(0, 0)

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
    Player.body = love.physics.newBody(world, Player.x, Player.y, "dynamic")
    Player.shape = love.physics.newCircleShape(Player.x + 8,Player.y +8,8)
    Player.fixture = love.physics.newFixture(Player.body, Player.shape)
    
    -- Collidor Stuff
    Collidor = {}
    Collidor.spriteSheet = love.graphics.newImage("assets/Tiles/Custom/PipeStyle1.png")
    Collidor.x = 600

    
    
end

function love.keypressed(key)
    if key == "space" then
        Player.targetY = Player.y - JumpSpeed
    end
end

function love.update(dt)
    --Adding Collidor Functionalities
    world:update(dt)
    
    if Collidor.x <= -100 then
        isInFrame = false
    else
        isInFrame = true
    end
    
    -- Lerp the position
    Player.y = Player.y + (Player.targetY - Player.y) * Player.lerpSpeed * dt
    
    -- Apply gravity to the target position
    Player.targetY = Player.targetY + Gravity * dt
    Player.animation:update(dt)


    -- Updating pipe's position
    Collidor.x = Collidor.x - 100 * dt
end

function love.draw()
    love.graphics.draw(Background, 0, 0, 0, 3)
    Player.animation:draw(Player.spritesheet, Player.x, Player.y, 0, 3 ,3, 8 , 8 )
    if isInFrame then
        love.graphics.draw(Collidor.spriteSheet, Collidor.x, 455, 0, 3, 5)
    end
end

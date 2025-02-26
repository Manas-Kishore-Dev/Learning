local liveRelode = require "lib/livereload" 
local anim8 = require "lib/anim8"
local love = require "love"
Speed = 100 
love.graphics.setDefaultFilter("nearest", "nearest")


function love.load()
    -- anim8 = require "lib/anim8"
    Player = {}

    Player.x = 400
    Player.y = 200
    
end

function love.update(dt)
    if love.keyboard.isDown("k") or love.keyboard.isDown("up") then
        Player.y = Player.y - Speed * dt
    end
    if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
        Player.x = Player.x - Speed * dt
    end
    if love.keyboard.isDown("s") or love.keyboard.isDown("down") then
        Player.y = Player.y + Speed * dt
    end
    if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
        Player.x = Player.x + Speed * dt
    end
end

function love.draw()
    love.graphics.circle("fill", Player.x, Player.y, 100)
end
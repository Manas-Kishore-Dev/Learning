local love = require("love")
Speed = 100  -- speed of the player

function love.load()
    Anim8 = require("Libraries/anim8.lua")
    Player = {}

    Player.x = 400
    Player.y = 200
    Player.sprite = love.graphics.newImage("Assets/Sprite/sprite.png")
end

function love.update(dt)
    if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
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

function love.draw ()
    love.graphics.draw(Player.sprite, Player.x, Player.y, 0, 0.5)
end
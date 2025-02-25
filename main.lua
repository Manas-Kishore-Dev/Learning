local love = require("love")
function love.load()
    Player = {}

    Player.x = 400
    Player.y = 200
end

function love.update(dt)
end

function love.draw ()
    love.graphics.circle("fill", Player.x, Player.y, 100)
end 
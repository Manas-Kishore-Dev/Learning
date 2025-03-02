_G.anim8 = require 'lib/anim8'

function love.load()
    _G.player = {}
    player.x = 200
    player.y = 400
end

function love.update()
    
end

function love.draw()
    love.graphics.circle("fill",player.x , player.y , 50)
end
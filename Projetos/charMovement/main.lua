local x = 250
local dir = 1

local scale1
local scale2

local heroNigga
local heroParte

--animation parameters
local fps = 15
local frame = 1
local animTimer = 1 / fps
local numFrames = 6
local xoffset

function love.load(arg)
    -- other things
    background = love.graphics.newImage("img/africa.png")

    print("console ok")
    love.graphics.setDefaultFilter('nearest','nearest') --grapichs
    heroNigga = love.graphics.newImage("img/Char.png") --char img
    heroParte = love.graphics.newQuad(41, 90, 44, 29, heroNigga:getDimensions())
end

function love.update(dt)
    
    
        --[[  movement self
            if x > 400 or x < 120 then
        dir = dir * - 1
        heroParte = love.graphics.newQuad(40, 30, 44, 30, heroNigga:getDimensions())
    end
    x = x + dir * 1--]]

    if dt > 0.035 then return end
    animTimer = animTimer - dt
    if animTimer <= 0 then
        animTimer = 1 / fps
        frame = frame + 1
        
        if frame > numFrames then 
            frame = 1 end
  
        xoffset = 16 * frame
        heroParte:setViewport(xoffset, 32, 16,16)
    end
end

function love.draw()--wallpaper
    
    local sx = love.graphics.getWidth() / background:getWidth()
    local sy = love.graphics.getHeight() / background:getHeight()
    love.graphics.draw(background, 0, 0, 0, sx, sy) -- x: 0, y: 0, rot: 0, scale x and scale y

    love.graphics.draw(heroNigga, heroParte,x, 180, 0, 10, 10, 8,8) -- desenha na tela

    
end
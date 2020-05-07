function love.load()
    sound = love.audio.newSource("music.wav", "stream")
    love.audio.play(sound)
    image = love.graphics.newImage("whale.png")
   love.graphics.setNewFont(12)
   love.graphics.setColor(0,0,0)
   love.graphics.setBackgroundColor(255,255,255)
end

function love.update(dt)
   if love.keyboard.isDown("up") then
      num = num + 100 * dt -- this would increment num by 100 per second
   end
end
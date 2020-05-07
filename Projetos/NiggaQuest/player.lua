player={}

function player.load()

	fps = 15
	frame = 1
	animTimer = 1 / fps
	numFrames = 6
	xoffset =0 

	player.heroNigga = love.graphics.newImage("img/Char.png") --char img
    
	player.heroParte = love.graphics.newQuad(41, 90, 44, 29, player.heroNigga:getDimensions())

	player.x = 10
	player.y = 10
	player.width = 10
	player.height = 10
	player.xvel = 0
	player.yvel = 0
	player.friction = 1
	player.speed = 500
end

function player.physics(dt)
	player.x = player.x + player.xvel * dt
	player.y = player.y + player.yvel * dt
	player.xvel = player.xvel * (1 - math.min(dt*player.friction, 1))
	player.yvel = player.yvel * (1 - math.min(dt*player.friction, 1))
end

function player.move(dt)
	if love.keyboard.isDown("d") and
	player.xvel < player.speed then
		player.xvel = player.xvel + player.speed * dt
	end

	if love.keyboard.isDown("a") and
	player.xvel > -player.speed then
		player.xvel = player.xvel - player.speed * dt
	end

	if love.keyboard.isDown("s") and
	player.yvel < player.speed then
		player.yvel = player.yvel + player.speed * dt
	end

	if love.keyboard.isDown("w") and
	player.yvel > -player.speed then
		player.yvel = player.yvel - player.speed * dt
	end
end

function player.draw()
	love.graphics.draw(player.heroNigga, player.heroParte,player.x, player.y, 0, 10, 10, 8,8) -- desenha na tela

end

--functions are put here to be easily managaed in the main file
function player.LOAD()
	player.load()
end

function player.UPDATE(dt)
	player.physics(dt)
	player.move(dt)

	
    if dt > 0.035 then return end
    animTimer = animTimer - dt
    if animTimer <= 0 then
        animTimer = 1 / fps
        frame = frame + 1
        
        if frame > numFrames then 
            frame = 1 end
  
        xoffset = 16 * frame
        player.heroParte:setViewport(xoffset, 32, 16,16)
    end
end

function player.DRAW()
	player.draw()
end

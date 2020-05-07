require "dabuton"
require "player"

local number = 1

function updateFps(fps)
    number = number - fps
    return number 
end

function love.load() --carregar game
    love.graphics.setDefaultFilter('nearest','nearest') --grapichs
	player.LOAD()
    
    local flags = {	--Setting up a table called flags with data for our button
		xPos = 50,
		yPos  = 50,
		width = 100,
		height = 50,
		--Position and size
		
		color = {
			red = 0,
			green = 0,
			blue = 255,
		},
		--Color for the button
		
		border = {
			width = 2,
			red = 255,
			green = 0,
			blue = 0,
		},
		--Settings for the border
		
		onClick = {
            func = updateFps,
            args = {30},
        }
	}
	id = button.spawn(flags)	--Spawn the button
end

function love.update(dt) --update no jogo -- dt deltatime
    number = number + 1
    --button.update()
	player.UPDATE(dt)
end

function love.draw() --pro graficos
	player.DRAW()
    if number >= 60 then
        love.graphics.print("60")
        else
            love.graphics.print(number)
    end
    --button.draw()  
end
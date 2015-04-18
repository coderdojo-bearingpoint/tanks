local tank = {
	x = 200, 
	y = 200,
	angle = 0,
	scale = 0.4,
	speed = 1.3,
	rotationSpeed = 1.4,
	body = { 
		x = 214, 
		y = 140 
	},
	turret = { 
		angle = 0,
		rotationSpeed = 1.9,
		x = 125, 
		y = 76.5
	}
}

function love.load()
	tank.body.image = love.graphics.newImage("graphics/tank_body.png")
	tank.turret.image = love.graphics.newImage("graphics/tank_turret.png")
	tank.shot = love.audio.newSource("audio/tank_shot.ogg")
end

function love.draw()
	love.graphics.draw(tank.body.image, tank.x, tank.y, tank.angle, tank.scale, tank.scale, tank.body.x, tank.body.y)
	love.graphics.draw(tank.turret.image, tank.x, tank.y, tank.angle + tank.turret.angle, tank.scale, tank.scale, tank.turret.x, tank.turret.y)
end

function love.update()
	if love.keyboard.isDown("down") then
		tank.x = tank.x - tank.speed * math.cos(tank.angle)
		tank.y = tank.y - tank.speed * math.sin(tank.angle)
	end
	
	if love.keyboard.isDown("up") then
		tank.x = tank.x + tank.speed * math.cos(tank.angle)
		tank.y = tank.y + tank.speed * math.sin(tank.angle)
	end
	
	if love.keyboard.isDown("right") then
		tank.angle = tank.angle + tank.rotationSpeed * math.pi / 360
	end

	if love.keyboard.isDown("left") then
		tank.angle = tank.angle - tank.rotationSpeed * math.pi / 360
	end

	if love.keyboard.isDown("d") then
		tank.turret.angle = tank.turret.angle + tank.turret.rotationSpeed * math.pi / 360
	end

	if love.keyboard.isDown("a") then
		tank.turret.angle = tank.turret.angle - tank.turret.rotationSpeed * math.pi / 360
	end
end

function love.keypressed(key)
	if key == " " then
		love.audio.play(tank.shot)
	elseif key == "escape" then
		love.event.push('quit') 	
	end
end

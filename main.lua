local tank, turret, sound

local tank_l, tank_w = 428, 280
local turret_l, turret_w = 125, 153

local x, y = 200, 200

local tank_angle = 0
local turret_angle = 0

local scale = 0.4
local speed = 1

function love.load()
	tank = love.graphics.newImage("graphics/tank_body.png")
	turret = love.graphics.newImage("graphics/tank_turret.png")
	sound = love.audio.newSource("audio/tank_shot.ogg")
end

function love.update()
	if love.keyboard.isDown("down") then
		x = x - speed * math.cos(tank_angle)
		y = y - speed * math.sin(tank_angle)
	end
	
	if love.keyboard.isDown("up") then
		x = x + speed * math.cos(tank_angle)
		y = y + speed * math.sin(tank_angle)
	end
	
	if love.keyboard.isDown("right") then
		tank_angle = tank_angle + 2 * math.pi / 360
	end

	if love.keyboard.isDown("left") then
		tank_angle = tank_angle - 2 * math.pi / 360
	end

	if love.keyboard.isDown("d") then
		turret_angle = turret_angle + 2 * math.pi / 360
	end

	if love.keyboard.isDown("a") then
		turret_angle = turret_angle - 2 * math.pi / 360
	end
end

function love.draw()
	local x1 = x - (tank_l / 2 * math.cos(tank_angle) - tank_w / 2 * math.sin(tank_angle)) * scale
	local y1 = y - (tank_w / 2 * math.cos(tank_angle) + tank_l / 2 * math.sin(tank_angle)) * scale
	love.graphics.draw(tank, x1, y1, tank_angle, scale, scale)

	local x2 = x - (turret_l * math.cos(tank_angle + turret_angle) - turret_w / 2 * math.sin(tank_angle + turret_angle)) * scale
	local y2 = y - (turret_w / 2 * math.cos(tank_angle + turret_angle) + turret_l * math.sin(tank_angle + turret_angle)) * scale
	love.graphics.draw(turret, x2, y2, tank_angle + turret_angle, scale, scale)

	love.graphics.setColor(255, 255, 255)
	love.graphics.circle("line", x1, y1, 10)
	love.graphics.circle("line", x, y, 10)
	--love.graphics.draw(turret, x, y, angle, scale, scale)
end

function love.keypressed(key)
	if key == " " then
		love.audio.play(sound)

	elseif key == "escape" then
		love.event.push('quit') 	
	end
end

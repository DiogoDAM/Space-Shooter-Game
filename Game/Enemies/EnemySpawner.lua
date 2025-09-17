local Gordon = require("Game.Enemies.Gordon")

local EnemySpawner = tools.class:new("EnemySpawner")

function EnemySpawner:constructor(minTime, maxTime, scene)
	self.minTime = minTime or 0
	self.maxTime = maxTime or 1

	self.scene = scene

	self.timeToSpawn = 0
end

function EnemySpawner:update(dt)
	self.timeToSpawn = self.timeToSpawn - dt

	if self.timeToSpawn <= 0 then
		self.timeToSpawn = math.random(self.minTime, self.maxTime)

		self:spawnEnemy()
	end
end

function EnemySpawner:spawnEnemy()
	self.scene:add(Gordon:new(tools.newVector2(math.random(16, love.graphics.getWidth()-16), -100)), "enemies")
end

return EnemySpawner

local Player = require("Game.Player.Player")
local Gordon = require("Game.Enemies.Gordon")

local GameScene = tools.scene:extend("GameScene")

function GameScene:constructor()
	self.__super:constructor()

	self.bullets = {}

	self.bgColor = BlackColor
end

function GameScene:initialize()
	self:add(Player:new())
	self:add(Gordon:new(tools.newVector2(math.random(16, 400-16), -32)))
end

function GameScene:update(dt)
	self:updateEntities(dt)

	for _, b in pairs(self.bullets) do
		b:update(dt)
	end
end

function GameScene:addBullet(bullet)
	bullet.scene = self
	table.insert(self.bullets, bullet)
end

function GameScene:removeBullet(bullet)
	table.removeElement(self.bullets, bullet)
end

function GameScene:draw()
	self:drawEntities()

	for _, b in pairs(self.bullets) do
		b:draw()
	end

	love.graphics.setColor(WhiteColor)
	love.graphics.print(tostring(#self.entities), 10, 10)
	love.graphics.print(tostring(#self.bullets), 10, 32)
end

return GameScene

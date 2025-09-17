local Player = require("Game.Player.Player")

local GameScene = tools.scene:extend("GameScene")

function GameScene:constructor()
	self.__super:constructor()

	self.region = tools.newRegion(love.graphics.newImage("Assets/Textures/spr_bg.png"), 0, 0, 400, 800)
	self.region.image:setWrap("clamp", "repeat")
	self.bgVel = -200

	self.lists = {}
	self.lists.player = tools.newEntityList(self)
	self.lists.enemies = tools.newEntityList(self)
	self.lists.player_bullets = tools.newEntityList(self)

	self.spawner = require("Game.Enemies.EnemySpawner"):new(0, 1, self)

	self.bgColor = BlackColor
end

function GameScene:initialize()
	self:add(Player:new(), "player")
end

function GameScene:update(dt)
	self.region.y = self.region.y + self.bgVel * dt
	self.region.sourceRect = love.graphics.newQuad(self.region.x, self.region.y, self.region.w, self.region.h, self.region.image)

	self.spawner:update(dt)

	self:updateEntities(dt)
end

function GameScene:draw()
	love.graphics.setColor({1,1,1})
	love.graphics.draw(self.region.image, self.region.sourceRect, 0, 0)

	self:drawEntities()

	love.graphics.setColor(WhiteColor)

	love.graphics.print(tostring(self.lists.enemies:getSize()), 10, 10)
	love.graphics.print(tostring(self.lists.player_bullets:getSize()), 10, 32)
	love.graphics.print(tostring(self.spawner.timeToSpawn), 10, 64)

	love.graphics.printf(
		tostring(_G.GameScore),
		_G.DefaultFont,
		love.graphics.getWidth() * .5,
		100,
		100
		)

end

return GameScene

local PlayerBullet = require("Game.Bullets.PlayerBullet")

local Player = tools.entity:extend("Player")

function Player:constructor()
	self.__super:constructor()

	self.region = _G.Atlas:getRegion("spr_player")
	self.speed = 200
	self.width = 32
	self.height = 32
	self.pos = tools.newVector2(love.graphics.getWidth()/2 - self.width/2, love.graphics.getHeight()-self.height-100)
end


function Player:update(dt)
	self:move(dt)
end

function Player:draw()
	love.graphics.setColor(1,1,1)
	love.graphics.draw(self.region.image, self.region.sourceRect, self.pos.x, self.pos.y)
end

function Player:move(dt)
	local dir = tools.newVector2()

	if tools.keyboard:isDown("d") then
		dir.x = 1
	elseif tools.keyboard:isDown("a") then
		dir.x = -1
	end

	if tools.keyboard:isDown("s") then
		dir.y = 1
	elseif tools.keyboard:isDown("w") then
		dir.y = -1
	end

	if tools.keyboard:wasPressed("space") then
		self.scene:add(PlayerBullet:new(tools.newVector2(self.pos.x + self.width/2, self.pos.y)))
	end

	self.pos = self.pos + (dir * self.speed * dt)

	if self.pos.x < 0 then self.pos.x = 0
	elseif self.pos.x + self.width > love.graphics.getWidth() then self.pos.x = love.graphics.getWidth() - self.width
	end

	if self.pos.y < 0 then self.pos.y = 0
	elseif self.pos.y + self.height > love.graphics.getHeight() then self.pos.y = love.graphics.getHeight() - self.height
	end
end

return Player

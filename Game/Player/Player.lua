local PlayerBullet = require("Game.Bullets.PlayerBullet")

local Player = tools.entity:extend("Player")

function Player:constructor()
	self.__super:constructor()

	self.speed = 200
	self.width = 32
	self.height = 32
	self.pos = tools.newVector2(love.graphics.getWidth()/2 - self.width/2, love.graphics.getHeight()-self.height-100)
	self.sprite = nil
end

function Player:start()
	self.sprite = tools.newSpriteRender(_G.Atlas:getRegion("spr_player"))
end

function Player:update(dt)
	self:move(dt)

	self.sprite.pos = self.pos

end

function Player:draw()
	self.sprite:draw()
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
		_G.LaserSound:stop()
		self.scene:add(PlayerBullet:new(tools.newVector2(self.pos.x + self.width/2, self.pos.y)), "player_bullets")
		_G.LaserSound:setVolume(1)
		_G.LaserSound:play()
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

local PlayerBullet = tools.entity:extend("PlayerBullet")

function PlayerBullet:constructor(pos)
	self.__super:constructor()

	self.pos = pos
	self.width = 8
	self.height = 8
	self.speed = 400
	self.direction = tools.newVector2(0, -1)
	self.region = Atlas:getRegion("spr_playerBullet")

	self.collider = tools.newRectCollider(self.pos, self.width, self.height, self)
end

function PlayerBullet:update(dt)
	self.pos = self.pos + (self.direction * self.speed * dt)
	self.collider:setPositin(self.pos)

	if self.pos.y < -32 then self.scene:remove(self, "player_bullets") end

	if self.scene then
		for _, enemy in pairs(self.scene.lists["enemies"]:getEntities()) do
			if self.collider:collides(enemy.collider) then
					enemy.health = enemy.health - 1
					self.scene:remove(self, "player_bullets")
				end
		end
	end
end

function PlayerBullet:draw()
	love.graphics.setColor(1,1,1)
	love.graphics.draw(self.region.image, self.region.sourceRect, self.pos.x, self.pos.y)
end

return PlayerBullet

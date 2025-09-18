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
	self.collider:setPosition(self.pos)

	if self.pos.y < -32 then self.scene:remove(self, "player_bullets") end

	if self.scene then
		for _, enemy in pairs(self.scene.lists["enemies"]:getEntities()) do
			if self.collider:collides(enemy.collider) then
				enemy.health = enemy.health - 1
				self.scene:remove(self, "player_bullets")
				_G.LaserExplosionSound:stop()
				_G.LaserExplosionSound:setVolume(1)
				_G.LaserExplosionSound:play()
				end
		end
	end
end

function PlayerBullet:draw()
	self.region:draw(self.pos.x, self.pos.y, {1,1,1,1})
end

return PlayerBullet

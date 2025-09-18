local Gordon = tools.entity:extend("Gordon")

function Gordon:constructor(pos)
	self.__super:constructor()

	self.pos = pos
	self.speed = 100
	self.direction = tools.newVector2(0, 1)
	self.health = 2

	self.collider = tools.newRectCollider(self.pos, self.width, self.height, self)

	self.region = Atlas:getRegion("spr_gordon")
end

function Gordon:update(dt)
	self.pos = self.pos + (self.direction * self.speed * dt)
	self.collider:setPosition(self.pos)

	if self.pos.y > love.graphics.getHeight() + 100 then self.scene:remove(self) end

	if self.scene then
		if self.health <= 0 then
			_G.EnemyExplosionSound:stop()
			self.scene:remove(self, "enemies")
			_G.EnemyExplosionSound:setVolume(1)
			_G.EnemyExplosionSound:play()
			_G.GameScore = _G.GameScore + 10
		end
	end
end

function Gordon:draw()
	self.region:draw(self.pos.x, self.pos.y, {1, 1, 1, 1})
end

return Gordon

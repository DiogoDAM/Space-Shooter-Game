local Gordon = tools.entity:extend("Gordon")

function Gordon:constructor(pos)
	self.__super:constructor()

	self.pos = pos
	self.speed = 100
	self.direction = tools.newVector2(0, 1)
	self.health = 2

	self.region = Atlas:getRegion("spr_gordon")
end

function Gordon:update(dt)
	self.pos = self.pos + (self.direction * self.speed * dt)

	if self.pos.y > love.graphics.getHeight() + 100 then self.scene:remove(self) end
end

function Gordon:draw()
	love.graphics.setColor(1,1,1)
	love.graphics.draw(self.region.image, self.region.sourceRect, self.pos.x, self.pos.y)
end

return Gordon

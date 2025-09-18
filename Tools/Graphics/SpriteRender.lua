local Vector2 = require("Tools.Utils.Vector2")

local SpriteRender = {}

function SpriteRender:new(region)
	local o = setmetatable({}, self)
	self.__index = self

	o.region = region
	o.pos = Vector2:new()
	o.scale = Vector2:new(1,1)
	o.rotation = 0
	o.origin = Vector2:new()
	o.color = {1,1,1,1}

	return o
end

function SpriteRender:draw()
	self.region:draw(self.pos.x, self.pos.y, self.color, self.rotation, self.origin.x, self.origin.y, self.scale.x, self.scale.y)
end

return SpriteRender

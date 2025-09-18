local Vector2 = require("Tools.Utils.Vector2")
local CollisionHelper = require("Tools.Collisions.CollisionHelper")

local RectCollider = {}

function RectCollider:new(pos, w, h, object)
	local o = setmetatable({}, self)
	self.__index = self

	o.pos = pos or Vector2:new()
	o.width = w or 16
	o.height = h or 16
	o.object = object

	o.offset = Vector2:new()

	return o
end

function RectCollider:getPosition()
	return self.pos + self.offset
end

function RectCollider:move(vel)
	self.pos = self.pos + vel
end

function RectCollider:setPosition(pos)
	self.pos = pos
end

function RectCollider:collides(other)
	if getmetatable(other) == RectCollider then
		return CollisionHelper.rectWithRect(self, other)
	end
end

return RectCollider

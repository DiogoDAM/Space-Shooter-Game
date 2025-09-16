local Vector2 = {}

function Vector2:new(x, y)
	local o = setmetatable({}, self)
	self.__index = self

	o.x = x or 0
	o.y = y or 0

	return o
end

function Vector2.isVector2(v)
	return getmetatable(v) == Vector2
end

function Vector2.distance(start, target)
	if Vector2.isVector2(start) and Vector2.isVector2(target) then
		return (target-start):getMagnetude()
	end
end

function Vector2:getMagnetude()
	return math.sqrt((self.x * self.x) + (self.y * self.y))
end

function Vector2:normalize()
	local m = self:getMagnetude()

	if m == 0 then
		self.x = 0
		self.y = 0
		return
	else
		self.x = self.x / m
		self.y = self.y / m
	end
end

function Vector2:getDistance(target)
	return (target-self):getMagnetude()
end

function Vector2:clamp(minx, maxx, miny, maxy)
	if self.x < minx then self.x = minx
	elseif self.x > maxx then self.x = maxx
	end

	if self.y < miny then self.y = miny
	elseif self.y > maxy then self.y = maxy
	end
end


--Meta Methods
function Vector2:__add(other)
	if Vector2.isVector2(other) then
		return Vector2:new(self.x + other.x, self.y + other.y)
	elseif type(other) == "number" then
		return Vector2:new(self.x + other, self.y + other)
	end
end

function Vector2:__sub(other)
	if Vector2.isVector2(other) then
		return Vector2:new(self.x - other.x, self.y - other.y)
	elseif type(other) == "number" then
		return Vector2:new(self.x - other, self.y - other)
	end
end

function Vector2:__mul(other)
	if Vector2.isVector2(other) then
		return Vector2:new(self.x * other.x, self.y * other.y)
	elseif type(other) == "number" then
		return Vector2:new(self.x * other, self.y * other)
	end
end

function Vector2:__div(other)
	if Vector2.isVector2(other) then
		return Vector2:new(self.x / other.x, self.y / other.y)
	elseif type(other) == "number" then
		return Vector2:new(self.x / other, self.y / other)
	end
end


function Vector2:__eq(other)
	if Vector2.isVector2(other) then
		return self.x == other.x and self.y == other.y
	end
end

function Vector2:__lt(other)
	if Vector2.isVector2(other) then
		return self.x < other.x and self.y < other.y
	end
end

function Vector2:__le(other)
	if Vector2.isVector2(other) then
		return self.x <= other.x and self.y <= other.y
	end
end


function Vector2:__unm()
	self.x = -self.x
	self.y = -self.y
end

function Vector2:__tostring()
	return ("(X: %.2f, Y: %.2f)"):format(self.x, self.y)
end

return Vector2

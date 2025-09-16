local TextureRegion = {}

function TextureRegion:new(image, x, y, w, h)
	local o = setmetatable({}, self)
	self.__index = self

	o.x = x or 0
	o.y = y or 0
	o.w = w or 0
	o.h = h or 0

	o.image = image
	o.sourceRect = love.graphics.newQuad(x, y, w, h, image)

	return o
end

return TextureRegion

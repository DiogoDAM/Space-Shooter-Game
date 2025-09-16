local TextureRegion = require("Tools.Utils.TextureRegion")

local TextureAtlas = {}

function TextureAtlas:new(image)
	local o = setmetatable({}, self)
	self.__index = self

	o.regions = {}
	o.image = image

	return o
end

function TextureAtlas:addRegion(name, x, y, w, h)
	self.regions[name] = TextureRegion:new(self.image, x, y, w, h)
end

function TextureAtlas:addSheet(baseName, sx, sy, w, h, tx, ty)
	for y in 1 .. (tx / sx) do
		for x in 1 .. (ty / sy) do
			self.region[("%s%d"):format(baseName, (x + y)-2)] = TextureRegion:new(self.image, sx + (w * (x-1)), sy + (h * (y-1)), w, h)
		end
	end
end

function TextureAtlas:getRegion(name)
	return self.regions[name]
end

return TextureAtlas

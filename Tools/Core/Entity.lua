local Class = require("Tools.Utils.Class")
local Vector2 = require("Tools.Utils.Vector2")

local Entity = Class:new("Entity")

function Entity:constructor()
	self.name = self.__name

	self.width = 16
	self.height = 16

	self.scene = nil

	self.pos = Vector2:new()
	self.scale = Vector2:new()
	self.rotation = 0
end

return Entity

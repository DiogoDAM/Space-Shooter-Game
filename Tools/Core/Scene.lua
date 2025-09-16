require("Tools.Utils.Globals")

local Class = require("Tools.Utils.Class")

local Scene = Class:new("Scene")

function Scene:constructor()
	self.entities = {}
	self.name = self.__name
	self.bgColor = { 0.39, 0.58, 0.92, 1}
end

function Scene:add(e)
	table.insert(self.entities, e)
	e.scene = self
end

function Scene:remove(e)
	table.removeElement(self.entities, e)

	e.scene = nil
end

function Scene:contains(e)
	return table.contains(self.entities, e)
end

function Scene:getType(typename)
	for _, value in ipairs(self.entities) do
		if value.is(typename) then return value end
	end
end

function Scene:getAllType(typename)
	local entities = {}

	for _, value in ipairs(self.entities) do
		if value.is(typename) then table.insert(entities, value) end
	end

	return entities
end

function Scene:startEntities()
	for _, e in ipairs(self.entities) do
		if e.start then e:start() end
	end
end

function Scene:updateEntities(dt)
	for _, e in ipairs(self.entities) do
		if e.update then e:update(dt) end
	end
end

function Scene:drawEntities()
	love.graphics.setBackgroundColor(self.bgColor)

	for _, e in ipairs(self.entities) do
		if e.draw then e:draw() end
	end
end

return Scene

require("Tools.Utils.Globals")

local EntityList = {}

function EntityList:new(scene)
	local o = setmetatable({}, self)
	self.__index = self

	o.entities = {}
	o._toAdd = {}
	o._toRemove = {}

	if scene:is("Scene") then
		o.scene = scene
	else
		error("The value passed to EntityList not is a Scene")
	end

	return o
end

function EntityList:add(item)
	table.insert(self._toAdd, item)
end

function EntityList:remove(item)
	table.insert(self._toRemove, item)
end

function EntityList:contains(item)
	return table.contains(self.entities, item)
end

function EntityList:getEntities()
	return self.entities
end

function EntityList:getSize()
	return #self.entities
end

function EntityList:process()
	for key, item in pairs(self._toAdd) do
		table.insert(self.entities, item)
		item.scene = self.scene

		table.remove(self._toAdd, key)
	end

	for key, item in pairs(self._toRemove) do
		table.removeElement(self.entities, item)
		item.scene = nil

		table.remove(self._toRemove, key)
	end
end

function EntityList:startList()
	self:process()

	for _, item in ipairs(self.entities) do
		if item.start then item:start() end
	end
end

function EntityList:updateList(dt)
	for _, item in ipairs(self.entities) do
		if item.update then item:update(dt) end
	end

	self:process()
end

function EntityList:drawList()
	for _, item in ipairs(self.entities) do
		if item.draw then item:draw() end
	end
end

return EntityList

require("Tools.Utils.Globals")

local Class = require("Tools.Utils.Class")

local Scene = Class:new("Scene")

function Scene:constructor()
	self.lists = {}
	self.name = self.__name
	self.bgColor = { 0.39, 0.58, 0.92, 1}
end

function Scene:add(item, listName)
	if table.containsKey(self.lists, listName) then
		self.lists[listName]:add(item)
	end
end

function Scene:remove(item, listName)
	if table.containsKey(self.lists, listName) then
		self.lists[listName]:remove(item)
	end
end

function Scene:contains(item, listName)
	if table.containsKey(self.lists, listName) then
		self.lists[listName]:contains(item)
	end
end


function Scene:startEntities()
	for _, list in pairs(self.lists) do
		list:startList()
	end
end

function Scene:updateEntities(dt)
	for _, list in pairs(self.lists) do
		list:updateList(dt)
	end
end

function Scene:drawEntities()
	for _, list in pairs(self.lists) do
		list:drawList()
	end
end

return Scene

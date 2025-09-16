require("Tools.Utils.Globals")

local KeyboardManager = {}

function KeyboardManager:new()
	local o = setmetatable({}, self)
	self.__index = self

	o.prevState = {}
	o.currState = {}

	return o
end

function KeyboardManager:update()
	for key, value in pairs(self.currState) do
		self.prevState[key] = value
		self.currState[key] = love.keyboard.isDown(key)
	end
end

function KeyboardManager:isDown(key)
	if not self.currState[key] then
		self.currState[key] = false
		return false
	end

	return self.currState[key]
end

function KeyboardManager:isUp(key)
	if not self.currState[key] then
		self.currState[key] = false
		return false
	end

	return not self.currState[key]
end

function KeyboardManager:wasPressed(key)
	if not self.currState[key] then
		self.currState[key] = false
		self.prevState[key] = false
		return false
	end

	return self.currState[key] and not self.prevState[key]
end

function KeyboardManager:wasReleased(key)
	if not self.currState[key] then
		self.currState[key] = false
		self.prevState[key] = false
		return false
	end

	return not self.currState[key] and self.prevState[key]
end

return KeyboardManager

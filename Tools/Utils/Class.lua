local Class = {}

function Class:new(name, super)
	local class = {}
	class.__name = name
	class.__index = class

	if super then
		setmetatable(class, {__index = super})
		class.__super = super
	end

	function class:new(...)
		local o = setmetatable({}, class)
		if o.constructor then
			o:constructor(...)
		end

		return o
	end

	function class:extend(classname)
		return Class:new(classname, class)
	end

	function class:is(classname)
		local mt = class

		while mt do
			if mt.__name == classname then return true end

			mt = mt.__super
		end

		return false
	end

	return class
end

return Class

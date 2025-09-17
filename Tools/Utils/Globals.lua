function _G.table.removeElement(list, e)
	for key, value in ipairs(list) do
		if value == e then table.remove(list, key) end
	end
end

function _G.table.containsKey(list, e)
	for key, _ in pairs(list) do
		if key == e then return true end
	end
end

function _G.table.contains(list, e)
	for _, value in ipairs(list) do
		if value == e then return true end
	end
end

function _G.table.shallowCopy(list)
	local copy = {}

	for k, v in pairs(list) do
		copy[k] = v
	end

	return copy
end

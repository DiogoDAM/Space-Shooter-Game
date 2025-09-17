local CollisionHelper = {}

function CollisionHelper.AABB(x1, y1, w1, h1, x2, y2, w2, h2)
	return x1 <= x2 + w2 and
		x1 + w1 >= x2 and
		y1 <= y2 + h2 and
		y1 + h1 >= y2
end

function CollisionHelper.rectWithRect(col1, col2)
	local pos1 = col1:getPosition()
	local pos2 = col2:getPosition()

	return pos1.x <= pos2.x + col2.width and
		pos1.x + col1.width >= pos2.x and
		pos1.y <= pos2.y + col2.height and
		pos1.y + col1.height >= pos2.y
end

return CollisionHelper

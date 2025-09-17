local tools = {}

tools.vector2 = 	require("Tools.Utils.Vector2")
tools.class = 		require("Tools.Utils.Class")
tools.atlas =		require("Tools.Utils.TextureAtlas")
tools.region =		require("Tools.Utils.TextureRegion")

tools.entity =		require("Tools.Core.Entity")
tools.scene =		require("Tools.Core.Scene")

tools.keyboard = 	require("Tools.Inputs.KeyboardManager"):new()


function tools.newVector2(x, y)
	return tools.vector2:new(x,y)
end

function tools.newAtlas(imagePath)
	return tools.atlas:new(imagePath)
end

function tools.newRegion(imagePath, x, y, w, h)
	return tools.region:new(imagePath, x, y, w, h)
end

function tools.newEntityList(scene)
	return require("Tools.Core.Utilities.EntityList"):new(scene)
end

function tools.newRectCollider(pos, w, h, object)
	return require("Tools.Collisions.RectCollider"):new(pos, w, h, object)
end


_G.tools = tools


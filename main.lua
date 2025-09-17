require("Tools.Tools")
require("Game.Globals")

local GameScene = require("Game.Scenes.GameScene")

local gs = GameScene:new()

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")

	gs:initialize()
	gs:startEntities()
end

function love.update(dt)
	tools.keyboard:update()

	gs:update(dt)
end

function love.draw()
	gs:draw()
end

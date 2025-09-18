_G.Atlas = tools.newAtlas(love.graphics.newImage("Assets/Textures/atlas_game.png"))
_G.Atlas:addRegion("spr_player", 0, 0, 32, 32)
_G.Atlas:addRegion("spr_gordon", 0, 80, 16, 16)
_G.Atlas:addRegion("spr_playerBullet", 0, 48, 8, 8)

_G.BlackColor = { 50 / 255, 47 / 255, 41 / 255, 1 }
_G.WhiteColor = { 215 / 255, 212 / 255, 204 / 255, 1 }

_G.GameScore = 0

_G.DefaultFont = love.graphics.newFont("Assets/Fonts/windows_command_prompt.ttf", 32)

_G.LaserSound = love.audio.newSource(love.sound.newSoundData("Assets/Sounds/laserShoot.wav"))
_G.LaserExplosionSound = love.audio.newSource(love.sound.newSoundData("Assets/Sounds/laserExplosion.wav"))
_G.EnemyExplosionSound = love.audio.newSource(love.sound.newSoundData("Assets/Sounds/enemyExplosion.wav"))

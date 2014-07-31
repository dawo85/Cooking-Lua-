require '../lib/class'

PATH_IMG = {
	['bacon'] = {
		['img'] = 'img/bacon.png', 
		['imgBW'] = 'img/baconBW.png',
		['x'] = 900, 
		['y'] = 390
	},
	['cheese'] = {
		['img'] ='img/cheese.png', 
		['imgBW'] ='img/cheeseBW.png',
		['x'] = 1040, 
		['y'] = 410
	},
	['egg'] = {
		['img'] ='img/egg.png', 
		['imgBW'] = 'img/eggBW.png',
		['x'] = 900,
		['y'] = 500
	},
	['ham'] = {
		['img'] ='img/ham.png', 
		['imgBW'] = 'img/hamBW.png',
		['x'] = 990, 
		['y'] = 510
	},
	['mushroom'] = {
		['img'] = 'img/mushroom.png', 
		['imgBW'] = 'img/mushroomBW.png',
		['x'] = 950,
		['y'] = 380
	},
	['onion'] = {
		['img'] = 'img/onion.png', 
		['imgBW'] = 'img/onionBW.png',
		['x'] = 1060, 
		['y'] = 250
	},
	['pepper'] = {
		['img'] = 'img/pepper.png', 
		['imgBW'] = 'img/pepperBW.png',
		['x'] = 990, 
		['y'] = 650
	},
	['pineapple'] = {
		['img'] = 'img/pineapple.png', 
		['imgBW'] = 'img/pineappleBW.png',
		['x'] = 900, 
		['y'] = 590
	},
	['tomato'] = {
		['img']='img/tomato.png', 
		['imgBW'] = 'img/tomatoBW.png',
		['x'] = 900,
		['y'] = 275
	},
	['olive'] = {
		['img']='img/olive.png', 
		['imgBW'] = 'img/oliveBW.png',
		['x'] = 1000,
		['y'] = 275
	}
}

Ingredient = class(function(ingredient, name)
	ingredient.name = name
	ingredient.active = false
	ingredient.image = ''
end)

function Ingredient:isPosition(positionX, positionY)
	local x0 = PATH_IMG[self.name]['x']
	local y0 = PATH_IMG[self.name]['y']
	local sizeX = self.image:getWidth()
	local sizeY = self.image:getHeight()
	local x1 = x0 + sizeX
	local y1 = y0 + sizeY
	return x0 <= positionX and x1 >= positionX and y0 <= positionY and y1 >= positionY
end

function Ingredient:setActive()
	self.active = true
end

function Ingredient:setInactive()
	self.active=false
end

function Ingredient:isActive()
	return self.active
end

function Ingredient:draw()
	if self.active then
		self.image = love.graphics.newImage(PATH_IMG[self.name]['img'])
	else
		self.image = love.graphics.newImage(PATH_IMG[self.name]['imgBW'])
	end
	love.graphics.draw(self.image, PATH_IMG[self.name]['x'], PATH_IMG[self.name]['y'])
end

function Ingredient:getX()
	return PATH_IMG[self.name]['x']
end

function Ingredient:getY()
	return PATH_IMG[self.name]['y']
end

function Ingredient:getName()
	return self.name
end
require '../lib/class'
require 'src/ingredient'

FONT = 'font/LittleDaysAlt.ttf'

LIST_IMG_INGREDIENTS = {
	['tomato'] = {
		['img'] = 'img/pizzaTomato.png',
		['x'] = 145,
		['y'] = 220
	},
	['cheese'] = {
		['img'] = 'img/pizzaCheese.png',
		['x'] = 155,
		['y'] = 222
	},
	['ham'] = {
		['img'] = 'img/pizzaHam.png',
		['x'] = 190,
		['y'] = 245
	},
	['pineapple'] = {
		['img'] = 'img/pizzaPineapple.png',
		['x'] = 170,
		['y'] = 250
	},
	['mushroom'] = {
		['img'] = 'img/pizzaMushroom.png',
		['x'] = 180,
		['y'] = 250
	},
	['onion'] = {
		['img'] = 'img/pizzaOnion.png',
		['x'] = 180,
		['y'] = 250
	},
	['olive'] = {
		['img'] = 'img/pizzaOlive.png',
		['x'] = 190,
		['y'] = 250
	},
	['bacon'] = {
		['img'] = 'img/pizzaBacon.png',
		['x'] = 180,
		['y'] = 250
	},
	['pepper'] = {
		['img'] = 'img/pizzaPepper.png',
		['x'] = 195,
		['y'] = 250
	},
	['egg'] = {
		['img'] = 'img/pizzaEgg.png',
		['x'] = 245,
		['y'] = 265
	}
}

LIST_PIZZA= {
	[1] = {
		['name'] = 'Marguerita',
		['ingredients'] = {
			[1] = {'tomato', false},
			[2] = {'cheese', false}
		}
	},
	[2] = {
		['name'] = 'Quattro Stagioni',
		['ingredients'] = {
			[1] = {'tomato', false},
			[2] = {'cheese', false},
			[3] = {'ham', false},
			[4] = {'pineapple', false},
			[5] = {'mushroom', false},
			[6] = {'olive', false}
		}
	},
	[3] = {
		['name'] = 'Roasted Pepper',
		['ingredients'] = {
			[1] = {'tomato', false},
			[2] = {'cheese', false},
			[3] = {'pepper', false}
		}
	},
	[4] = {
		['name'] = 'Meat-Olive',
		['ingredients'] = {
			[1] = {'tomato', false},
			[2] = {'cheese', false},
			[3] = {'ham', false},
			[4] = {'bacon', false},
			[5] = {'olive', false}
		}
	},
	[5] = {
		['name'] = 'Bismark',
		['ingredients'] = {
			[1] = {'tomato', false},
			[2] = {'cheese', false},
			[3] = {'bacon', false},
			[4] = {'egg', false}
		}
	},
	[6] = {
		['name'] = 'Vegetarian',
		['ingredients'] = {
			[1] = {'tomato', false},
			[2] = {'cheese', false},
			[3] = {'pepper', false},
			[4] = {'onion', false},
			[5] = {'mushroom', false}
		}
	},
	[7] = {
		['name'] = 'Hawaiana',
		['ingredients'] = {
			[1] = {'tomato', false},
			[2] = {'cheese', false},
			[3] = {'ham', false},
			[4] = {'pineapple', false}
		}
	},
	[8] = {
		['name'] = 'Mediterranean',
		['ingredients'] = {
			[1] = {'tomato', false},
			[2] = {'cheese', false},
			[3] = {'ham', false},
			[4] = {'pepper', false},
			[5] = {'onion', false},
			[6] = {'olive', false}
		}
	}
}

Pizza = class(function(pizza)
	local num = math.random(table.getn(LIST_PIZZA))
	pizza.pizza = LIST_PIZZA[num]
	pizza.numIngredient = 1
end)

function Pizza.load()
	font = love.graphics.newFont(FONT,25)
	fontPizzaName = love.graphics.newFont(FONT, 30)
	pizzaIngredients = {}
end

function Pizza:update(self)
	if table.getn(pizzaIngredients) < self.numIngredient - 1 then
		local name = self.pizza['ingredients'][self.numIngredient-1][1]
		local path = LIST_IMG_INGREDIENTS[name]['img']
		local img = love.graphics.newImage(path)
		table.insert(pizzaIngredients, img)
	end
end

function Pizza:drawIngredients(self)
	local ingredients = self.pizza['ingredients']
	for i = 1, table.getn(pizzaIngredients), 1 do
		local name = self.pizza['ingredients'][i][1]
		local x = LIST_IMG_INGREDIENTS[name]['x']
		local y = LIST_IMG_INGREDIENTS[name]['y']
		love.graphics.draw(pizzaIngredients[i], x, y)
	end
end

function Pizza:drawNote(self)
	local x = 650
	local y = 50
	local namePizza = self.pizza['name']
	love.graphics.setFont(fontPizzaName)
	love.graphics.setColor(0,0,0)
	love.graphics.printf(namePizza, x, y, 0, 'left')
	y = y + 30
	local ingredients = self.pizza['ingredients']
	love.graphics.setFont(font)
	for i = 1, table.getn(ingredients), 1 do
		local name = ingredients[i][1] 
		if ingredients[i][2] then
			love.graphics.setColor(255,0,0)
		else
			love.graphics.setColor(0,0,0)
		end
		love.graphics.printf(name, x, y, 0, 'left')
		y = y + 30
	end
end

function Pizza:draw()
	Pizza:drawNote(self)
	love.graphics.setColor(255,255,255)
	Pizza:drawIngredients(self)
end

function Pizza:isIngredient(self, nameIngredient)
	return self.pizza['ingredients'][self.numIngredient][1] == nameIngredient
end

function Pizza:isFull()
	return table.getn(self.pizza['ingredients']) == self.numIngredient - 1 
end

function Pizza:checkNextIngredient(nameIngredient)
	if Pizza:isIngredient(self, nameIngredient) then
		self.pizza['ingredients'][self.numIngredient][2] = true
		self.numIngredient = self.numIngredient + 1
		Pizza:update(self)
		return true
	end
	return false;
end

function Pizza:restaure()
	for i = 1, table.getn(self.pizza['ingredients']), 1 do
		self.pizza['ingredients'][i][2] = false
	end
	pizzaIngredients = {}
end
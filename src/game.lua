require 'src/ingredient'
require 'src/pizza'

PATH_BACKGROUND = 'img/game.png'
LIST_INGREDIENTS = {'tomato', 'onion', 'ham', 'cheese', 'egg', 'pepper', 'mushroom', 'pineapple', 'bacon', 'olive'}


Game = {
	ingredients = {},
	pizza = ''
}

function Game.load()
	Game.createIngredients()
	Game.createPizza()
	background = love.graphics.newImage(PATH_BACKGROUND)
	love.mouse.setVisible(true)
	Game.pizza.load()
end

function Game.draw()
	love.graphics.draw(background)
	Game:drawIngredients()
	Game.pizza:draw()
end

function Game:drawIngredients()
	for i = 1, table.getn(Game.ingredients), 1 do
		Game.ingredients[i]:draw()
	end
	Game.pizza:draw()
end

function Game.createIngredients()
	for i = 1, table.getn(LIST_INGREDIENTS), 1 do
		ingredient = Ingredient(LIST_INGREDIENTS[i])
		table.insert(Game.ingredients, ingredient)
	end
end

function Game.createPizza()
	Game.pizza = Pizza()
end

function Game:onClick(x, y)
	local touch = false
	local i = 0
	while ( not touch and i < table.getn(Game.ingredients)) do
		i = i + 1
		touch = Game.ingredients[i]:isPosition(x, y)
	end
	if touch and not Game.ingredients[i]:isActive() then
		local name = Game.ingredients[i]:getName()
		if Game.pizza:checkNextIngredient(name) then
			Game.ingredients[i]:setActive()
			if Game.pizza:isFull() then
				Game.pizza:restaure()
				Game.createPizza()
				Game:allInactiveIngredients()
			end
		end
	end

end

function Game:allInactiveIngredients()
	for i = 1, table.getn(Game.ingredients), 1 do
		Game.ingredients[i]:setInactive()
	end
end
TITLE = 'Cooking'
TEXT = 'Press space'

Menu = {}

function Menu.load()
	font = love.graphics.newFont('font/CookieMonster.ttf',70)
    default = love.graphics.newFont(20)
    background = love.graphics.newImage('img/menu.png')
    love.mouse.setCursor(love.mouse.getSystemCursor('hand'))
    love.mouse.setVisible(false)
end

function Menu.draw()
	love.graphics.draw(background)
    love.graphics.setFont(font)
    love.graphics.printf(TITLE, 0, 475, 1200, 'center')
    love.graphics.setFont(default)
    love.graphics.printf(TEXT, 0, 550, 1200, 'center')
end
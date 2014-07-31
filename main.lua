require 'src/menu'
require 'src/game'

function love.load()
   Menu.load()
end

function love.draw()
      Menu.draw()
end

function love.keypressed(key)
   if key == ' ' then
      Game.load()
      play()
   elseif key == 'escape' then
      love.event.quit()
   end
end

play = function()

   function love.update()
   end

   function love.draw()
      Game.draw()
   end

   function love.mousepressed(x, y, button)
      Game:onClick(x, y)
   end
end

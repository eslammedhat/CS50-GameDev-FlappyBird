--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}
local MEDAL_HIGHT = 17
local MEDALS = {
    ['silver'] = love.graphics.newImage('silver_medal.png'),
    ['bronze'] = love.graphics.newImage('bronze_medal.png'),
    ['gold']   = love.graphics.newImage('gold_medal.png'),
}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end


function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')
   
    if(self.score > 75) then
        love.graphics.draw(MEDALS['gold'], VIRTUAL_WIDTH / 2 - 8, VIRTUAL_HEIGHT / 2 - 8)
        love.graphics.printf('Press Enter to Play Again!', 0, 160 + MEDAL_HIGHT, VIRTUAL_WIDTH, 'center')
    elseif(self.score > 50) then
        love.graphics.draw(MEDALS['bronze'], VIRTUAL_WIDTH / 2 - 8, VIRTUAL_HEIGHT / 2 - 8)
        love.graphics.printf('Press Enter to Play Again!', 0, 160 + MEDAL_HIGHT, VIRTUAL_WIDTH, 'center')
    elseif(self.score > 25) then
        love.graphics.draw(MEDALS['silver'], VIRTUAL_WIDTH / 2 - 8, VIRTUAL_HEIGHT / 2 - 8)
        love.graphics.printf('Press Enter to Play Again!', 0, 160 + MEDAL_HIGHT, VIRTUAL_WIDTH, 'center')
    else
        love.graphics.printf('Press Enter to Play Again!', 0, 160 , VIRTUAL_WIDTH, 'center')
    end

end
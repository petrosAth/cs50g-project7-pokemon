--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.level = Level()

    gSounds['field-music']:setLooping(true)
    gSounds['field-music']:play()

    self.dialogueOpened = false
end

function PlayState:update(dt)
    if not self.dialogueOpened and love.keyboard.wasPressed('p') then

        -- heal player pokemon
        gSounds['heal']:play()
        self.level.player.party.pokemon[1].currentHP = self.level.player.party.pokemon[1].HP

        -- show a dialogue for it, allowing us to do so again when closed
        gStateStack:push(DialogueState('Your Pokemon has been healed!',

        function()
            self.dialogueOpened = false
        end))
    end

    self.level:update(dt)
end

function PlayState:render()
    self.level:render()

    -- DEBUG remove below print() commands before pushing to cs50g
    love.graphics.setFont(gFonts['small'])
    love.graphics.print('HP: ' .. tostring(self.level.player.party.pokemon[1].HP), 5, 5)
    love.graphics.print('Attack: ' .. tostring(self.level.player.party.pokemon[1].attack), 5, 15)
    love.graphics.print('Defense: ' .. tostring(self.level.player.party.pokemon[1].defense), 5, 25)
    love.graphics.print('Speed: ' .. tostring(self.level.player.party.pokemon[1].speed), 5, 35)
end
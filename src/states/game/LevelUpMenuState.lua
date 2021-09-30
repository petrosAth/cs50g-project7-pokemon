--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

LevelUpMenuState = Class{__includes = BaseState}

function LevelUpMenuState:init(currentStats, levelUpStats)
    self.currentStats = currentStats

    local x1, x2, x3, x4 = 1, 1, 1, 1

    self.levelUpMenu = Menu {
        x = VIRTUAL_WIDTH - 208,
        y = VIRTUAL_HEIGHT - 144,
        width = 208,
        height = 144,
        items = {
            {
                text = 'HP ' .. tostring(currentStats.HP) .. ' + ' .. tostring(levelUpStats.HPInc) .. ' = ' .. tostring(currentStats.HP + levelUpStats.HPInc),
                onSelect = function()
                    -- pop menu state
                    gStateStack:pop()

                    -- pop battle state
                    gStateStack:pop()

                    -- stop victory music and resume victory music
                    gSounds['victory-music']:stop()
                    gSounds['field-music']:play()

                    gStateStack:push(FadeOutState({
                        r = 1, g = 1, b = 1
                    }, 1, function()
                        -- do nothing after fade out ends
                    end))
                end
            },
            {
                text = 'Attack ' .. tostring(currentStats.atk) .. ' + ' .. tostring(levelUpStats.atkInc) .. ' = ' .. tostring(currentStats.atk + levelUpStats.atkInc),
            },
            {
                text = 'Defense ' .. tostring(currentStats.def) .. ' + ' .. tostring(levelUpStats.defInc) .. ' = ' .. tostring(currentStats.def + levelUpStats.defInc),
            },
            {
                text = 'Speed ' .. tostring(currentStats.spd) .. ' + ' .. tostring(levelUpStats.spdInc) .. ' = ' .. tostring(currentStats.spd + levelUpStats.spdInc),
            },
        },
        selectable = false
    }
end

function LevelUpMenuState:update(dt)
    self.levelUpMenu:update(dt)
end

function LevelUpMenuState:render()
    self.levelUpMenu:render()
end
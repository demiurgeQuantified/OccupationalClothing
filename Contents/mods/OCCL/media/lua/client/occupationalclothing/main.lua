--[[OCCUPATIONAL CLOTHING
    Copyright (C) 2022 albion

    This program is free software: you can redistribute it and/or modify
    it under the terms of Version 3 of the GNU Affero General Public License as published
    by the Free Software Foundation.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

    For any questions, contact me through steam or on Discord - albion#0123
]]
if not getActivatedMods():contains('ProfessionFramework') then
    print('OCCL ERROR: Occupational Clothing requires Profession Framework: https://steamcommunity.com/sharedfiles/filedetails/?id=1343686691')
    return
end

if getActivatedMods():contains('ProfessionFrameworkB41Patch') then
    print("OCCL WARNING: 'Profession Framework Build 41 Patch' is an outdated version of the Framework and can break OCCL.")
end

OCCL = {}
OCCL.Utils = require 'occupationalclothing/utils'

local professions = {
'unemployed', 'fireofficer', 'policeofficer', 'parkranger', 'constructionworker', 'securityguard', 'carpenter', 'burglar', 'chef', 'repairman', 'farmer',
'fisherman', 'doctor', 'veteran', 'nurse', 'lumberjack', 'fitnessInstructor', 'burgerflipper', 'electrician', 'engineer', 'metalworker', 'mechanics'}
local additionalClothing = {}

local function MergeClothingTables(profession, newClothing)
    local professionTable = ProfessionFramework.getProfession(profession)
    if professionTable ~= nil then
        local allClothing = newClothing
        local existingClothing = professionTable.clothing
        for k,v in pairs(existingClothing) do
            if allClothing[k] ~= nil then
                for _,c in pairs(v) do
                    table.insert(allClothing[k], c)
                end
            else
                allClothing[k] = v
            end
        end
        return allClothing
    else
        return newClothing
    end
end

function OCCL.UpdateClothing(profession, newClothing, mod)
    mod = mod or 'Base'
    if mod == false then -- manually written module names
        ProfessionFramework.addProfession(profession, {
            clothing = MergeClothingTables(profession, newClothing)
        })
    else
        mod = mod .. '.'
        for k,v in pairs(newClothing) do
            for i,c in pairs(v) do
                newClothing[k][i] = mod .. c
            end
        end
        ProfessionFramework.addProfession(profession, {
            clothing = MergeClothingTables(profession, newClothing)
        })
    end
end


local function ClearClothing(profession)
    ProfessionFramework.addProfession(profession, {
        clothing = {
            replace = true
        }
    })
    -- clears all profession specific clothing, even vanilla
end

local function ClearAllClothing()
    for _,v in ipairs(professions) do
        ClearClothing(v)
    end
end

function OCCL.GenerateClothingTables()
    ClearAllClothing()

    OCCL.Utils.handleCallbacks(additionalClothing)

    if SandboxVars.OccupationalClothing.LegacyMethod then
        ProfessionFramework.doProfessions()
    else
        for _,profession in ipairs(professions) do
            ProfessionFramework.addClothes(profession, ProfessionFramework.getProfession(profession))
        end
    end
end

function OCCL.addAdditionalClothing(callback, condition)
    OCCL.Utils.addToCallbackTable(additionalClothing, callback, condition)
end

local old_setVisible = CharacterCreationProfession.setVisible

function CharacterCreationProfession:setVisible(visible, joypadData)
    if visible and not (self.previousScreen == 'SandboxOptionsScreen' or self.previousScreen == 'LoadGameScreen') then
        OCCL.GenerateClothingTables()
    end
    old_setVisible(self, visible, joypadData)
end

local old_setSandboxVars = SandboxOptionsScreen.setSandboxVars

function SandboxOptionsScreen:setSandboxVars()
    old_setSandboxVars(self)
    OCCL.GenerateClothingTables()
end

local old_continueLatestSaveAux = MainScreen.continueLatestSaveAux

function MainScreen.continueLatestSaveAux(fromResetLua)
    old_continueLatestSaveAux(fromResetLua)
    OCCL.GenerateClothingTables()
end

Events.OnConnected.Add(OCCL.GenerateClothingTables)
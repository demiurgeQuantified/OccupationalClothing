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
require 'occupationalclothing/main'
if not getActivatedMods():contains('ProfessionFramework') then
    return
end
local mapnameToInternal = {['Muldraugh, KY'] = 'Muldraugh', ['Rosewood, KY'] = 'Rosewood', ['Riverside, KY'] = 'Riverside', ['West Point, KY'] = 'WestPoint', ['Louisville, KY'] = 'Louisville', ['OccupiedLouisvilleKY'] = 'Louisville', ['Dixie, KY'] = 'Dixie', ['Ekron, KY'] = 'FallasLake', ['March Ridge, KY'] = 'MarchRidge', ['Valley Station, KY'] = 'ValleyStation'}

local mapTableCallbacks = {}
local blacklistCallbacks = {}
local seasonalBanCallbacks = {}

local mapClothingTables = nil
local blacklistedItems = {}

local function setSeasonalBannedItems()
    local month = SandboxVars.StartMonth -- TODO: check if game has already started, then use current month (getGameTime():getMonth())
    if getActivatedMods():contains('RandStart') then
        if SandboxVars.RSD.randomiseDate then
            month = ZombRand(1, 13)
        end
    end
    OCCL.Utils.handleCallbacks(seasonalBanCallbacks, month)
end

local function getMapClothingTables()
    if not mapClothingTables then
        setSeasonalBannedItems()
        OCCL.Utils.handleCallbacks(blacklistCallbacks)
        OCCL.Utils.handleCallbacks(mapTableCallbacks)
    end
    return mapClothingTables
end

local function removeUnwantedClothes(professionTable)
    for profession,outfitTable in pairs(professionTable) do
        for k,v in pairs(blacklistedItems) do
            local desiredType
            if k == 'Pants' then
                desiredType = nil -- removed from outfit, but still has a random eligible item in this slot
            else
                desiredType = '' -- makes sure nothing is equipped in this slot (not good for trousers)
            end
            for a,outfit in ipairs(outfitTable) do
                local outfitSlot = outfit[k]
                if outfitSlot then
                    if type(outfitSlot) == 'table' then -- outfitSlot is a table of items
                        for iterator = #outfitSlot, 1, -1 do
                            item = outfitSlot[iterator]
                            for _,blacklistedItem in ipairs(v) do
                                if item == blacklistedItem then
                                    table.remove(outfitSlot, iterator)
                                    break
                                end
                            end
                        end
                        local test = true
                        for k,v in pairs(outfitSlot) do
                            if k or v then test = false end
                        end
                        if test then
                            outfit[k] = desiredType
                        end
                    else -- outfitSlot is a single item
                        for _,blacklistedItem in ipairs(v) do
                            if outfitSlot == blacklistedItem then
                                outfit[k] = desiredType
                            end
                        end
                    end
                end
            end
        end
    end
end

function OCCL.addMapClothingTable(mapName, professionTable)
    removeUnwantedClothes(professionTable)
    if not mapClothingTables then
        mapClothingTables = {}
    end
    if not mapClothingTables[mapName] then
        mapClothingTables[mapName] = professionTable
    else
        for profession,outfits in pairs(professionTable) do
            local finalProfessionTable = mapClothingTables[mapName][profession]
            if not finalProfessionTable then
                finalProfessionTable = outfits
            else
                local i = 0
                for outfit,clothing in ipairs(outfits) do
                    i = i + 1
                    finalProfessionTable[#finalProfessionTable+outfit] = clothing
                end
            end
        end
    end
end

function OCCL.addMultiMapClothingTable(clothingTable)
    for mapName,professionTable in pairs(clothingTable) do
        OCCL.addMapClothingTable(mapName, professionTable)
    end
end

function OCCL.addOutfits(callback, condition)
    OCCL.Utils.addToCallbackTable(mapTableCallbacks, callback, condition)
end

function OCCL.addBlacklistedItems(callback, condition)
    OCCL.Utils.addToCallbackTable(blacklistCallbacks, callback, condition)
end

function OCCL.addSeasonalBannedItems(callback, condition)
    OCCL.Utils.addToCallbackTable(seasonalBanCallbacks, callback, condition)
end

function OCCL.addToBlacklist(slot, items)
    if not blacklistedItems[slot] then
        blacklistedItems[slot] = {}
    end
    if type(items) == 'table' then
        for _,v in ipairs(items) do
            table.insert(blacklistedItems[slot], v)
        end
    else
        table.insert(blacklistedItems[slot], items)
    end
end

function OCCL.addTableToBlacklist(items)
    for slot,clothingTable in pairs(items) do
        OCCL.addToBlacklist(slot, clothingTable)
    end
end

local function clearBlacklistedItems()
    blacklistedItems = {}
end

local function clearMapClothingTables()
    mapClothingTables = nil
    clearBlacklistedItems()
end

--vanilla overrides

local old_dressWithDefinitions = CharacterCreationHeader.dressWithDefinitions

function CharacterCreationHeader:dressWithDefinitions(definition, resetWornItems)
	old_dressWithDefinitions(self, definition, resetWornItems)

    local mapName
    if MapSpawnSelect.instance.selectedRegion then
        mapName = MapSpawnSelect.instance.selectedRegion['name']
        mapName = mapnameToInternal[mapName] or mapName
    else
        mapName = 'generic'
    end
        
    local mapClothingTables = getMapClothingTables()
    local mapProfessionTable = mapClothingTables[mapName] or mapClothingTables['generic'] or nil
    if mapProfessionTable then
        local desc = MainScreen.instance.desc
        local clothingTable = mapProfessionTable[desc:getProfession()]
        if not clothingTable then
            clothingTable = mapClothingTables['generic'][desc:getProfession()]
            if not clothingTable then return end
        end
        if clothingTable then
            local wantJackets = SandboxVars.OccupationalClothing.WantJackets
            local outfit = ZombRand(0, #clothingTable)+1
            clothingTable = clothingTable[outfit]
            for bodyRegion,items in pairs(clothingTable) do
                item = items[ZombRand(0, #items)+1] or items
                local item = InventoryItemFactory.CreateItem(item)
                desc:setWornItem(bodyRegion, item)
            end
        end
    end
end

local old_initPlayer = CharacterCreationMain.initPlayer

function CharacterCreationMain:initPlayer()
    old_initPlayer(self)
    clearMapClothingTables()
end

local old_onOptionMouseDown = CharacterCreationProfession.onOptionMouseDown

function CharacterCreationProfession:onOptionMouseDown(button, x, y)
	old_onOptionMouseDown(self, button, x, y)
    if button.internal == 'BACK' then
        clearMapClothingTables()
    end
end
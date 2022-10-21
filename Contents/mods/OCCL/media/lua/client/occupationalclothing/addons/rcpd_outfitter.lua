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
require 'occupationalclothing/outfitter'
require 'occupationalclothing/addons/rcpd'

local function generateRCPDMapClothingTables()
    local professionTable = {}

    professionTable['policeofficer'] = {
        {
            ['Hat'] = 'RavenCreekPDClothes.Hat_Police_RavenCreek',
            ['Jacket'] = 'RavenCreekPDClothes.Jacket_Police_RavenCreek',
            ['Shirt'] = 'RavenCreekPDClothes.Shirt_Police_RavenCreek',
            ['Tshirt'] = 'RavenCreekPDClothes.TShirt_Police_RavenCreek',
            ['TorsoExtra'] = 'Base.Vest_BulletPolice',
            ['Pants'] = 'RavenCreekPDClothes.Trousers_Police_RavenCreek',
            ['Neck'] = '',
        },
    }

    OCCL.addMapClothingTable('RavenCreek', professionTable)
end

OCCL.addOutfits(generateRCPDMapClothingTables, OCCL.RCPD.checkEnabled)

local function addRCPDBlacklistedItems()
    if not SandboxVars.OccupationalClothing.WantJackets then
        OCCL.addToBlacklist('Jacket', 'RavenCreekPDClothes.Jacket_Police_RavenCreek')
    end
end

OCCL.addBlacklistedItems(addRCPDBlacklistedItems, OCCL.RCPD.checkEnabled)

local function banRCPDSeasonalItems(month)
    if month == 12 or month < 3 then
        OCCL.addToBlacklist('Tshirt', 'RavenCreekPDClothes.TShirt_Police_RavenCreek')
    elseif month < 6 then
        OCCL.addTableToBlacklist({['Tshirt'] = 'RavenCreekPDClothes.TShirt_Police_RavenCreek',
                                ['Jacket'] = 'RavenCreekPDClothes.Jacket_Police_RavenCreek'})
    elseif month < 9 then
        OCCL.addTableToBlacklist({['Shirt'] = 'RavenCreekPDClothes.Shirt_Police_RavenCreek',
                                ['Jacket'] = 'RavenCreekPDClothes.Jacket_Police_RavenCreek'})
    else
        OCCL.addTableToBlacklist({['Tshirt'] = 'RavenCreekPDClothes.TShirt_Police_RavenCreek',
                                ['Jacket'] = 'RavenCreekPDClothes.Jacket_Police_RavenCreek'})
    end
end

OCCL.addSeasonalBannedItems(banRCPDSeasonalItems, OCCL.RCPD.checkEnabled)
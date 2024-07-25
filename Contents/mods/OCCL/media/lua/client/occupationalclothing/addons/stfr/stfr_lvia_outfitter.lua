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
require 'occupationalclothing/addons/stfr/stfr_lvia'

OCCL.Outfitter.STFR_LVIA = {}

function OCCL.Outfitter.STFR_LVIA.generateMapClothingTables()
    local professionTable = {}

    professionTable['fireofficer'] = {
        {
            ['Hat'] = 'STFR.Hat_Fireman_LVIA_Orange',
            ['Jacket'] = 'STFR.Jacket_Fireman_Khaki_LVIA',
            ['Shirt'] = 'STFR.Shirt_Fire_LVIA',
            ['Tshirt'] = {'STFR.TShirt_Profession_Fireman_Blue_LVIA', 'STFR.TShirt_Profession_Fireman_Red_LVIA', 'STFR.TShirt_Profession_Fireman_Red_LVIA02', 'STFR.TShirt_Profession_Fireman_White_LVIA',},
            ['Pants'] = 'STFR.Trousers_Fireman_Khaki_LVIA',
            ['Shoes'] = 'Base.Shoes_ArmyBoots',
        },
        {
            ['Hat'] = 'STFR.Hat_Fireman_LVIA_Red',
            ['Jacket'] = 'STFR.Jacket_Fireman_Black_LVIA',
            ['Shirt'] = 'STFR.Shirt_Fire_LVIA',
            ['Tshirt'] = {'STFR.TShirt_Profession_Fireman_Blue_LVIA', 'STFR.TShirt_Profession_Fireman_Red_LVIA', 'STFR.TShirt_Profession_Fireman_Red_LVIA02', 'STFR.TShirt_Profession_Fireman_White_LVIA',},
            ['Pants'] = 'STFR.Trousers_Fireman_Black_LVIA',
            ['Shoes'] = 'Base.Shoes_ArmyBoots',
        },
    }
    professionTable['policeofficer'] = {
        {
            ['Hat'] = 'STFR.Hat_Police_LVIA_Officer',
            ['Jacket'] = 'STFR.Jacket_Police_LVIA_Officer',
            ['Shirt'] = 'STFR.Shirt_Police_LVIA_Officer',
            ['Tshirt'] = 'STFR.TShirt_Police_LVIA_Officer',
            ['TorsoExtra'] = 'Base.Vest_BulletPolice',
            ['Pants'] = 'STFR.Trousers_Police_LVIA',
            ['Neck'] = {'STFR.Tie_Full_Police_LVIA', 'STFR.Tie_Worn_Police_LVIA',},
            ['Shoes'] = {'Base.Shoes_Black', 'Base.Shoes_Brown'},
        },
    }

    OCCL.Outfitter.addMapClothingTable('lvinternationalairport', professionTable)
end

OCCL.Outfitter.addOutfits(OCCL.Outfitter.STFR_LVIA.generateMapClothingTables, OCCL.STFR_LVIA.checkEnabled)

function OCCL.Outfitter.STFR_LVIA.addBlacklistedItems()
    if SandboxVars.OccupationalClothing.WantFireman < 3 then
        local bannedJackets = {'STFR.Jacket_Fireman_Black_LVIA', 'STFR.Jacket_Fireman_Khaki_LVIA'}
        OCCL.Outfitter.addToBlacklist('Jacket', bannedJackets)
        if SandboxVars.OccupationalClothing.WantFireman < 2 then
            local bannedTrousers = {'STFR.Trousers_Fireman_Black_LVIA', 'STFR.Trousers_Fireman_Khaki_LVIA'}
            OCCL.Outfitter.addToBlacklist('Pants', bannedTrousers)
        end
    end

    if not SandboxVars.OccupationalClothing.WantHardhats then
        local bannedHats = {'STFR.Hat_Fireman_LVIA_White', 'STFR.Hat_Fireman_LVIA_Orange', 'STFR.Hat_Fireman_LVIA_Red'}
        OCCL.Outfitter.addToBlacklist('Hat', bannedHats)
    end

    if not SandboxVars.OccupationalClothing.WantJackets then
        local bannedJackets = {'STFR.Jacket_Police_LVIA'}
        OCCL.Outfitter.addToBlacklist('Jacket', bannedJackets)
    end
end

OCCL.Outfitter.addBlacklistedItems(OCCL.Outfitter.STFR_LVIA.addBlacklistedItems, OCCL.STFR_LVIA.checkEnabled)

function OCCL.Outfitter.STFR_LVIA.banSeasonalItems(month)
    if month == 12 or month < 3 then
        OCCL.Outfitter.addToBlacklist({['Tshirt'] = {'STFR.TShirt_Police_LVIA_Officer', 'TShirt_Police_LVIA_SGT', 'TShirt_Police_LVIA_CPT'}})
    elseif month < 6 then
        OCCL.Outfitter.addTableToBlacklist({['Tshirt'] = {'STFR.TShirt_Police_LVIA_Officer', 'TShirt_Police_LVIA_SGT', 'TShirt_Police_LVIA_CPT'},
                                ['Jacket'] = {'STFR.Jacket_Police_LVIA_Officer', 'Jacket_Police_LVIA_SGT', 'Jacket_Police_LVIA_CPT'}})
    elseif month < 9 then
        OCCL.Outfitter.addTableToBlacklist({['Shirt'] = {'STFR.Shirt_Police_LVIA_Officer', 'Shirt_Police_LVIA_SGT', 'Shirt_Police_LVIA_CPT'},
                                ['Jacket'] = {'STFR.Jacket_Police_LVIA_Officer', 'Jacket_Police_LVIA_SGT', 'Jacket_Police_LVIA_CPT'}})
    else
        OCCL.Outfitter.addTableToBlacklist({['Tshirt'] = {'STFR.TShirt_Police_LVIA_Officer', 'TShirt_Police_LVIA_SGT', 'TShirt_Police_LVIA_CPT'},
                                ['Jacket'] = {'STFR.Jacket_Police_LVIA_Officer', 'Jacket_Police_LVIA_SGT', 'Jacket_Police_LVIA_CPT'}})
    end
end

OCCL.Outfitter.addSeasonalBannedItems(OCCL.Outfitter.STFR_LVIA.banSeasonalItems, OCCL.STFR_LVIA.checkEnabled)
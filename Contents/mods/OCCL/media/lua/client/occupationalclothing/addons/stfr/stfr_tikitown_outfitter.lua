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
require 'occupationalclothing/addons/stfr/stfr_tikitown'

OCCL.Outfitter.STFR_Tikitown = {}

function OCCL.Outfitter.STFR_Tikitown.generateMapClothingTables()
    local professionTable = {}

    professionTable['fireofficer'] = {
        {
            ['Hat'] = 'STFR.Hat_Fireman_Tikitown_Yellow',
            ['Jacket'] = 'STFR.Jacket_Fireman_Khaki_Tikitown',
            ['Tshirt'] = {'TShirt_Profession_Fireman_Blue_Tikitown', 'TShirt_Profession_Fireman_Red_Tikitown', 'TShirt_Profession_Fireman_Red_Tikitown02', 'TShirt_Profession_Fireman_White_Tikitown',},
            ['Pants'] = 'STFR.Trousers_Fireman_Khaki_Tikitown',
            ['Shoes'] = 'Base.Shoes_ArmyBoots',
        },
        {
            ['Hat'] = 'STFR.Hat_Fireman_Tikitown_Red',
            ['Jacket'] = 'STFR.Jacket_Fireman_Black_Tikitown',
            ['Tshirt'] = {'TShirt_Profession_Fireman_Blue_Tikitown', 'TShirt_Profession_Fireman_Red_Tikitown', 'TShirt_Profession_Fireman_Red_Tikitown02', 'TShirt_Profession_Fireman_White_Tikitown',},
            ['Pants'] = 'STFR.Trousers_Fireman_Black_Tikitown',
            ['Shoes'] = 'Base.Shoes_ArmyBoots',
        },
    }
    professionTable['policeofficer'] = {
        {
            ['Hat'] = 'STFR.Hat_Police_Tikitown_Officer',
            ['Jacket'] = 'STFR.Jacket_Police_Tikitown_Officer',
            ['Shirt'] = 'STFR.Shirt_Police_Tikitown_Officer',
            ['Tshirt'] = 'STFR.TShirt_Police_Tikitown_Officer',
            ['TorsoExtra'] = 'Base.Vest_BulletPolice',
            ['Pants'] = 'STFR.Trousers_Police_Tikitown',
            ['Neck'] = {'STFR.Tie_Full_Police_Tikitown', 'STFR.Tie_Worn_Police_Tikitown',},
        },
    }
    professionTable['nurse'] = {
        {
            ['Hat'] = 'STFR.Hat_BaseballCap_EMS_Tikitown',
            ['Jacket'] = 'STFR.Jacket_EMS_Tikitown',
            ['Shirt'] = 'STFR.Shirt_EMS_Tikitown',
            ['Tshirt'] = 'STFR.TShirt_EMS_Tikitown',
            ['Pants'] = 'STFR.Trousers_EMS_Tikitown',
        },
    }

    OCCL.Outfitter.addMapClothingTable('Tikitown', professionTable)
end

OCCL.Outfitter.addOutfits(OCCL.Outfitter.STFR_Tikitown.generateMapClothingTables, OCCL.STFR_Tikitown.checkEnabled)

function OCCL.Outfitter.STFR_Tikitown.addBlacklistedItems()
    if SandboxVars.OccupationalClothing.WantFireman < 3 then
        local bannedJackets = {'STFR.Jacket_Fireman_Black_Tikitown', 'STFR.Jacket_Fireman_Khaki_Tikitown'}
        OCCL.Outfitter.addToBlacklist('Jacket', bannedJackets)
        if SandboxVars.OccupationalClothing.WantFireman < 2 then
            local bannedTrousers = {'STFR.Trousers_Fireman_Black_Tikitown', 'STFR.Trousers_Fireman_Khaki_Tikitown'}
            OCCL.Outfitter.addToBlacklist('Pants', bannedTrousers)
        end
    end

    if not SandboxVars.OccupationalClothing.WantHardhats then
        local bannedHats = {'STFR.Hat_Fireman_Tikitown_Blue', 'STFR.Hat_Fireman_Tikitown_Black', 'STFR.Hat_Fireman_Tikitown_Red',
        'STFR.Hat_Fireman_Tikitown_Yellow'}
        OCCL.Outfitter.addToBlacklist('Hat', bannedHats)
    end

    if not SandboxVars.OccupationalClothing.WantJackets then
        local bannedJackets = {'STFR.Jacket_Police_Tikitown', 'STFR.Jacket_EMS_Tikitown'}
        OCCL.Outfitter.addToBlacklist('Jacket', bannedJackets)
    end
end

OCCL.Outfitter.addBlacklistedItems(OCCL.Outfitter.STFR_Tikitown.addBlacklistedItems, OCCL.STFR_Tikitown.checkEnabled)

function OCCL.Outfitter.STFR_Tikitown.banSeasonalItems(month)
    if month == 12 or month < 3 then
        OCCL.Outfitter.addToBlacklist({['Tshirt'] = {'STFR.TShirt_Police_Tikitown_Officer', 'TShirt_Police_Tikitown_SGT', 'TShirt_Police_Tikitown_CPT', 'STFR.TShirt_EMS_Tikitown'}})
    elseif month < 6 then
        OCCL.Outfitter.addTableToBlacklist({['Tshirt'] = {'STFR.TShirt_Police_Tikitown_Officer', 'TShirt_Police_Tikitown_SGT', 'TShirt_Police_Tikitown_CPT', 'STFR.TShirt_EMS_Tikitown'},
                                ['Jacket'] = {'STFR.Jacket_Police_Tikitown_Officer', 'Jacket_Police_Tikitown_SGT', 'Jacket_Police_Tikitown_CPT', 'STFR.Jacket_EMS_Tikitown'}})
    elseif month < 9 then
        OCCL.Outfitter.addTableToBlacklist({['Shirt'] = {'STFR.Shirt_Police_Tikitown_Officer', 'Shirt_Police_Tikitown_SGT', 'Shirt_Police_Tikitown_CPT', 'STFR.Shirt_EMS_Tikitown'},
                                ['Jacket'] = {'STFR.Jacket_Police_Tikitown_Officer', 'Jacket_Police_Tikitown_SGT', 'Jacket_Police_Tikitown_CPT', 'STFR.Jacket_EMS_Tikitown'}})
    else
        OCCL.Outfitter.addTableToBlacklist({['Tshirt'] = {'STFR.TShirt_Police_Tikitown_Officer', 'TShirt_Police_Tikitown_SGT', 'TShirt_Police_Tikitown_CPT', 'STFR.TShirt_EMS_Tikitown'},
                                ['Jacket'] = {'STFR.Jacket_Police_Tikitown_Officer', 'Jacket_Police_Tikitown_SGT', 'Jacket_Police_Tikitown_CPT', 'STFR.Jacket_EMS_Tikitown'}})
    end
end

OCCL.Outfitter.addSeasonalBannedItems(OCCL.Outfitter.STFR_Tikitown.banSeasonalItems, OCCL.STFR_Tikitown.checkEnabled)
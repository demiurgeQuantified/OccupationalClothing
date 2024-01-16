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
require 'occupationalclothing/addons/stfr/stfr_ravencreek'

OCCL.Outfitter.STFR_RavenCreek = {}

function OCCL.Outfitter.STFR_RavenCreek.generateMapClothingTables()
    local professionTable = {}

    professionTable['fireofficer'] = {
        {
            ['Hat'] = 'STFR.Hat_Fireman_RavenCreek_Yellow',
            ['Jacket'] = 'STFR.Jacket_Fireman_Khaki_RavenCreek',
            ['Tshirt'] = {'STFR.TShirt_Profession_Fireman_Blue_RavenCreek', 'STFR.TShirt_Profession_Fireman_Red_RavenCreek', 'STFR.TShirt_Profession_Fireman_Red_RavenCreek02', 'STFR.TShirt_Profession_Fireman_White_RavenCreek',},
            ['Pants'] = 'STFR.Trousers_Fireman_Khaki_RavenCreek',
            ['Shoes'] = 'Base.Shoes_ArmyBoots',
        },
        {
            ['Hat'] = 'STFR.Hat_Fireman_RavenCreek_Red',
            ['Jacket'] = 'STFR.Jacket_Fireman_Black_RavenCreek',
            ['Tshirt'] = {'STFR.TShirt_Profession_Fireman_Blue_RavenCreek', 'STFR.TShirt_Profession_Fireman_Red_RavenCreek', 'STFR.TShirt_Profession_Fireman_Red_RavenCreek02', 'STFR.TShirt_Profession_Fireman_White_RavenCreek',},
            ['Pants'] = 'STFR.Trousers_Fireman_Black_RavenCreek',
            ['Shoes'] = 'Base.Shoes_ArmyBoots',
        },
    }
    professionTable['policeofficer'] = {
        {
            ['Hat'] = 'STFR.Hat_Police_RavenCreek_Officer',
            ['Jacket'] = 'STFR.Jacket_Police_RavenCreek_Officer',
            ['Shirt'] = 'STFR.Shirt_Police_RavenCreek_Officer',
            ['Tshirt'] = 'STFR.TShirt_Police_RavenCreek_Officer',
            ['TorsoExtra'] = 'Base.Vest_BulletPolice',
            ['Pants'] = 'STFR.Trousers_Police_RavenCreek',
            ['Neck'] = {'STFR.Tie_Full_Police_RavenCreek', 'STFR.Tie_Worn_Police_RavenCreek',},
        },
    }
    professionTable['nurse'] = {
        {
            ['Hat'] = 'STFR.Hat_BaseballCap_EMS_RavenCreek',
            ['Jacket'] = 'STFR.Jacket_EMS_RavenCreek',
            ['Shirt'] = 'STFR.Shirt_EMS_RavenCreek',
            ['Tshirt'] = 'STFR.TShirt_EMS_RavenCreek',
            ['Pants'] = 'STFR.Trousers_EMS_RavenCreek',
        },
    }

    OCCL.Outfitter.addMapClothingTable('RavenCreek', professionTable)
end

OCCL.Outfitter.addOutfits(OCCL.Outfitter.STFR_RavenCreek.generateMapClothingTables, OCCL.STFR_RavenCreek.checkEnabled)

function OCCL.Outfitter.STFR_RavenCreek.addBlacklistedItems()
    if SandboxVars.OccupationalClothing.WantFireman < 3 then
        local bannedJackets = {'STFR.Jacket_Fireman_Black_RavenCreek', 'STFR.Jacket_Fireman_Khaki_RavenCreek'}
        OCCL.Outfitter.addToBlacklist('Jacket', bannedJackets)
        if SandboxVars.OccupationalClothing.WantFireman < 2 then
            local bannedTrousers = {'STFR.Trousers_Fireman_Black_RavenCreek', 'STFR.Trousers_Fireman_Khaki_RavenCreek'}
            OCCL.Outfitter.addToBlacklist('Pants', bannedTrousers)
        end
    end

    if not SandboxVars.OccupationalClothing.WantHardhats then
        local bannedHats = {'STFR.Hat_Fireman_RavenCreek_Blue', 'STFR.Hat_Fireman_RavenCreek_Black', 'STFR.Hat_Fireman_RavenCreek_Red',
        'STFR.Hat_Fireman_RavenCreek_Yellow'}
        OCCL.Outfitter.addToBlacklist('Hat', bannedHats)
    end

    if not SandboxVars.OccupationalClothing.WantJackets then
        local bannedJackets = {'STFR.Jacket_Police_RavenCreek_Officer', 'STFR.Jacket_EMS_RavenCreek'}
        OCCL.Outfitter.addToBlacklist('Jacket', bannedJackets)
    end
end

OCCL.Outfitter.addBlacklistedItems(OCCL.Outfitter.STFR_RavenCreek.addBlacklistedItems, OCCL.STFR_RavenCreek.checkEnabled)

function OCCL.Outfitter.STFR_RavenCreek.banSeasonalItems(month)
    if month == 12 or month < 3 then
        OCCL.Outfitter.addToBlacklist({['Tshirt'] = {'STFR.TShirt_Police_RavenCreek_Officer', 'STFR.TShirt_EMS_RavenCreek'}})
    elseif month < 6 then
        OCCL.Outfitter.addTableToBlacklist({['Tshirt'] = {'STFR.TShirt_Police_RavenCreek_Officer', 'STFR.TShirt_EMS_RavenCreek'},
                                ['Jacket'] = {'STFR.Jacket_Police_RavenCreek_Officer', 'STFR.Jacket_EMS_RavenCreek'}})
    elseif month < 9 then
        OCCL.Outfitter.addTableToBlacklist({['Shirt'] = {'STFR.Shirt_Police_RavenCreek_Officer', 'STFR.Shirt_EMS_RavenCreek'},
                                ['Jacket'] = {'STFR.Jacket_Police_RavenCreek_Officer', 'STFR.Jacket_EMS_RavenCreek'}})
    else
        OCCL.Outfitter.addTableToBlacklist({['Tshirt'] = {'STFR.TShirt_Police_RavenCreek_Officer', 'STFR.TShirt_EMS_RavenCreek'},
                                ['Jacket'] = {'STFR.Jacket_Police_RavenCreek_Officer', 'STFR.Jacket_EMS_RavenCreek'}})
    end
end

OCCL.Outfitter.addSeasonalBannedItems(OCCL.Outfitter.STFR_RavenCreek.banSeasonalItems, OCCL.STFR_RavenCreek.checkEnabled)
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

OCCL.Outfitter.RCPD = {}

function OCCL.Outfitter.RCPD.generateMapClothingTables()
    local professionTable = {}

    professionTable['fireofficer'] = {
        {
            ['Hat'] = 'STR.Hat_Fireman_RavenCreek_Yellow',
            ['Jacket'] = 'STR.Jacket_Fireman_RavenCreek_Khaki',
            ['Tshirt'] = {'STR.TShirt_Profession_FiremanBlue_RavenCreek', 'STR.TShirt_Profession_FiremanRed_RavenCreek', 'STR.TShirt_Profession_FiremanRed_RavenCreek02', 'STR.TShirt_Profession_FiremanWhite_RavenCreek',},
            ['Pants'] = 'STR.Trousers_Fireman_RavenCreek_Khaki',
            ['Shoes'] = 'Base.Shoes_ArmyBoots',
        },
        {
            ['Hat'] = 'STR.Hat_Fireman_RavenCreek_Red',
            ['Jacket'] = 'STR.Jacket_Fireman_RavenCreek_Black',
            ['Tshirt'] = {'STR.TShirt_Profession_FiremanBlue_RavenCreek', 'STR.TShirt_Profession_FiremanRed_RavenCreek', 'STR.TShirt_Profession_FiremanRed_RavenCreek02', 'STR.TShirt_Profession_FiremanWhite_RavenCreek',},
            ['Pants'] = 'STR.Trousers_Fireman_RavenCreek_Black',
            ['Shoes'] = 'Base.Shoes_ArmyBoots',
        },
    }
    professionTable['policeofficer'] = {
        {
            ['Hat'] = 'STR.Hat_Police_RavenCreek',
            ['Jacket'] = 'STR.Jacket_Police_RavenCreek',
            ['Shirt'] = 'STR.Shirt_Police_RavenCreek',
            ['Tshirt'] = 'STR.TShirt_Police_RavenCreek',
            ['TorsoExtra'] = 'Base.Vest_BulletPolice',
            ['Pants'] = 'STR.Trousers_Police_RavenCreek',
            ['Neck'] = {'STR.Tie_Full_Police_RavenCreek', 'STR.Tie_Worn_Police_RavenCreek',},
        },
    }
    professionTable['nurse'] = {
        {
            ['Hat'] = 'STR.Hat_BaseballCap_EMS_RavenCreek',
            ['Jacket'] = 'STR.Jacket_EMS_RavenCreek',
            ['Shirt'] = 'STR.Shirt_EMS_RavenCreek',
            ['Tshirt'] = 'STR.TShirt_EMS_RavenCreek',
            ['Pants'] = 'STR.Trousers_EMS_RavenCreek',
        },
    }

    OCCL.Outfitter.addMapClothingTable('RavenCreek', professionTable)
end

OCCL.Outfitter.addOutfits(OCCL.Outfitter.RCPD.generateMapClothingTables, OCCL.RCPD.checkEnabled)

function OCCL.Outfitter.RCPD.addBlacklistedItems()
    if SandboxVars.OccupationalClothing.WantFireman < 3 then
        local bannedJackets = {'STR.Jacket_Fireman_RavenCreek_Black', 'STR.Jacket_Fireman_RavenCreek_Khaki'}
        OCCL.Outfitter.addToBlacklist('Jacket', bannedJackets)
        if SandboxVars.OccupationalClothing.WantFireman < 2 then
            local bannedTrousers = {'STR.Trousers_Fireman_RavenCreek_Black', 'STR.Trousers_Fireman_RavenCreek_Khaki'}
            OCCL.Outfitter.addToBlacklist('Pants', bannedTrousers)
        end
    end

    if not SandboxVars.OccupationalClothing.WantHardhats then
        local bannedHats = {'STR.Hat_Fireman_RavenCreek_Blue', 'STR.Hat_Fireman_RavenCreek_Black', 'STR.Hat_Fireman_RavenCreek_Red',
        'STR.Hat_Fireman_RavenCreek_Yellow'}
        OCCL.Outfitter.addToBlacklist('Hat', bannedHats)
    end

    if not SandboxVars.OccupationalClothing.WantJackets then
        local bannedJackets = {'STR.Jacket_Police_RavenCreek', 'STR.Jacket_EMS_RavenCreek'}
        OCCL.Outfitter.addToBlacklist('Jacket', bannedJackets)
    end
end

OCCL.Outfitter.addBlacklistedItems(OCCL.Outfitter.RCPD.addBlacklistedItems, OCCL.RCPD.checkEnabled)

function OCCL.Outfitter.RCPD.banSeasonalItems(month)
    if month == 12 or month < 3 then
        OCCL.Outfitter.addToBlacklist({['Tshirt'] = {'STR.TShirt_Police_RavenCreek', 'STR.TShirt_EMS_RavenCreek'}})
    elseif month < 6 then
        OCCL.Outfitter.addTableToBlacklist({['Tshirt'] = {'STR.TShirt_Police_RavenCreek', 'STR.TShirt_EMS_RavenCreek'},
                                ['Jacket'] = {'STR.Jacket_Police_RavenCreek', 'STR.Jacket_EMS_RavenCreek'}})
    elseif month < 9 then
        OCCL.Outfitter.addTableToBlacklist({['Shirt'] = {'STR.Shirt_Police_RavenCreek', 'STR.Shirt_EMS_RavenCreek'},
                                ['Jacket'] = {'STR.Jacket_Police_RavenCreek', 'STR.Jacket_EMS_RavenCreek'}})
    else
        OCCL.Outfitter.addTableToBlacklist({['Tshirt'] = {'STR.TShirt_Police_RavenCreek', 'STR.TShirt_EMS_RavenCreek'},
                                ['Jacket'] = {'STR.Jacket_Police_RavenCreek', 'STR.Jacket_EMS_RavenCreek'}})
    end
end

OCCL.Outfitter.addSeasonalBannedItems(OCCL.Outfitter.RCPD.banSeasonalItems, OCCL.RCPD.checkEnabled)
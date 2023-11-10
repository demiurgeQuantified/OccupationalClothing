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
require 'occupationalclothing/addons/tpd'

OCCL.Outfitter.TPD = {}

function OCCL.Outfitter.TPD.generateMapClothingTables()
    local professionTable = {}

    professionTable['fireofficer'] = {
        {
            ['Hat'] = 'STR.Hat_Fireman_Tandil_Yellow',
            ['Jacket'] = 'STR.Jacket_Fireman_Tandil_Khaki',
            ['Tshirt'] = {'TShirt_Profession_FiremanBlue_Tandil', 'TShirt_Profession_FiremanRed_Tandil', 'TShirt_Profession_FiremanRed_Tandil02', 'TShirt_Profession_FiremanWhite_Tandil',},
            ['Pants'] = 'STR.Trousers_Fireman_Tandil_Khaki',
            ['Shoes'] = 'Base.Shoes_ArmyBoots',
        },
        {
            ['Hat'] = 'STR.Hat_Fireman_Tandil_Red',
            ['Jacket'] = 'STR.Jacket_Fireman_Tandil_Black',
            ['Tshirt'] = {'TShirt_Profession_FiremanBlue_Tandil', 'TShirt_Profession_FiremanRed_Tandil', 'TShirt_Profession_FiremanRed_Tandil02', 'TShirt_Profession_FiremanWhite_Tandil',},
            ['Pants'] = 'STR.Trousers_Fireman_Tandil_Black',
            ['Shoes'] = 'Base.Shoes_ArmyBoots',
        },
    }
    professionTable['policeofficer'] = {
        {
            ['Hat'] = 'STR.Hat_Police_Tandil',
            ['Jacket'] = 'STR.Jacket_Police_Tandil',
            ['Shirt'] = 'STR.Shirt_Police_Tandil',
            ['Tshirt'] = 'STR.TShirt_Police_Tandil',
            ['TorsoExtra'] = 'Base.Vest_BulletPolice',
            ['Pants'] = 'STR.Trousers_Police_Tandil',
            ['Neck'] = {'STR.Tie_Full_Police_Tandil', 'STR.Tie_Worn_Police_Tandil',},
        },
    }
    professionTable['nurse'] = {
        {
            ['Hat'] = 'STR.Hat_BaseballCap_EMS_Tandil',
            ['Jacket'] = 'STR.Jacket_EMS_Tandil',
            ['Shirt'] = 'STR.Shirt_EMS_Tandil',
            ['Tshirt'] = 'STR.TShirt_EMS_Tandil',
            ['Pants'] = 'STR.Trousers_EMS_Tandil',
        },
    }

    OCCL.Outfitter.addMapClothingTable('Tandil', professionTable)
end

OCCL.Outfitter.addOutfits(OCCL.Outfitter.TPD.generateMapClothingTables, OCCL.TPD.checkEnabled)

function OCCL.Outfitter.TPD.addBlacklistedItems()
    if SandboxVars.OccupationalClothing.WantFireman < 3 then
        local bannedJackets = {'STR.Jacket_Fireman_Tandil_Black', 'STR.Jacket_Fireman_Tandil_Khaki'}
        OCCL.Outfitter.addToBlacklist('Jacket', bannedJackets)
        if SandboxVars.OccupationalClothing.WantFireman < 2 then
            local bannedTrousers = {'STR.Trousers_Fireman_Tandil_Black', 'STR.Trousers_Fireman_Tandil_Khaki'}
            OCCL.Outfitter.addToBlacklist('Pants', bannedTrousers)
        end
    end

    if not SandboxVars.OccupationalClothing.WantHardhats then
        local bannedHats = {'STR.Hat_Fireman_Tandil_Blue', 'STR.Hat_Fireman_Tandil_Black', 'STR.Hat_Fireman_Tandil_Red',
        'STR.Hat_Fireman_Tandil_Yellow'}
        OCCL.Outfitter.addToBlacklist('Hat', bannedHats)
    end

    if not SandboxVars.OccupationalClothing.WantJackets then
        local bannedJackets = {'STR.Jacket_Police_Tandil', 'STR.Jacket_EMS_Tandil'}
        OCCL.Outfitter.addToBlacklist('Jacket', bannedJackets)
    end
end

OCCL.Outfitter.addBlacklistedItems(OCCL.Outfitter.TPD.addBlacklistedItems, OCCL.TPD.checkEnabled)

function OCCL.Outfitter.TPD.banSeasonalItems(month)
    if month == 12 or month < 3 then
        OCCL.Outfitter.addToBlacklist({['Tshirt'] = {'STR.TShirt_Police_Tandil', 'STR.TShirt_EMS_Tandil'}})
    elseif month < 6 then
        OCCL.Outfitter.addTableToBlacklist({['Tshirt'] = {'STR.TShirt_Police_Tandil', 'STR.TShirt_EMS_Tandil'},
                                ['Jacket'] = {'STR.Jacket_Police_Tandil', 'STR.Jacket_EMS_Tandil'}})
    elseif month < 9 then
        OCCL.Outfitter.addTableToBlacklist({['Shirt'] = {'STR.Shirt_Police_Tandil', 'STR.Shirt_EMS_Tandil'},
                                ['Jacket'] = {'STR.Jacket_Police_Tandil', 'STR.Jacket_EMS_Tandil'}})
    else
        OCCL.Outfitter.addTableToBlacklist({['Tshirt'] = {'STR.TShirt_Police_Tandil', 'STR.TShirt_EMS_Tandil'},
                                ['Jacket'] = {'STR.Jacket_Police_Tandil', 'STR.Jacket_EMS_Tandil'}})
    end
end

OCCL.Outfitter.addSeasonalBannedItems(OCCL.Outfitter.TPD.banSeasonalItems, OCCL.TPD.checkEnabled)
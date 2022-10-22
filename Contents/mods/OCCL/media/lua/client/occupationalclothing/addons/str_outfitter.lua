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
require 'occupationalclothing/addons/str'

OCCL.Outfitter.STR = {}

local function getPoliceOutfit(department)
    local bulletVest = 'Base.Vest_BulletPolice'
    if department == 'JeffersonSD' or department == 'Meade' then
        bulletVest = 'STR.Vest_BulletPolice_Meade'
    end
    return {
        ['Hat'] = 'STR.Hat_Police_' .. department,
        ['Jacket'] = 'STR.Jacket_Police_' .. department,
        ['Shirt'] = 'STR.Shirt_Police_' .. department,
        ['Tshirt'] = 'STR.TShirt_Police_' .. department,
        ['TorsoExtra'] = bulletVest,
        ['Pants'] = 'STR.Trousers_Police_' .. department,
        ['Neck'] = '',
    }
end

local function getEMSOutfit(department)
    return {
        ['Hat'] = 'STR.Hat_BaseballCap_EMS_' .. department,
        ['Jacket'] = 'STR.Jacket_EMS_' .. department,
        ['Shirt'] = 'STR.Shirt_EMS_' .. department,
        ['Tshirt'] = 'STR.TShirt_EMS_' .. department,
        ['Pants'] = 'STR.Trousers_EMS_' .. department,
    }
end

local function getFirefighterOutfits(department)
    return {
        {
            ['Hat'] = {'STR.Hat_Fireman_' .. department .. '_Red', 'STR.Hat_Fireman_' .. department .. 'Yellow',},
            ['Jacket'] = 'STR.Jacket_Fireman_' .. department .. '_Khaki',
            ['Tshirt'] = {'STR.TShirt_Profession_FiremanBlue_' .. department, 'STR.TShirt_Profession_FiremanRed_' .. department, 'STR.TShirt_Profession_FiremanRed_' .. department .. '02', 'STR.TShirt_Profession_FiremanWhite_' .. department,},
            ['Pants'] = 'STR.Trousers_Fireman_' .. department .. '_Khaki',
            ['Shoes'] = 'Base.Shoes_ArmyBoots',},
        {
            ['Hat'] = {'STR.Hat_Fireman_' .. department .. '_Black', 'STR.Hat_Fireman_' .. department .. '_Red',},
            ['Jacket'] = 'STR.Jacket_Fireman_' .. department .. '_Black',
            ['Tshirt'] = {'STR.TShirt_Profession_FiremanBlue_' .. department, 'STR.TShirt_Profession_FiremanRed_' .. department, 'STR.TShirt_Profession_FiremanRed_' .. department .. '02', 'STR.TShirt_Profession_FiremanWhite_' .. department,},
            ['Pants'] = 'STR.Trousers_Fireman_' .. department .. '_Black',
            ['Shoes'] = 'Base.Shoes_ArmyBoots',
        },
    }
end

function OCCL.Outfitter.STR.generateClothingTables()
    local jeffersonPolice = getPoliceOutfit('JeffersonPD')
    local jeffersonSheriff = getPoliceOutfit('JeffersonSD')
    local meadeEMS = getEMSOutfit('Meade')
    local jeffersonEMS = getEMSOutfit('Jefferson')
    local louisvilleFire = getFirefighterOutfits('Louisville')

    local meadeCounty = {
        ['policeofficer'] = {getPoliceOutfit('Meade')},
        ['nurse'] = {meadeEMS}
    }

    local mapTable = {
        ['Muldraugh'] = {
            ['policeofficer'] = {getPoliceOutfit('Muldraugh')},
            ['nurse'] = {meadeEMS}
        },
        ['Rosewood'] = {
            ['policeofficer'] = {getPoliceOutfit('Rosewood')},
            ['fireofficer'] = getFirefighterOutfits('Rosewood'),
            ['nurse'] = {meadeEMS}
        },
        ['Riverside'] = {
            ['policeofficer'] = {getPoliceOutfit('Riverside')},
            ['nurse'] = {meadeEMS}
        },
        ['WestPoint'] = {
            ['policeofficer'] = {getPoliceOutfit('WestPoint')},
            ['nurse'] = {meadeEMS}
        },
        ['Louisville'] = {
            ['policeofficer'] = {getPoliceOutfit('Louisville')},
            ['fireofficer'] = louisvilleFire,
            ['nurse'] = {getEMSOutfit('Louisville')}
        },
        ['Dixie'] = meadeCounty,
        ['FallasLake'] = meadeCounty,
        ['MarchRidge'] = meadeCounty,
        ['ValleyStation'] = {
            ['policeofficer'] = {jeffersonSheriff},
            ['fireofficer'] = louisvilleFire,
            ['nurse'] = {jeffersonEMS}
        },
        ['generic'] = {
            ['policeofficer'] = {
                jeffersonSheriff,
                getPoliceOutfit('Meade'),
                {
                    ['Hat'] = 'STR.Hat_PoliceKSP',
                    ['Jacket'] = 'STR.Jacket_PoliceKSP',
                    ['Shirt'] = 'STR.Shirt_PoliceKSP',
                    ['Tshirt'] = 'STR.TShirt_PoliceKSP',
                    ['TorsoExtra'] = 'Base.Vest_BulletPolice',
                    ['Pants'] = {'STR.Trousers_PoliceKSP_Summer', 'STR.Trousers_PoliceKSP_Winter'},
                    ['Neck'] = 'Tie_Full_KSP',
                },
            },
            ['nurse'] = {meadeEMS, jeffersonEMS},
            ['fireofficer'] = getFirefighterOutfits('Meade'),
            ['parkranger'] = {
                {
                    ['Hat'] = 'STR.Hat_FederalRanger',
                    ['Jacket'] = 'STR.Jacket_Federal_Ranger',
                    ['Shirt'] = 'STR.Shirt_Federal_Ranger',
                    ['Tshirt'] = 'STR.TShirt_Federal_Ranger',
                    ['Pants'] = 'STR.Trousers_FederalRanger',
                },
                {
                    ['Hat'] = 'STR.Hat_StateLawRanger',
                    ['Jacket'] = 'STR.Jacket_State_LawRanger',
                    ['Shirt'] = 'STR.Shirt_State_LawRanger',
                    ['Tshirt'] = 'STR.TShirt_State_LawRanger',
                    ['Pants'] = 'STR.Trousers_StateLawRanger',
                },
                {
                    ['Hat'] = 'STR.Hat_StateRanger',
                    ['Jacket'] = 'STR.Jacket_State_Ranger',
                    ['Shirt'] = 'STR.Shirt_State_Ranger',
                    ['Tshirt'] = 'STR.TShirt_State_Ranger',
                    ['Pants'] = 'STR.Trousers_StateRanger',
                },
            }
        }
    }

    OCCL.Outfitter.addMultiMapClothingTable(mapTable)
end

OCCL.Outfitter.addOutfits(OCCL.Outfitter.STR.generateClothingTables, OCCL.STR.checkEnabled)

function OCCL.Outfitter.STR.addBlacklistedItems()
    if SandboxVars.OccupationalClothing.WantFireman < 3 then
        local bannedJackets = {'STR.Jacket_Fireman_Meade_Black', 'STR.Jacket_Fireman_Meade_Khaki',
        'STR.Jacket_Fireman_Rosewood_Black', 'STR.Jacket_Fireman_Rosewood_Khaki',
        'STR.Jacket_Fireman_Louisville_Black', 'STR.Jacket_Fireman_Louisville_Khaki'}
        OCCL.Outfitter.addToBlacklist('Jacket', bannedJackets)
        if SandboxVars.OccupationalClothing.WantFireman < 2 then
            local bannedTrousers = {'STR.Trousers_Fireman_Meade_Black', 'STR.Trousers_Fireman_Meade_Khaki',
            'STR.Trousers_Fireman_Rosewood_Black', 'STR.Trousers_Fireman_Rosewood_Khaki',
            'STR.Trousers_Fireman_Louisville_Black', 'STR.Trousers_Fireman_Louisville_Khaki'}
            OCCL.Outfitter.addToBlacklist('Pants', bannedTrousers)
        end
    end

    if not SandboxVars.OccupationalClothing.WantHardhats then
        local bannedHats = {'STR.Hat_Fireman_Meade_Black', 'STR.Hat_Fireman_Meade_Red', 'STR.Hat_Fireman_Meade_Yellow',
        'STR.Hat_Fireman_Rosewood_Black', 'STR.Hat_Fireman_Rosewood_Red', 'STR.Hat_Fireman_Rosewood_Yellow',
        'STR.Hat_Fireman_Louisville_Black', 'STR.Hat_Fireman_Louisville_Red', 'STR.Hat_Fireman_Louisville_Yellow'}
        OCCL.Outfitter.addToBlacklist('Hat', bannedHats)
    end

    if not SandboxVars.OccupationalClothing.WantJackets then
        local bannedJackets = {'STR.Jacket_Police_Muldraugh', 'STR.Jacket_Police_Rosewood', 'STR.Jacket_Police_Riverside',
        'STR.Jacket_Police_WestPoint', 'STR.Jacket_Police_Louisville', 'STR.Jacket_EMS_Louisville', 'STR.Jacket_Police_Meade',
        'STR.Jacket_Police_JeffersonPD', 'STR.Jacket_Police_JeffersonSD', 'STR.Jacket_PoliceKSP', 'STR.Jacket_EMS_Meade',
        'STR.Jacket_EMS_Jefferson', 'STR.Jacket_Federal_Ranger', 'STR.Jacket_State_LawRanger', 'STR.Jacket_State_Ranger'}
        OCCL.Outfitter.addToBlacklist('Jacket', bannedJackets)
    end

    if not SandboxVars.OccupationalClothing.WantVests then
        OCCL.Outfitter.addToBlacklist('TorsoExtra', 'STR.Vest_BulletPolice_Meade')
    end
end

OCCL.Outfitter.addBlacklistedItems(OCCL.Outfitter.STR.addBlacklistedItems, OCCL.STR.checkEnabled)

function OCCL.Outfitter.STR.banSeasonalItems(month)
    if month == 12 or month < 3 then
        OCCL.Outfitter.addTableToBlacklist({['Tshirt'] = {'STR.TShirt_Police_Muldraugh', 'STR.TShirt_Police_Rosewood', 'STR.TShirt_Police_Riverside',
        'STR.TShirt_Police_WestPoint', 'STR.TShirt_Police_Louisville', 'STR.TShirt_EMS_Louisville', 'STR.TShirt_Police_Meade',
        'STR.TShirt_Police_JeffersonPD', 'STR.TShirt_Police_JeffersonSD', 'STR.TShirt_PoliceKSP', 'STR.TShirt_EMS_Meade',
        'STR.TShirt_EMS_Jefferson', 'STR.TShirt_Federal_Ranger', 'STR.TShirt_State_LawRanger', 'STR.TShirt_State_Ranger'},
        ['Pants'] = 'STR.Trousers_PoliceKSP_Summer'})
    elseif month < 6 then
        OCCL.Outfitter.addTableToBlacklist({['Tshirt'] = {'STR.TShirt_Police_Muldraugh', 'STR.TShirt_Police_Rosewood', 'STR.TShirt_Police_Riverside',
        'STR.TShirt_Police_WestPoint', 'STR.TShirt_Police_Louisville', 'STR.TShirt_EMS_Louisville', 'STR.TShirt_Police_Meade',
        'STR.TShirt_Police_JeffersonPD', 'STR.TShirt_Police_JeffersonSD', 'STR.TShirt_PoliceKSP', 'STR.TShirt_EMS_Meade',
        'STR.TShirt_EMS_Jefferson', 'STR.TShirt_Federal_Ranger', 'STR.TShirt_State_LawRanger', 'STR.TShirt_State_Ranger'},
        ['Jacket'] = {'STR.Jacket_Police_Muldraugh', 'STR.Jacket_Police_Rosewood', 'STR.Jacket_Police_Riverside',
        'STR.Jacket_Police_WestPoint', 'STR.Jacket_Police_Louisville', 'STR.Jacket_EMS_Louisville', 'STR.Jacket_Police_Meade',
        'STR.Jacket_Police_JeffersonPD', 'STR.Jacket_Police_JeffersonSD', 'STR.Jacket_PoliceKSP', 'STR.Jacket_EMS_Meade',
        'STR.Jacket_EMS_Jefferson', 'STR.Jacket_Federal_Ranger', 'STR.Jacket_State_LawRanger', 'STR.Jacket_State_Ranger'},
        ['Pants'] = 'STR.Trousers_PoliceKSP_Winter'})
    elseif month < 9 then
        OCCL.Outfitter.addTableToBlacklist({['Shirt'] = {'STR.Shirt_Police_Muldraugh', 'STR.Shirt_Police_Rosewood', 'STR.Shirt_Police_Riverside',
        'STR.Shirt_Police_WestPoint', 'STR.Shirt_Police_Louisville', 'STR.Shirt_EMS_Louisville', 'STR.Shirt_Police_Meade',
        'STR.Shirt_Police_JeffersonPD', 'STR.Shirt_Police_JeffersonSD', 'STR.Shirt_PoliceKSP', 'STR.Shirt_EMS_Meade',
        'STR.Shirt_EMS_Jefferson', 'STR.Shirt_Federal_Ranger', 'STR.Shirt_State_LawRanger', 'STR.Shirt_State_Ranger'},
        ['Jacket'] = {'STR.Jacket_Police_Muldraugh', 'STR.Jacket_Police_Rosewood', 'STR.Jacket_Police_Riverside',
        'STR.Jacket_Police_WestPoint', 'STR.Jacket_Police_Louisville', 'STR.Jacket_EMS_Louisville', 'STR.Jacket_Police_Meade',
        'STR.Jacket_Police_JeffersonPD', 'STR.Jacket_Police_JeffersonSD', 'STR.Jacket_PoliceKSP', 'STR.Jacket_EMS_Meade',
        'STR.Jacket_EMS_Jefferson', 'STR.Jacket_Federal_Ranger', 'STR.Jacket_State_LawRanger', 'STR.Jacket_State_Ranger'},
        ['Pants'] = 'STR.Trousers_PoliceKSP_Winter'})
    else
        OCCL.Outfitter.addTableToBlacklist({['Tshirt'] = {'STR.TShirt_Police_Muldraugh', 'STR.TShirt_Police_Rosewood', 'STR.TShirt_Police_Riverside',
        'STR.TShirt_Police_WestPoint', 'STR.TShirt_Police_Louisville', 'STR.TShirt_EMS_Louisville', 'STR.TShirt_Police_Meade',
        'STR.TShirt_Police_JeffersonPD', 'STR.TShirt_Police_JeffersonSD', 'STR.TShirt_PoliceKSP', 'STR.TShirt_EMS_Meade',
        'STR.TShirt_EMS_Jefferson', 'STR.TShirt_Federal_Ranger', 'STR.TShirt_State_LawRanger', 'STR.TShirt_State_Ranger'},
        ['Jacket'] = {'STR.Jacket_Police_Muldraugh', 'STR.Jacket_Police_Rosewood', 'STR.Jacket_Police_Riverside',
        'STR.Jacket_Police_WestPoint', 'STR.Jacket_Police_Louisville', 'STR.Jacket_EMS_Louisville', 'STR.Jacket_Police_Meade',
        'STR.Jacket_Police_JeffersonPD', 'STR.Jacket_Police_JeffersonSD', 'STR.Jacket_PoliceKSP', 'STR.Jacket_EMS_Meade',
        'STR.Jacket_EMS_Jefferson', 'STR.Jacket_Federal_Ranger', 'STR.Jacket_State_LawRanger', 'STR.Jacket_State_Ranger'},
        ['Pants'] = 'STR.Trousers_PoliceKSP_Winter'})
    end
end

OCCL.Outfitter.addSeasonalBannedItems(OCCL.Outfitter.STR.banSeasonalItems, OCCL.STR.checkEnabled)
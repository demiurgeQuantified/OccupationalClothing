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
-- require 'occupationalclothing/outfitter'
-- require 'occupationalclothing/addons/stfr/stfr_main'

-- OCCL.Outfitter.STFR_Main = {}

-- local function getPoliceOutfit(department)
--     local bulletVest = 'Base.Vest_BulletPolice'
--     if department == 'JeffersonSD' or department == 'Meade' or department == 'Rosewood' then
--         bulletVest = 'STFR.Vest_BulletPolice_Meade'
--     end
-- 	if department == 'JeffersonSD' then
-- 		return {
-- 			['Hat'] = 'STFR.Hat_Sheriff_Jefferson_Officer',
-- 			['Jacket'] = 'STFR.Jacket_Sheriff_Jefferson_Officer',
-- 			['Shirt'] = 'STFR.Shirt_Sheriff_Jefferson_Officer',
-- 			['Tshirt'] = 'STFR.TShirt_Sheriff_Jefferson_Officer',
-- 			['TorsoExtra'] = bulletVest,
-- 			['Pants'] = 'STFR.Trousers_Sheriff_Jefferson',
-- 			['Neck'] = {'STFR.Tie_Full_Sheriff_Jefferson_Officer', 'STFR.Tie_Worn_Sheriff_Jefferson_Officer'},
-- 		}
-- 	elseif department == 'JeffersonPD' then
-- 		return {
-- 			['Hat'] = 'STFR.Hat_Police_Jefferson_Officer',
-- 			['Jacket'] = 'STFR.Jacket_Police_Jefferson_Officer',
-- 			['Shirt'] = 'STFR.Shirt_Police_Jefferson_Officer',
-- 			['Tshirt'] = 'STFR.TShirt_Police_Jefferson_Officer',
-- 			['TorsoExtra'] = bulletVest,
-- 			['Pants'] = 'STFR.Trousers_Police_Jefferson',
-- 			['Neck'] = {'STFR.Tie_Full_Police_Jefferson_Officer', 'STFR.Tie_Worn_Police_Jefferson_Officer'},
-- 		}
-- 	else
-- 		return {
-- 			['Hat'] = {'STFR.Hat_Sheriff_' .. department .. '_Officer', 'STFR.Hat_Police_' .. department .. '_Officer',},
-- 			['Jacket'] = {'STFR.Jacket_Sheriff_' .. department .. '_Officer', 'STFR.Jacket_Police_' .. department .. '_Officer',},
-- 			['Shirt'] = {'STFR.Shirt_Sheriff_' .. department .. '_Officer', 'STFR.Shirt_Police_' .. department .. '_Officer',},
-- 			['Tshirt'] = {'STFR.TShirt_Sheriff_' .. department .. '_Officer', 'STFR.TShirt_Police_' .. department .. '_Officer',},
-- 			['TorsoExtra'] = bulletVest,
-- 			['Pants'] = {'STFR.Trousers_Sheriff_' .. department,  'STFR.Trousers_Police_' .. department,},
-- 			['Neck'] = {'STFR.Tie_Full_Sheriff_' .. department, 'STFR.Tie_Worn_Sheriff_' .. department, 'STFR.Tie_Full_Police_' .. department, 'STFR.Tie_Worn_Police_' .. department,},
-- 		}
-- 	end
-- end

-- local function getEMSOutfit(department)
--     return {
--         ['Hat'] = 'STFR.Hat_BaseballCap_EMS_' .. department,
--         ['Jacket'] = 'STFR.Jacket_EMS_' .. department,
--         ['Shirt'] = 'STFR.Shirt_EMS_' .. department,
--         ['Tshirt'] = 'STFR.TShirt_EMS_' .. department,
--         ['Pants'] = 'STFR.Trousers_EMS_' .. department,
--     }
-- end

-- local function getFirefighterOutfits(department)
--     return {
--         {
--             ['Hat'] = {'STFR.Hat_Fireman_' .. department .. '_Red', 'STFR.Hat_Fireman_' .. department .. 'Yellow',},
--             ['Jacket'] = 'STFR.Jacket_Fireman_Khaki_' .. department,
--             ['Tshirt'] = {'STFR.TShirt_Profession_Fireman_Blue_' .. department, 'STFR.TShirt_Profession_Fireman_Red_' .. department, 'STFR.TShirt_Profession_Fireman_Red_' .. department .. '02', 'STFR.TShirt_Profession_Fireman_White_' .. department,},
--             ['Pants'] = 'STFR.Trousers_Fireman_Khaki_' .. department,
--             ['Shoes'] = 'Base.Shoes_ArmyBoots',
-- 		},
--         {
--             ['Hat'] = {'STFR.Hat_Fireman_' .. department .. '_Black', 'STFR.Hat_Fireman_' .. department .. '_Red',},
--             ['Jacket'] = 'STFR.Jacket_Fireman_Black_' .. department,
--             ['Tshirt'] = {'STFR.TShirt_Profession_Fireman_Blue_' .. department, 'STFR.TShirt_Profession_Fireman_Red_' .. department, 'STFR.TShirt_Profession_Fireman_Red_' .. department .. '02', 'STFR.TShirt_Profession_Fireman_White_' .. department,},
--             ['Pants'] = 'STFR.Trousers_Fireman_Black_' .. department,
--             ['Shoes'] = 'Base.Shoes_ArmyBoots',
--         },
--     }
-- end

-- function OCCL.Outfitter.STFR_Main.generateClothingTables()
--     local jeffersonSheriff = getPoliceOutfit('JeffersonSD')
--     local meadeEMS = getEMSOutfit('Meade')
--     local jeffersonEMS = getEMSOutfit('Jefferson')
--     local louisvilleFire = getFirefighterOutfits('Louisville')

--     local meadeCounty = {
--         ['policeofficer'] = {getPoliceOutfit('Meade')},
--         ['nurse'] = {meadeEMS}
--     }

--     local mapTable = {
--         ['Muldraugh'] = {
--             ['policeofficer'] = {getPoliceOutfit('Muldraugh')},
--             ['nurse'] = {meadeEMS}
--         },
--         ['Rosewood'] = {
--             ['policeofficer'] = {getPoliceOutfit('Rosewood')},
--             ['fireofficer'] = getFirefighterOutfits('Rosewood'),
--             ['nurse'] = {meadeEMS}
--         },
--         ['Riverside'] = {
--             ['policeofficer'] = {getPoliceOutfit('Riverside')},
--             ['nurse'] = {meadeEMS}
--         },
--         ['WestPoint'] = {
--             ['policeofficer'] = {getPoliceOutfit('WestPoint')},
--             ['nurse'] = {meadeEMS}
--         },
--         ['Louisville'] = {
--             ['policeofficer'] = {getPoliceOutfit('Louisville'), getPoliceOutfit('JeffersonPD')},
--             ['fireofficer'] = louisvilleFire,
--             ['nurse'] = {getEMSOutfit('Louisville')}
--         },
--         ['Dixie'] = meadeCounty,
--         ['FallasLake'] = meadeCounty,
--         ['MarchRidge'] = meadeCounty,
--         ['ValleyStation'] = {
--             ['policeofficer'] = {jeffersonSheriff},
--             ['fireofficer'] = louisvilleFire,
--             ['nurse'] = {jeffersonEMS}
--         },
--         ['generic'] = {
--             ['policeofficer'] = {
--                 jeffersonSheriff,
--                 getPoliceOutfit('Meade'),
--                 {
--                     ['Hat'] = 'STFR.Hat_Police_KSP',
--                     ['Jacket'] = 'STFR.Jacket_Police_KSP_Officer',
--                     ['Shirt'] = 'STFR.Shirt_Police_KSP_Officer',
--                     ['Tshirt'] = 'STFR.TShirt_Police_KSP_Officer',
--                     ['TorsoExtra'] = 'Base.Vest_BulletPolice',
--                     ['Pants'] = {'STFR.Trousers_Police_KSP_Summer', 'STFR.Trousers_Police_KSP_Winter'},
--                     ['Neck'] = {'Tie_Full_Police_KSP', 'Tie_Worn_Police_KSP'},
--                 },
--             },
--             ['nurse'] = {meadeEMS, jeffersonEMS},
--             ['fireofficer'] = getFirefighterOutfits('Meade'),
--             ['parkranger'] = {
--                 {
--                     ['Hat'] = 'STFR.Hat_Ranger_Federal',
--                     ['Jacket'] = 'STFR.Jacket_Ranger_Federal',
--                     ['Shirt'] = 'STFR.Shirt_Ranger_Federal',
--                     ['Tshirt'] = 'STFR.TShirt_Ranger_Federal',
--                     ['Pants'] = 'STFR.Trousers_Ranger_Federal',
--                 },
--                 {
--                     ['Hat'] = 'STFR.Hat_Ranger_State_Park',
--                     ['Jacket'] = 'STFR.Jacket_Ranger_State_Park',
--                     ['Shirt'] = 'STFR.Shirt_Ranger_State_Park',
--                     ['Tshirt'] = 'STFR.TShirt_Ranger_State_Park',
--                     ['Pants'] = 'STFR.Trousers_Ranger_State_Park',
--                 },
--                 {
--                     ['Hat'] = 'STFR.Hat_Ranger_Conservation',
--                     ['Jacket'] = 'STFR.Jacket_Ranger_Conservation',
--                     ['Shirt'] = 'STFR.Shirt_Ranger_Conservation',
--                     ['Tshirt'] = 'STFR.TShirt_Ranger_Conservation',
--                     ['Pants'] = 'STFR.Trousers_Ranger_Conservation',
--                 },
-- 			},
--             ['securityguard'] = {
--                 {
--                     ['Hat'] = 'STFR.Hat_Security_Bank',
--                     ['Jacket'] = 'STFR.Jacket_Security_Bank',
--                     ['Shirt'] = 'STFR.Shirt_Security_Bank',
--                     ['Tshirt'] = 'STFR.TShirt_Security_Bank',
--                     ['Pants'] = 'STFR.Trousers_Security_Bank',
--                     ['Neck'] = {'Tie_Full_Security_Bank', 'Tie_Worn_Security_Bank'},
--                 },
--             }
--         }
--     }

--     OCCL.Outfitter.addMultiMapClothingTable(mapTable)
-- end

-- OCCL.Outfitter.addOutfits(OCCL.Outfitter.STFR_Main.generateClothingTables, OCCL.STFR_Main.checkEnabled)

-- function OCCL.Outfitter.STFR_Main.addBlacklistedItems()
--     if SandboxVars.OccupationalClothing.WantFireman < 3 then
--         local bannedJackets = {'STFR.Jacket_Fireman_Black_Meade', 'STFR.Jacket_Fireman_Khaki_Meade',
--         'STFR.Jacket_Fireman_Black_Rosewood', 'STFR.Jacket_Fireman_Khaki_Rosewood',
--         'STFR.Jacket_Fireman_Black_Louisville', 'STFR.Jacket_Fireman_Khaki_Louisville'}
--         OCCL.Outfitter.addToBlacklist('Jacket', bannedJackets)
--         if SandboxVars.OccupationalClothing.WantFireman < 2 then
--             local bannedTrousers = {'STFR.Trousers_Fireman_Black_Meade', 'STFR.Trousers_Fireman_Khaki_Meade',
--             'STFR.Trousers_Fireman_Black_Rosewood', 'STFR.Trousers_Fireman_Khaki_Rosewood',
--             'STFR.Trousers_Fireman_Black_Louisville', 'STFR.Trousers_Fireman_Khaki_Louisville'}
--             OCCL.Outfitter.addToBlacklist('Pants', bannedTrousers)
--         end
--     end

--     if not SandboxVars.OccupationalClothing.WantHardhats then
--         local bannedHats = {'STFR.Hat_Fireman_Meade_Black', 'STFR.Hat_Fireman_Meade_Red', 'STFR.Hat_Fireman_Meade_Yellow',
--         'STFR.Hat_Fireman_Rosewood_Black', 'STFR.Hat_Fireman_Rosewood_Red', 'STFR.Hat_Fireman_Rosewood_Yellow',
--         'STFR.Hat_Fireman_Louisville_Black', 'STFR.Hat_Fireman_Louisville_Red', 'STFR.Hat_Fireman_Louisville_Yellow'}
--         OCCL.Outfitter.addToBlacklist('Hat', bannedHats)
--     end

--     if not SandboxVars.OccupationalClothing.WantJackets then
--         local bannedJackets = {'STFR.Jacket_Police_Muldraugh_Officer', 'STFR.Jacket_Sheriff_Rosewood_Officer', 'STFR.Jacket_Police_Riverside_Officer',
--         'STFR.Jacket_Police_WestPoint_Officer', 'STFR.Jacket_Police_Louisville_Officer', 'STFR.Jacket_EMS_Louisville', 'STFR.Jacket_Sheriff_Meade_Officer',
--         'STFR.Jacket_Police_Jefferson_Officer', 'STFR.Jacket_Sheriff_Jefferson_Officer', 'STFR.Jacket_Police_KSP_Officer', 'STFR.Jacket_EMS_Meade',
--         'STFR.Jacket_EMS_Jefferson', 'STFR.Jacket_Ranger_Federal', 'STFR.Jacket_Ranger_State_Park', 'STFR.Jacket_Ranger_Conservation',
--         'STFR.Jacket_Security_Bank', 'STFR.Jacket_Dress_Security_Hotel_Havisham', 'STFR.Jacket_Suit_Security_Hotel_Fancy',
-- 		'STFR.Jacket_Security_Mall_Grand_Ohio', 'STFR.Jacket_Security_Mall_Valley_Station', 'STFR.Jacket_Security_Mall_Louisville', 'STFR.Jacket_Sweater_Security_Hotel_Havisham',
-- 		'STFR.Jacket_Sweater_Security_Bank', 'Jacket_Police_Muldraugh_SGT', 'Jacket_Sheriff_Meade_SGT', 'Jacket_Police_WestPoint_SGT', 'Jacket_Police_Riverside_SGT',
--         'Jacket_Sheriff_Rosewood_SGT', 'Jacket_Police_Louisville_SGT', 'Jacket_Police_Jefferson_SGT', 'Jacket_Sheriff_Jefferson_SGT',
--         'Jacket_Police_KSP_SGT', 'Jacket_Police_Muldraugh_CPT', 'Jacket_Sheriff_Meade_CPT', 'Jacket_Police_WestPoint_CPT', 'Jacket_Police_Riverside_CPT',
--         'Jacket_Sheriff_Rosewood_CPT', 'Jacket_Police_Louisville_CPT', 'Jacket_Police_Jefferson_CPT', 'Jacket_Sheriff_Jefferson_CPT',
--         'Jacket_Police_KSP_CPT'}
--         OCCL.Outfitter.addToBlacklist('Jacket', bannedJackets)
--     end

--     if not SandboxVars.OccupationalClothing.WantVests then
--         OCCL.Outfitter.addToBlacklist('TorsoExtra', 'STFR.Vest_BulletPolice_Meade')
--     end
-- end

-- OCCL.Outfitter.addBlacklistedItems(OCCL.Outfitter.STFR_Main.addBlacklistedItems, OCCL.STFR_Main.checkEnabled)

-- function OCCL.Outfitter.STFR_Main.banSeasonalItems(month)
--     if month == 12 or month < 3 then
--         OCCL.Outfitter.addTableToBlacklist({['Tshirt'] = {'STFR.TShirt_Police_Muldraugh_Officer', 'STFR.TShirt_Sheriff_Rosewood_Officer', 'STFR.TShirt_Police_Riverside_Officer',
--         'STFR.TShirt_Police_WestPoint_Officer', 'STFR.TShirt_Police_Louisville_Officer', 'STFR.TShirt_EMS_Louisville', 'STFR.TShirt_Sheriff_Meade_Officer',
--         'STFR.TShirt_Police_Jefferson_Officer', 'STFR.TShirt_Sheriff_Jefferson_Officer', 'STFR.TShirt_Police_KSP_Officer', 'STFR.TShirt_EMS_Meade',
--         'STFR.TShirt_EMS_Jefferson', 'STFR.TShirt_Ranger_Federal', 'STFR.TShirt_Ranger_State_Park', 'STFR.TShirt_Ranger_Conservation',
-- 		'STFR.TShirt_Security_Bank', 'STFR.TShirt_Security_Hotel_Havisham', 'STFR.TShirt_Polo_Security_Hotel_Fancy', 'STFR.TShirt_Security_Mall_Grand_Ohio',
-- 		'STFR.TShirt_Security_Mall_Valley_Station', 'STFR.TShirt_Security_Mall_Louisville', 'TShirt_Police_Muldraugh_SGT', 'TShirt_Sheriff_Meade_SGT', 'TShirt_Police_WestPoint_SGT', 'TShirt_Police_Riverside_SGT', 'TShirt_Sheriff_Rosewood_SGT',
--         'TShirt_Police_Louisville_SGT', 'TShirt_Police_Jefferson_SGT', 'TShirt_Sheriff_Jefferson_SGT', 'TShirt_Police_KSP_SGT', 'TShirt_Police_Muldraugh_CPT', 'TShirt_Sheriff_Meade_CPT', 'TShirt_Police_WestPoint_CPT', 'TShirt_Police_Riverside_CPT', 'TShirt_Sheriff_Rosewood_CPT',
--         'TShirt_Police_Louisville_CPT', 'TShirt_Police_Jefferson_CPT', 'TShirt_Sheriff_Jefferson_CPT', 'TShirt_Police_KSP_CPT'},
--         ['Pants'] = 'STFR.Trousers_PoliceKSP_Summer'})
--     elseif month < 6 then
--         OCCL.Outfitter.addTableToBlacklist({['Tshirt'] = {'STFR.TShirt_Police_Muldraugh_Officer', 'STFR.TShirt_Sheriff_Rosewood_Officer', 'STFR.TShirt_Police_Riverside_Officer',
--         'STFR.TShirt_Police_WestPoint_Officer', 'STFR.TShirt_Police_Louisville_Officer', 'STFR.TShirt_EMS_Louisville', 'STFR.TShirt_Sheriff_Meade_Officer',
--         'STFR.TShirt_Police_Jefferson_Officer', 'STFR.TShirt_Sheriff_Jefferson_Officer', 'STFR.TShirt_Police_KSP_Officer', 'STFR.TShirt_EMS_Meade',
--         'STFR.TShirt_EMS_Jefferson', 'STFR.TShirt_Ranger_Federal', 'STFR.TShirt_Ranger_State_Park', 'STFR.TShirt_Ranger_Conservation',
-- 		'STFR.TShirt_Security_Bank', 'STFR.TShirt_Security_Hotel_Havisham', 'STFR.TShirt_Polo_Security_Hotel_Fancy', 'STFR.TShirt_Security_Mall_Grand_Ohio',
-- 		'STFR.TShirt_Security_Mall_Valley_Station', 'STFR.TShirt_Security_Mall_Louisville', 'TShirt_Police_Muldraugh_SGT', 'TShirt_Sheriff_Meade_SGT', 'TShirt_Police_WestPoint_SGT', 'TShirt_Police_Riverside_SGT', 'TShirt_Sheriff_Rosewood_SGT',
--         'TShirt_Police_Louisville_SGT', 'TShirt_Police_Jefferson_SGT', 'TShirt_Sheriff_Jefferson_SGT', 'TShirt_Police_KSP_SGT', 'TShirt_Police_Muldraugh_CPT', 'TShirt_Sheriff_Meade_CPT', 'TShirt_Police_WestPoint_CPT', 'TShirt_Police_Riverside_CPT', 'TShirt_Sheriff_Rosewood_CPT',
--         'TShirt_Police_Louisville_CPT', 'TShirt_Police_Jefferson_CPT', 'TShirt_Sheriff_Jefferson_CPT', 'TShirt_Police_KSP_CPT'},
--         ['Jacket'] = {'STFR.Jacket_Police_Muldraugh_Officer', 'STFR.Jacket_Sheriff_Rosewood_Officer', 'STFR.Jacket_Police_Riverside_Officer',
--         'STFR.Jacket_Police_WestPoint_Officer', 'STFR.Jacket_Police_Louisville_Officer', 'STFR.Jacket_EMS_Louisville', 'STFR.Jacket_Sheriff_Meade_Officer',
--         'STFR.Jacket_Police_Jefferson_Officer', 'STFR.Jacket_Sheriff_Jefferson_Officer', 'STFR.Jacket_Police_KSP_Officer', 'STFR.Jacket_EMS_Meade',
--         'STFR.Jacket_EMS_Jefferson', 'STFR.Jacket_Ranger_Federal', 'STFR.Jacket_Ranger_State_Park', 'STFR.Jacket_Ranger_Conservation',
--         'STFR.Jacket_Security_Bank', 'STFR.Jacket_Dress_Security_Hotel_Havisham', 'STFR.Jacket_Suit_Security_Hotel_Fancy',
-- 		'STFR.Jacket_Security_Mall_Grand_Ohio', 'STFR.Jacket_Security_Mall_Valley_Station', 'STFR.Jacket_Security_Mall_Louisville', 'STFR.Jacket_Sweater_Security_Hotel_Havisham',
-- 		'STFR.Jacket_Sweater_Security_Bank', 'Jacket_Police_Muldraugh_SGT', 'Jacket_Sheriff_Meade_SGT', 'Jacket_Police_WestPoint_SGT', 'Jacket_Police_Riverside_SGT',
--         'Jacket_Sheriff_Rosewood_SGT', 'Jacket_Police_Louisville_SGT', 'Jacket_Police_Jefferson_SGT', 'Jacket_Sheriff_Jefferson_SGT',
--         'Jacket_Police_KSP_SGT', 'Jacket_Police_Muldraugh_CPT', 'Jacket_Sheriff_Meade_CPT', 'Jacket_Police_WestPoint_CPT', 'Jacket_Police_Riverside_CPT',
--         'Jacket_Sheriff_Rosewood_CPT', 'Jacket_Police_Louisville_CPT', 'Jacket_Police_Jefferson_CPT', 'Jacket_Sheriff_Jefferson_CPT',
--         'Jacket_Police_KSP_CPT'},
--         ['Pants'] = 'STFR.Trousers_Police_KSP_Winter'})
--     elseif month < 9 then
--         OCCL.Outfitter.addTableToBlacklist({['Shirt'] = {'STFR.Shirt_Police_Muldraugh_Officer', 'STFR.Shirt_Sheriff_Rosewood_Officer', 'STFR.Shirt_Police_Riverside_Officer',
--         'STFR.Shirt_Police_WestPoint_Officer', 'STFR.Shirt_Police_Louisville_Officer', 'STFR.Shirt_EMS_Louisville', 'STFR.Shirt_Sheriff_Meade_Officer',
--         'STFR.Shirt_Police_Jefferson_Officer', 'STFR.Shirt_Sheriff_Jefferson_Officer', 'STFR.Shirt_Police_KSP_Officer', 'STFR.Shirt_EMS_Meade',
--         'STFR.Shirt_EMS_Jefferson', 'STFR.Shirt_Ranger_Federal', 'STFR.Shirt_Ranger_State_Park', 'STFR.Shirt_Ranger_Conservation',
-- 		'STFR.Shirt_Security_Bank', 'STFR.Shirt_Security_Hotel_Havisham', 'STFR.Shirt_Security_Hotel_Fancy', 'STFR.Shirt_Security_Mall_Grand_Ohio', 'STFR.Shirt_Security_Mall_Valley_Station', 'STFR.Shirt_Security_Mall_Louisville', 'Shirt_Police_Muldraugh_SGT', 'Shirt_Sheriff_Meade_SGT', 'Shirt_Police_WestPoint_SGT', 'Shirt_Police_Riverside_SGT', 'Shirt_Sheriff_Rosewood_SGT',
--         'Shirt_Police_Louisville_SGT', 'Shirt_Police_Jefferson_SGT', 'Shirt_Sheriff_Jefferson_SGT', 'Shirt_Police_KSP_SGT', 'Shirt_Police_Muldraugh_CPT', 'Shirt_Sheriff_Meade_CPT', 'Shirt_Police_WestPoint_CPT', 'Shirt_Police_Riverside_CPT', 'Shirt_Sheriff_Rosewood_CPT',
--         'Shirt_Police_Louisville_CPT', 'Shirt_Police_Jefferson_CPT', 'Shirt_Sheriff_Jefferson_CPT', 'Shirt_Police_KSP_CPT'},
--         ['Jacket'] = {'STFR.Jacket_Police_Muldraugh_Officer', 'STFR.Jacket_Sheriff_Rosewood_Officer', 'STFR.Jacket_Police_Riverside_Officer',
--         'STFR.Jacket_Police_WestPoint_Officer', 'STFR.Jacket_Police_Louisville_Officer', 'STFR.Jacket_EMS_Louisville', 'STFR.Jacket_Sheriff_Meade_Officer',
--         'STFR.Jacket_Police_Jefferson_Officer', 'STFR.Jacket_Sheriff_Jefferson_Officer', 'STFR.Jacket_Police_KSP_Officer', 'STFR.Jacket_EMS_Meade',
--         'STFR.Jacket_EMS_Jefferson', 'STFR.Jacket_Ranger_Federal', 'STFR.Jacket_Ranger_State_Park', 'STFR.Jacket_Ranger_Conservation',
--         'STFR.Jacket_Security_Bank', 'STFR.Jacket_Dress_Security_Hotel_Havisham', 'STFR.Jacket_Suit_Security_Hotel_Fancy',
-- 		'STFR.Jacket_Security_Mall_Grand_Ohio', 'STFR.Jacket_Security_Mall_Valley_Station', 'STFR.Jacket_Security_Mall_Louisville', 'STFR.Jacket_Sweater_Security_Hotel_Havisham',
-- 		'STFR.Jacket_Sweater_Security_Bank', 'Jacket_Police_Muldraugh_SGT', 'Jacket_Sheriff_Meade_SGT', 'Jacket_Police_WestPoint_SGT', 'Jacket_Police_Riverside_SGT',
--         'Jacket_Sheriff_Rosewood_SGT', 'Jacket_Police_Louisville_SGT', 'Jacket_Police_Jefferson_SGT', 'Jacket_Sheriff_Jefferson_SGT',
--         'Jacket_Police_KSP_SGT', 'Jacket_Police_Muldraugh_CPT', 'Jacket_Sheriff_Meade_CPT', 'Jacket_Police_WestPoint_CPT', 'Jacket_Police_Riverside_CPT',
--         'Jacket_Sheriff_Rosewood_CPT', 'Jacket_Police_Louisville_CPT', 'Jacket_Police_Jefferson_CPT', 'Jacket_Sheriff_Jefferson_CPT',
--         'Jacket_Police_KSP_CPT'},
--         ['Pants'] = 'STFR.Trousers_Police_KSP_Winter'})
--     else
--         OCCL.Outfitter.addTableToBlacklist({['Tshirt'] = {'STFR.TShirt_Police_Muldraugh_Officer', 'STFR.TShirt_Sheriff_Rosewood_Officer', 'STFR.TShirt_Police_Riverside_Officer',
--         'STFR.TShirt_Police_WestPoint_Officer', 'STFR.TShirt_Police_Louisville_Officer', 'STFR.TShirt_EMS_Louisville', 'STFR.TShirt_Sheriff_Meade_Officer',
--         'STFR.TShirt_Police_Jefferson_Officer', 'STFR.TShirt_Sheriff_Jefferson_Officer', 'STFR.TShirt_Police_KSP_Officer', 'STFR.TShirt_EMS_Meade',
--         'STFR.TShirt_EMS_Jefferson', 'STFR.TShirt_Ranger_Federal', 'STFR.TShirt_Ranger_State_Park', 'STFR.TShirt_Ranger_Conservation',
-- 		'STFR.TShirt_Security_Bank', 'STFR.TShirt_Security_Hotel_Havisham', 'STFR.TShirt_Polo_Security_Hotel_Fancy', 'STFR.TShirt_Security_Mall_Grand_Ohio',
-- 		'STFR.TShirt_Security_Mall_Valley_Station', 'STFR.TShirt_Security_Mall_Louisville', 'TShirt_Police_Muldraugh_SGT', 'TShirt_Sheriff_Meade_SGT', 'TShirt_Police_WestPoint_SGT', 'TShirt_Police_Riverside_SGT', 'TShirt_Sheriff_Rosewood_SGT',
--         'TShirt_Police_Louisville_SGT', 'TShirt_Police_Jefferson_SGT', 'TShirt_Sheriff_Jefferson_SGT', 'TShirt_Police_KSP_SGT', 'TShirt_Police_Muldraugh_CPT', 'TShirt_Sheriff_Meade_CPT', 'TShirt_Police_WestPoint_CPT', 'TShirt_Police_Riverside_CPT', 'TShirt_Sheriff_Rosewood_CPT',
--         'TShirt_Police_Louisville_CPT', 'TShirt_Police_Jefferson_CPT', 'TShirt_Sheriff_Jefferson_CPT', 'TShirt_Police_KSP_CPT'},
--         ['Jacket'] = {'STFR.Jacket_Police_Muldraugh_Officer', 'STFR.Jacket_Sheriff_Rosewood_Officer', 'STFR.Jacket_Police_Riverside_Officer',
--         'STFR.Jacket_Police_WestPoint_Officer', 'STFR.Jacket_Police_Louisville_Officer', 'STFR.Jacket_EMS_Louisville', 'STFR.Jacket_Sheriff_Meade_Officer',
--         'STFR.Jacket_Police_Jefferson_Officer', 'STFR.Jacket_Sheriff_Jefferson_Officer', 'STFR.Jacket_Police_KSP', 'STFR.Jacket_EMS_Meade',
--         'STFR.Jacket_EMS_Jefferson', 'STFR.Jacket_Ranger_Federal', 'STFR.Jacket_Ranger_State_Park', 'STFR.Jacket_Ranger_Conservation',
--         'STFR.Jacket_Security_Bank', 'STFR.Jacket_Dress_Security_Hotel_Havisham', 'STFR.Jacket_Suit_Security_Hotel_Fancy',
-- 		'STFR.Jacket_Security_Mall_Grand_Ohio', 'STFR.Jacket_Security_Mall_Valley_Station', 'STFR.Jacket_Security_Mall_Louisville', 'STFR.Jacket_Sweater_Security_Hotel_Havisham',
-- 		'STFR.Jacket_Sweater_Security_Bank', 'Jacket_Police_Muldraugh_SGT', 'Jacket_Sheriff_Meade_SGT', 'Jacket_Police_WestPoint_SGT', 'Jacket_Police_Riverside_SGT',
--         'Jacket_Sheriff_Rosewood_SGT', 'Jacket_Police_Louisville_SGT', 'Jacket_Police_Jefferson_SGT', 'Jacket_Sheriff_Jefferson_SGT',
--         'Jacket_Police_KSP_SGT', 'Jacket_Police_Muldraugh_CPT', 'Jacket_Sheriff_Meade_CPT', 'Jacket_Police_WestPoint_CPT', 'Jacket_Police_Riverside_CPT',
--         'Jacket_Sheriff_Rosewood_CPT', 'Jacket_Police_Louisville_CPT', 'Jacket_Police_Jefferson_CPT', 'Jacket_Sheriff_Jefferson_CPT',
--         'Jacket_Police_KSP_CPT'},
--         ['Pants'] = 'STFR.Trousers_Police_KSP_Winter'})
--     end
-- end

-- OCCL.Outfitter.addSeasonalBannedItems(OCCL.Outfitter.STFR_Main.banSeasonalItems, OCCL.STFR_Main.checkEnabled)
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
-- require 'occupationalclothing/addons/stfr/stfr_tandil'

-- OCCL.Outfitter.STFR_Tandil = {}

-- function OCCL.Outfitter.STFR_Tandil.generateMapClothingTables()
--     local professionTable = {}

--     professionTable['fireofficer'] = {
--         {
--             ['Hat'] = 'STFR.Hat_Fireman_Tandil_Yellow',
--             ['Jacket'] = 'STFR.Jacket_Fireman_Khaki_Tandil',
--             ['Tshirt'] = {'TShirt_Profession_Fireman_Blue_Tandil', 'TShirt_Profession_Fireman_Red_Tandil', 'TShirt_Profession_Fireman_Red_Tandil02', 'TShirt_Profession_Fireman_White_Tandil',},
--             ['Pants'] = 'STFR.Trousers_Fireman_Khaki_Tandil',
--             ['Shoes'] = 'Base.Shoes_ArmyBoots',
--         },
--         {
--             ['Hat'] = 'STFR.Hat_Fireman_Tandil_Red',
--             ['Jacket'] = 'STFR.Jacket_Fireman_Black_Tandil',
--             ['Tshirt'] = {'TShirt_Profession_Fireman_Blue_Tandil', 'TShirt_Profession_Fireman_Red_Tandil', 'TShirt_Profession_Fireman_Red_Tandil02', 'TShirt_Profession_Fireman_White_Tandil',},
--             ['Pants'] = 'STFR.Trousers_Fireman_Black_Tandil',
--             ['Shoes'] = 'Base.Shoes_ArmyBoots',
--         },
--     }
--     professionTable['policeofficer'] = {
--         {
--             ['Hat'] = 'STFR.Hat_Police_Tandil_Officer',
--             ['Jacket'] = 'STFR.Jacket_Police_Tandil_Officer',
--             ['Shirt'] = 'STFR.Shirt_Police_Tandil_Officer',
--             ['Tshirt'] = 'STFR.TShirt_Police_Tandil_Officer',
--             ['TorsoExtra'] = 'Base.Vest_BulletPolice',
--             ['Pants'] = 'STFR.Trousers_Police_Tandil',
--             ['Neck'] = {'STFR.Tie_Full_Police_Tandil', 'STFR.Tie_Worn_Police_Tandil',},
--         },
--     }
--     professionTable['nurse'] = {
--         {
--             ['Hat'] = 'STFR.Hat_BaseballCap_EMS_Tandil',
--             ['Jacket'] = 'STFR.Jacket_EMS_Tandil',
--             ['Shirt'] = 'STFR.Shirt_EMS_Tandil',
--             ['Tshirt'] = 'STFR.TShirt_EMS_Tandil',
--             ['Pants'] = 'STFR.Trousers_EMS_Tandil',
--         },
--     }

--     OCCL.Outfitter.addMapClothingTable('Tandil', professionTable)
-- end

-- OCCL.Outfitter.addOutfits(OCCL.Outfitter.STFR_Tandil.generateMapClothingTables, OCCL.STFR_Tandil.checkEnabled)

-- function OCCL.Outfitter.STFR_Tandil.addBlacklistedItems()
--     if SandboxVars.OccupationalClothing.WantFireman < 3 then
--         local bannedJackets = {'STFR.Jacket_Fireman_Black_Tandil', 'STFR.Jacket_Fireman_Khaki_Tandil'}
--         OCCL.Outfitter.addToBlacklist('Jacket', bannedJackets)
--         if SandboxVars.OccupationalClothing.WantFireman < 2 then
--             local bannedTrousers = {'STFR.Trousers_Fireman_Black_Tandil', 'STFR.Trousers_Fireman_Khaki_Tandil'}
--             OCCL.Outfitter.addToBlacklist('Pants', bannedTrousers)
--         end
--     end

--     if not SandboxVars.OccupationalClothing.WantHardhats then
--         local bannedHats = {'STFR.Hat_Fireman_Tandil_Blue', 'STFR.Hat_Fireman_Tandil_Black', 'STFR.Hat_Fireman_Tandil_Red',
--         'STFR.Hat_Fireman_Tandil_Yellow'}
--         OCCL.Outfitter.addToBlacklist('Hat', bannedHats)
--     end

--     if not SandboxVars.OccupationalClothing.WantJackets then
--         local bannedJackets = {'STFR.Jacket_Police_Tandil', 'STFR.Jacket_EMS_Tandil'}
--         OCCL.Outfitter.addToBlacklist('Jacket', bannedJackets)
--     end
-- end

-- OCCL.Outfitter.addBlacklistedItems(OCCL.Outfitter.STFR_Tandil.addBlacklistedItems, OCCL.STFR_Tandil.checkEnabled)

-- function OCCL.Outfitter.STFR_Tandil.banSeasonalItems(month)
--     if month == 12 or month < 3 then
--         OCCL.Outfitter.addToBlacklist({['Tshirt'] = {'STFR.TShirt_Police_Tandil_Officer', 'TShirt_Police_Tandil_SGT', 'TShirt_Police_Tandil_CPT', 'STFR.TShirt_EMS_Tandil'}})
--     elseif month < 6 then
--         OCCL.Outfitter.addTableToBlacklist({['Tshirt'] = {'STFR.TShirt_Police_Tandil_Officer', 'TShirt_Police_Tandil_SGT', 'TShirt_Police_Tandil_CPT', 'STFR.TShirt_EMS_Tandil'},
--                                 ['Jacket'] = {'STFR.Jacket_Police_Tandil_Officer', 'Jacket_Police_Tandil_SGT', 'Jacket_Police_Tandil_CPT', 'STFR.Jacket_EMS_Tandil'}})
--     elseif month < 9 then
--         OCCL.Outfitter.addTableToBlacklist({['Shirt'] = {'STFR.Shirt_Police_Tandil_Officer', 'Shirt_Police_Tandil_SGT', 'Shirt_Police_Tandil_CPT', 'STFR.Shirt_EMS_Tandil'},
--                                 ['Jacket'] = {'STFR.Jacket_Police_Tandil_Officer', 'Jacket_Police_Tandil_SGT', 'Jacket_Police_Tandil_CPT', 'STFR.Jacket_EMS_Tandil'}})
--     else
--         OCCL.Outfitter.addTableToBlacklist({['Tshirt'] = {'STFR.TShirt_Police_Tandil_Officer', 'TShirt_Police_Tandil_SGT', 'TShirt_Police_Tandil_CPT', 'STFR.TShirt_EMS_Tandil'},
--                                 ['Jacket'] = {'STFR.Jacket_Police_Tandil_Officer', 'Jacket_Police_Tandil_SGT', 'Jacket_Police_Tandil_CPT', 'STFR.Jacket_EMS_Tandil'}})
--     end
-- end

-- OCCL.Outfitter.addSeasonalBannedItems(OCCL.Outfitter.STFR_Tandil.banSeasonalItems, OCCL.STFR_Tandil.checkEnabled)
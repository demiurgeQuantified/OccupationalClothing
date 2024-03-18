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
-- require 'occupationalclothing/addons/stfr/stfr_greenport'

-- OCCL.Outfitter.STFR_Greenport = {}

-- function OCCL.Outfitter.STFR_Greenport.generateMapClothingTables()
--     local professionTable = {}

--     professionTable['policeofficer'] = {
--         {
--             ['Hat'] = 'STFR.Hat_Police_Greenport_Officer',
--             ['Jacket'] = 'STFR.Jacket_Police_Greenport_Officer',
--             ['Shirt'] = 'STFR.Shirt_Police_Greenport_Officer',
--             ['Tshirt'] = 'STFR.TShirt_Police_Greenport_Officer',
--             ['TorsoExtra'] = 'Base.Vest_BulletPolice',
--             ['Pants'] = 'STFR.Trousers_Police_Greenport',
--             ['Neck'] = {'STFR.Tie_Full_Police_Greenport', 'STFR.Tie_Worn_Police_Greenport',},
--         },
--     }

--     OCCL.Outfitter.addMapClothingTable('Greenport', professionTable)
-- end

-- OCCL.Outfitter.addOutfits(OCCL.Outfitter.STFR_Greenport.generateMapClothingTables, OCCL.STFR_Greenport.checkEnabled)

-- function OCCL.Outfitter.STFR_Greenport.addBlacklistedItems()
--     if not SandboxVars.OccupationalClothing.WantJackets then
--         local bannedJackets = {'STFR.Jacket_Police_Greenport_Officer'}
--         OCCL.Outfitter.addToBlacklist('Jacket', bannedJackets)
--     end
-- end

-- OCCL.Outfitter.addBlacklistedItems(OCCL.Outfitter.STFR_Greenport.addBlacklistedItems, OCCL.STFR_Greenport.checkEnabled)

-- function OCCL.Outfitter.STFR_Greenport.banSeasonalItems(month)
--     if month == 12 or month < 3 then
--         OCCL.Outfitter.addToBlacklist({['Tshirt'] = {'STFR.TShirt_Police_Greenport_Officer', 'TShirt_Police_Greenport_SGT', 'TShirt_Police_Greenport_CPT'}})
--     elseif month < 6 then
--         OCCL.Outfitter.addTableToBlacklist({['Tshirt'] = {'STFR.TShirt_Police_Greenport_Officer', 'TShirt_Police_Greenport_SGT', 'TShirt_Police_Greenport_CPT'},
--                                 ['Jacket'] = {'STFR.Jacket_Police_Greenport_Officer', 'Jacket_Police_Greenport_SGT', 'Jacket_Police_Greenport_CPT'}})
--     elseif month < 9 then
--         OCCL.Outfitter.addTableToBlacklist({['Shirt'] = {'STFR.Shirt_Police_Greenport_Officer', 'Shirt_Police_Greenport_SGT', 'Shirt_Police_Greenport_CPT'},
--                                 ['Jacket'] = {'STFR.Jacket_Police_Greenport_Officer', 'Jacket_Police_Greenport_SGT', 'Jacket_Police_Greenport_CPT'}})
--     else
--         OCCL.Outfitter.addTableToBlacklist({['Tshirt'] = {'STFR.TShirt_Police_Greenport_Officer','TShirt_Police_Greenport_SGT', 'TShirt_Police_Greenport_CPT'},
--                                 ['Jacket'] = {'STFR.Jacket_Police_Greenport_Officer', 'Jacket_Police_Greenport_SGT', 'Jacket_Police_Greenport_CPT'}})
--     end
-- end

-- OCCL.Outfitter.addSeasonalBannedItems(OCCL.Outfitter.STFR_Greenport.banSeasonalItems, OCCL.STFR_Greenport.checkEnabled)
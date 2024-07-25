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
require 'occupationalclothing/addons/stfr/stfr_blackwood'

OCCL.Outfitter.STFR_Blackwood = {}

function OCCL.Outfitter.STFR_Blackwood.generateMapClothingTables()
    local professionTable = {}

    professionTable['policeofficer'] = {
        {
            ['Hat'] = 'STFR.Hat_Police_Blackwood_Officer',
            ['Jacket'] = 'STFR.Jacket_Police_Blackwood_Officer',
            ['Shirt'] = 'STFR.Shirt_Police_Blackwood_Officer',
            ['Tshirt'] = 'STFR.TShirt_Police_Blackwood_Officer',
            ['TorsoExtra'] = 'Base.Vest_BulletPolice',
            ['Pants'] = 'STFR.Trousers_Police_Blackwood',
            ['Neck'] = {'STFR.Tie_Full_Police_Blackwood', 'STFR.Tie_Worn_Police_Blackwood',},
            ['Shoes'] = {'Base.Shoes_Black', 'Base.Shoes_Brown'},
        },
    }
    professionTable['nurse'] = {
        {
            ['Hat'] = 'STFR.Hat_BaseballCap_EMS_Blackwood',
            ['Jacket'] = 'STFR.Jacket_EMS_Blackwood',
            ['Shirt'] = 'STFR.Shirt_EMS_Blackwood',
            ['Tshirt'] = 'STFR.TShirt_EMS_Blackwood',
            ['Pants'] = 'STFR.Trousers_EMS_Blackwood',
            ['Shoes'] = {'Base.Shoes_Black', 'Base.Shoes_Brown'},
        },
    }

    OCCL.Outfitter.addMapClothingTable('Blackwood', professionTable)
end

OCCL.Outfitter.addOutfits(OCCL.Outfitter.STFR_Blackwood.generateMapClothingTables, OCCL.STFR_Blackwood.checkEnabled)

function OCCL.Outfitter.STFR_Blackwood.addBlacklistedItems()
    if not SandboxVars.OccupationalClothing.WantJackets then
        local bannedJackets = {'STFR.Jacket_Police_Blackwood_Officer', 'Jacket_Police_Blackwood_SGT', 'Jacket_Police_Blackwood_CPT', 'STFR.Jacket_EMS_Blackwood'}
        OCCL.Outfitter.addToBlacklist('Jacket', bannedJackets)
    end
end

OCCL.Outfitter.addBlacklistedItems(OCCL.Outfitter.STFR_Blackwood.addBlacklistedItems, OCCL.STFR_Blackwood.checkEnabled)

function OCCL.Outfitter.STFR_Blackwood.banSeasonalItems(month)
    if month == 12 or month < 3 then
        OCCL.Outfitter.addToBlacklist({['Tshirt'] = {'STFR.TShirt_Police_Blackwood_Officer', 'TShirt_Police_Blackwood_SGT', 'TShirt_Police_Blackwood_CPT', 'STFR.TShirt_EMS_Blackwood'}})
    elseif month < 6 then
        OCCL.Outfitter.addTableToBlacklist({['Tshirt'] = {'STFR.TShirt_Police_Blackwood_Officer', 'TShirt_Police_Blackwood_SGT', 'TShirt_Police_Blackwood_CPT', 'STFR.TShirt_EMS_Blackwood'},
                                ['Jacket'] = {'STFR.Jacket_Police_Blackwood_Officer', 'Jacket_Police_Blackwood_SGT', 'Jacket_Police_Blackwood_CPT', 'STFR.Jacket_EMS_Blackwood'}})
    elseif month < 9 then
        OCCL.Outfitter.addTableToBlacklist({['Shirt'] = {'STFR.Shirt_Police_Blackwood_Officer', 'Shirt_Police_Blackwood_SGT', 'Shirt_Police_Blackwood_CPT', 'STFR.Shirt_EMS_Blackwood'},
                                ['Jacket'] = {'STFR.Jacket_Police_Blackwood_Officer', 'Jacket_Police_Blackwood_SGT', 'Jacket_Police_Blackwood_CPT', 'STFR.Jacket_EMS_Blackwood'}})
    else
        OCCL.Outfitter.addTableToBlacklist({['Tshirt'] = {'STFR.TShirt_Police_Blackwood_Officer', 'TShirt_Police_Blackwood_SGT', 'TShirt_Police_Blackwood_CPT', 'STFR.TShirt_EMS_Blackwood'},
                                ['Jacket'] = {'STFR.Jacket_Police_Blackwood_Officer', 'Jacket_Police_Blackwood_SGT', 'Jacket_Police_Blackwood_CPT', 'STFR.Jacket_EMS_Blackwood'}})
    end
end

OCCL.Outfitter.addSeasonalBannedItems(OCCL.Outfitter.STFR_Blackwood.banSeasonalItems, OCCL.STFR_Blackwood.checkEnabled)
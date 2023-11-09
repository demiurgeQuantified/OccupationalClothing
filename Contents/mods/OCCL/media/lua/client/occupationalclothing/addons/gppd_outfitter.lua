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
require 'occupationalclothing/addons/gppd'

OCCL.Outfitter.GPPD = {}

function OCCL.Outfitter.GPPD.generateMapClothingTables()
    local professionTable = {}

    professionTable['policeofficer'] = {
        {
            ['Hat'] = 'STR.Hat_Police_Greenport',
            ['Jacket'] = 'STR.Jacket_Police_Greenport',
            ['Shirt'] = 'STR.Shirt_Police_Greenport',
            ['Tshirt'] = 'STR.TShirt_Police_Greenport',
            ['TorsoExtra'] = 'Base.Vest_BulletPolice',
            ['Pants'] = 'STR.Trousers_Police_Greenport',
            ['Neck'] = {'STR.Tie_Full_Police_Greenport', 'STR.Tie_Worn_Police_Greenport',},
        },
    }

    OCCL.Outfitter.addMapClothingTable('Greenport', professionTable)
end

OCCL.Outfitter.addOutfits(OCCL.Outfitter.GPPD.generateMapClothingTables, OCCL.GPPD.checkEnabled)

function OCCL.Outfitter.GPPD.addBlacklistedItems()
    if not SandboxVars.OccupationalClothing.WantJackets then
        local bannedJackets = {'STR.Jacket_Police_Greenport'}
        OCCL.Outfitter.addToBlacklist('Jacket', bannedJackets)
    end
end

OCCL.Outfitter.addBlacklistedItems(OCCL.Outfitter.GPPD.addBlacklistedItems, OCCL.GPPD.checkEnabled)

function OCCL.Outfitter.GPPD.banSeasonalItems(month)
    if month == 12 or month < 3 then
        OCCL.Outfitter.addToBlacklist({['Tshirt'] = {'STR.TShirt_Police_Greenport'}})
    elseif month < 6 then
        OCCL.Outfitter.addTableToBlacklist({['Tshirt'] = {'STR.TShirt_Police_Greenport'},
                                ['Jacket'] = {'STR.Jacket_Police_Greenport'}})
    elseif month < 9 then
        OCCL.Outfitter.addTableToBlacklist({['Shirt'] = {'STR.Shirt_Police_Greenport'},
                                ['Jacket'] = {'STR.Jacket_Police_Greenport'}})
    else
        OCCL.Outfitter.addTableToBlacklist({['Tshirt'] = {'STR.TShirt_Police_Greenport'},
                                ['Jacket'] = {'STR.Jacket_Police_Greenport'}})
    end
end

OCCL.Outfitter.addSeasonalBannedItems(OCCL.Outfitter.GPPD.banSeasonalItems, OCCL.GPPD.checkEnabled)
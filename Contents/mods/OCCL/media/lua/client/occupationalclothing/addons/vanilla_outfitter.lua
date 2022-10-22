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
require 'occupationalclothing/addons/vanilla'

OCCL.Outfitter.Vanilla = {}

function OCCL.Outfitter.Vanilla.addBlacklistedItems()
    if SandboxVars.OccupationalClothing.WantFireman < 3 then
        OCCL.Outfitter.addToBlacklist('Jacket', 'Base.Jacket_Fireman')
        if SandboxVars.OccupationalClothing.WantFireman < 2 then
            OCCL.Outfitter.addToBlacklist('Pants', 'Base.Trousers_Fireman')
        end
    end
    if not SandboxVars.OccupationalClothing.WantHardhats then
        OCCL.Outfitter.addToBlacklist('Hat', 'Base.Hat_Fireman')
    end
    if not SandboxVars.OccupationalClothing.WantJackets then
        local bannedJackets = {'Base.Jacket_Police', 'Base.Jacket_Ranger'}
        OCCL.Outfitter.addToBlacklist('Jacket', bannedJackets)
    end
    if not SandboxVars.OccupationalClothing.WantVests then
        OCCL.Outfitter.addToBlacklist('TorsoExtra', 'Base.Vest_BulletPolice')
    end
end

OCCL.Outfitter.addBlacklistedItems(OCCL.Outfitter.Vanilla.addBlacklistedItems)

function OCCL.Outfitter.Vanilla.generateMapClothingTables()
    local professionTable = {}

    professionTable['burgerflipper'] = {
        {
            ['Hat'] = 'Base.Hat_FastFood_Spiffo',
            ['Tshirt'] = 'Base.Tshirt_BusinessSpiffo',
            ['TorsoExtra'] = {'Base.Apron_Spiffos',''},
        },
        {
            ['Hat'] = 'Base.Hat_FastFood',
            ['Tshirt'] = 'Base.Tshirt_PizzaWhirled',
            ['TorsoExtra'] = {'Base.Apron_PizzaWhirled',''},
        },
        {
            ['Hat'] = 'Base.Hat_FastFood',
            ['Tshirt'] = 'Base.Tshirt_PileOCrepe',
            ['TorsoExtra'] = {'Base.Apron_PileOCrepe',''},
        },
    }

    if SandboxVars.OccupationalClothing.WantVanillaEMS then
        professionTable['fireofficer'] = {
            {
                ['Hat'] = 'Base.Hat_Fireman',
                ['Jacket'] = 'Base.Jacket_Fireman',
                ['Tshirt'] = {'Tshirt_Profession_FiremanBlue', 'Tshirt_Profession_FiremanRed', 'Tshirt_Profession_FiremanRed02', 'Tshirt_Profession_FiremanWhite'},
                ['Pants'] = 'Base.Trousers_Fireman',
            },
        }

        professionTable['policeofficer'] = {
            {
                ['Hat'] = 'Base.Hat_Police',
                ['Jacket'] = '',
                ['Shirt'] = {'Base.Shirt_PoliceBlue', 'Base.Shirt_OfficerWhite'},
                ['Tshirt'] = 'Base.Tshirt_PoliceBlue',
                ['TorsoExtra'] = 'Base.Vest_BulletPolice',
                ['Pants'] = 'Base.Trousers_Police',
                ['Neck'] = '',
            },
            {
                ['Hat'] = 'Base.Hat_Police_Grey',
                ['Jacket'] = 'Base.Jacket_Police',
                ['Shirt'] = {'Base.Shirt_PoliceGrey', 'Base.Shirt_OfficerWhite'},
                ['Tshirt'] = 'Base.Tshirt_PoliceGrey',
                ['TorsoExtra'] = '',
                ['Pants'] = 'Base.Trousers_PoliceGrey',
                ['Neck'] = '',
            },
        }

        professionTable['parkranger'] = {
            {
                ['Hat'] = 'Base.Hat_Ranger',
                ['Jacket'] = 'Base.Jacket_Ranger',
                ['Shirt'] = {'Base.Shirt_Ranger', 'Base.Shirt_OfficerWhite'},
                ['Tshirt'] = 'Base.Tshirt_Ranger',
                ['Pants'] = 'Base.Trousers_Ranger',
            },
        }
    end

    OCCL.Outfitter.addMapClothingTable('generic', professionTable)
end

OCCL.Outfitter.addOutfits(OCCL.Outfitter.Vanilla.generateMapClothingTables)

function OCCL.Outfitter.Vanilla.banSeasonalItems(month)
    if month == 12 or month < 3 then
        OCCL.Outfitter.addToBlacklist('Tshirt', {'Base.Tshirt_PoliceBlue', 'Base.Tshirt_PoliceGrey', 'Base.Tshirt_Ranger'})
    elseif month < 6 then
        OCCL.Outfitter.addTableToBlacklist({['Tshirt'] = {'Base.Tshirt_PoliceBlue', 'Base.Tshirt_PoliceGrey', 'Base.Tshirt_Ranger'},
                                ['Jacket'] = {'Base.Jacket_Police', 'Base.Jacket_Ranger'}})
    elseif month < 9 then
        OCCL.Outfitter.addTableToBlacklist({['Shirt'] = {'Base.Shirt_PoliceBlue', 'Base.Shirt_PoliceGrey', 'Base.Shirt_OfficerWhite', 'Base.Shirt_Ranger'},
                                ['Jacket'] = {'Base.Jacket_Police', 'Base.Jacket_Ranger'}})
    else
        OCCL.Outfitter.addTableToBlacklist({['Tshirt'] = {'Base.Tshirt_PoliceBlue', 'Base.Tshirt_PoliceGrey', 'Base.Tshirt_Ranger'},
                                ['Jacket'] = {'Base.Jacket_Police', 'Base.Jacket_Ranger'}})
    end
end

OCCL.Outfitter.addSeasonalBannedItems(OCCL.Outfitter.Vanilla.banSeasonalItems, OCCL.Vanilla.CheckEMSEnabled)
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
require 'occupationalclothing/main'

-- Small Town Responders (https://steamcommunity.com/sharedfiles/filedetails/?id=2623855083)
OCCL.STFR_LVIA = {}

function OCCL.STFR_LVIA.checkEnabled()
    return (SandboxVars.OccupationalClothing.WantSTR and getActivatedMods():contains('STFRLVIA') and getActivatedMods():contains('SimonMDLVInternationalAirport'))
end

function OCCL.STFR_LVIA.addClothes()
    OCCL.UpdateClothing('fireofficer', {
        Shirt = {'Shirt_Fire_LVIA'},
        Tshirt = {'TShirt_Profession_Fireman_Blue_LVIA', 'TShirt_Profession_Fireman_Red_LVIA', 'TShirt_Profession_Fireman_Red_LVIA02', 'TShirt_Profession_Fireman_White_LVIA',},
        Pants = {'Trousers_Fire_Formal_LVIA',},
    }, 'STFR')
    OCCL.UpdateClothing('policeofficer', {
        Hat = {'Hat_Police_LVIA_Officer'},
        Shirt = {'Shirt_Police_LVIA_Officer'},
        Tshirt = {'TShirt_Police_LVIA_Officer'},
        Pants = {'Trousers_Police_LVIA'},
		Neck = {'Tie_Full_Police_LVIA', 'Tie_Worn_Police_LVIA'},
        --ChestWalkie = {'Chest_Walkie'},
        --DutyBelt = {'Belt_PoliceDuty'},
	}, 'STFR')

    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Police_LVIA_Officer'},
        }, 'STFR')
    end

    if SandboxVars.OccupationalClothing.WantFireman > 1 then
        OCCL.UpdateClothing('fireofficer', {
            Pants = {'Trousers_Fireman_Black_LVIA', 'Trousers_Fireman_Khaki_LVIA'},
        }, 'STFR')
        if SandboxVars.OccupationalClothing.WantFireman > 2 then
            OCCL.UpdateClothing('fireofficer', {
                Jacket = {'Jacket_Fireman_Black_LVIA', 'Jacket_Fireman_Khaki_LVIA'},
            }, 'STFR')
        end
    end

    if SandboxVars.OccupationalClothing.WantHardhats then
        OCCL.UpdateClothing('fireofficer', {
            Hat = {'Hat_Fireman_LVIA_White', 'Hat_Fireman_LVIA_Orange', 'Hat_Fireman_LVIA_Red'},
        }, 'STFR')
    end
end

OCCL.addAdditionalClothing(OCCL.STFR_LVIA.addClothes, OCCL.STFR_LVIA.checkEnabled)

function OCCL.STFR_LVIA.checkRanksEnabled()
    return (SandboxVars.OccupationalClothing.WantSTRRanks and OCCL.STFR_LVIA.checkEnabled())
end

function OCCL.STFR_LVIA.addRankedOutfits()
    OCCL.UpdateClothing('policeofficer', {
        Hat = {'Hat_Police_LVIA_SGT', 'Hat_Police_LVIA_CPT'},
        Shirt = {'Shirt_Police_LVIA_SGT', 'Shirt_Police_LVIA_CPT'},
        Tshirt = {'TShirt_Police_LVIA_SGT', 'TShirt_Police_LVIA_CPT'},
    }, 'STFR')
    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Police_LVIA_SGT', 'Jacket_Police_LVIA_CPT'},
        }, 'STFR')
    end
end

OCCL.addAdditionalClothing(OCCL.STFR_LVIA.addRankedOutfits, OCCL.STFR_LVIA.checkRanksEnabled)

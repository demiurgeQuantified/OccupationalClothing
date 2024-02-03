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
OCCL.STFR_Tikitown = {}

function OCCL.STFR_Tikitown.checkEnabled()
    return (SandboxVars.OccupationalClothing.WantSTR and getActivatedMods():contains('STFRTT') and getActivatedMods():contains('tikitown'))
end

function OCCL.STFR_Tikitown.addClothes()
    OCCL.UpdateClothing('fireofficer', {
        Shirt = {'Shirt_Fire_Tikitown'},
        Tshirt = {'TShirt_Profession_Fireman_Blue_Tikitown', 'TShirt_Profession_Fireman_Red_Tikitown', 'TShirt_Profession_Fireman_Red_Tikitown02', 'TShirt_Profession_Fireman_White_Tikitown',},
        Pants = {'Trousers_Fire_Formal_Tikitown',},
    }, 'STFR')
    OCCL.UpdateClothing('policeofficer', {
        Hat = {'Hat_Police_Tikitown_Officer'},
        Shirt = {'Shirt_Police_Tikitown_Officer'},
        Tshirt = {'TShirt_Police_Tikitown_Officer'},
        Pants = {'Trousers_Police_Tikitown'},
		Neck = {'Tie_Full_Police_Tikitown', 'Tie_Worn_Police_Tikitown'},
        --ChestWalkie = {'Chest_Walkie'},
        --DutyBelt = {'Belt_PoliceDuty'},
	}, 'STFR')
    OCCL.UpdateClothing('nurse', {
        Hat = {'Hat_BaseballCap_EMS_Tikitown'},
        Shirt = {'Shirt_EMS_Tikitown'},
        Tshirt = {'TShirt_EMS_Tikitown'},
        Pants = {'Trousers_EMS_Tikitown'},
    }, 'STFR')

    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Police_Tikitown_Officer'},
        }, 'STFR')
        OCCL.UpdateClothing('nurse', {
            Jacket = {'Jacket_EMS_Tikitown'},
        }, 'STFR')
    end
    if SandboxVars.OccupationalClothing.WantVests then
        OCCL.UpdateClothing('policeofficer', {
            Hat = {'Hat_Riot_Helmet_Tikitown'},
        }, 'STFR')
    end

    if SandboxVars.OccupationalClothing.WantFireman > 1 then
        OCCL.UpdateClothing('fireofficer', {
            Pants = {'Trousers_Fireman_Black_Tikitown', 'Trousers_Fireman_Khaki_Tikitown'},
        }, 'STFR')
        if SandboxVars.OccupationalClothing.WantFireman > 2 then
            OCCL.UpdateClothing('fireofficer', {
                Jacket = {'Jacket_Fireman_Black_Tikitown', 'Jacket_Fireman_Khaki_Tikitown'},
            }, 'STFR')
        end
    end

    if SandboxVars.OccupationalClothing.WantHardhats then
        OCCL.UpdateClothing('fireofficer', {
            Hat = {'Hat_Fireman_Tikitown_Blue', 'Hat_Fireman_Tikitown_Black', 'Hat_Fireman_Tikitown_Red',
            'Hat_Fireman_Tikitown_Yellow'},
        }, 'STFR')
    end
end

OCCL.addAdditionalClothing(OCCL.STFR_Tikitown.addClothes, OCCL.STFR_Tikitown.checkEnabled)

function OCCL.STFR_Tikitown.checkDressEnabled()
    return (SandboxVars.OccupationalClothing.WantSTRFormalDress and OCCL.STFR_Tikitown.checkEnabled())
end

function OCCL.STFR_Tikitown.addDressOutfits()
    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Dress_Police_Tikitown_Officer'},
        }, 'STFR')
    end
end

OCCL.addAdditionalClothing(OCCL.STFR_Tikitown.addDressOutfits, OCCL.STFR_Tikitown.checkDressEnabled)

function OCCL.STFR_Tikitown.checkRanksEnabled()
    return (SandboxVars.OccupationalClothing.WantSTRRanks and OCCL.STFR_Tikitown.checkEnabled())
end

function OCCL.STFR_Tikitown.addRankedOutfits()
    OCCL.UpdateClothing('policeofficer', {
        Shirt = {'Shirt_Police_Tikitown_SGT', 'Shirt_Police_Tikitown_CPT'},
        Tshirt = {'TShirt_Police_Tikitown_SGT', 'TShirt_Police_Tikitown_CPT'},
    }, 'STFR')
    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Police_Tikitown_SGT', 'Jacket_Police_Tikitown_CPT'},
        }, 'STFR')
    end
end

OCCL.addAdditionalClothing(OCCL.STFR_Tikitown.addRankedOutfits, OCCL.STFR_Tikitown.checkRanksEnabled)

function OCCL.STFR_Tikitown.checkRankedDressEnabled()
    return (SandboxVars.OccupationalClothing.WantSTRFormalDress and SandboxVars.OccupationalClothing.WantSTRRanks and OCCL.STFR_Tikitown.checkEnabled())
end

function OCCL.STFR_Tikitown.addRankedDressOutfits()
    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Dress_Police_Tikitown_SGT', 'Jacket_Dress_Police_Tikitown_CPT'},
        }, 'STFR')
    end
end

OCCL.addAdditionalClothing(OCCL.STFR_Tikitown.addRankedDressOutfits, OCCL.STFR_Tikitown.checkRankedDressEnabled)

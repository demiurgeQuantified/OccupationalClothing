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
OCCL.STFR_Tandil = {}

function OCCL.STFR_Tandil.checkEnabled()
    return (SandboxVars.OccupationalClothing.WantSTR and getActivatedMods():contains('STFRTD') and getActivatedMods():contains('Tandil'))
end

function OCCL.STFR_Tandil.addClothes()
    OCCL.UpdateClothing('fireofficer', {
        Shirt = {'Shirt_Fire_Tandil'},
        Tshirt = {'TShirt_Profession_Fireman_Blue_Tandil', 'TShirt_Profession_Fireman_Red_Tandil', 'TShirt_Profession_Fireman_Red_Tandil02', 'TShirt_Profession_Fireman_White_Tandil',},
        Pants = {'Trousers_Fire_Formal_Tandil',},
    }, 'STFR')
    OCCL.UpdateClothing('policeofficer', {
        Hat = {'Hat_Police_Tandil_Officer'},
        Shirt = {'Shirt_Police_Tandil_Officer'},
        Tshirt = {'TShirt_Police_Tandil_Officer'},
        Pants = {'Trousers_Police_Tandil'},
		Neck = {'Tie_Full_Police_Tandil', 'Tie_Worn_Police_Tandil'},
        --ChestWalkie = {'Chest_Walkie'},
        --DutyBelt = {'Belt_PoliceDuty'},
	}, 'STFR')
    OCCL.UpdateClothing('nurse', {
        Hat = {'Hat_BaseballCap_EMS_Tandil'},
        Shirt = {'Shirt_EMS_Tandil'},
        Tshirt = {'TShirt_EMS_Tandil'},
        Pants = {'Trousers_EMS_Tandil'},
    }, 'STFR')

    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Police_Tandil_Officer'},
        }, 'STFR')
        OCCL.UpdateClothing('nurse', {
            Jacket = {'Jacket_EMS_Tandil'},
        }, 'STFR')
    end
    if SandboxVars.OccupationalClothing.WantVests then
        OCCL.UpdateClothing('policeofficer', {
            Hat = {'Hat_Riot_Helmet_Tandil'},
        }, 'STFR')
    end

    if SandboxVars.OccupationalClothing.WantFireman > 1 then
        OCCL.UpdateClothing('fireofficer', {
            Pants = {'Trousers_Fireman_Black_Tandil', 'Trousers_Fireman_Khaki_Tandil'},
        }, 'STFR')
        if SandboxVars.OccupationalClothing.WantFireman > 2 then
            OCCL.UpdateClothing('fireofficer', {
                Jacket = {'Jacket_Fireman_Black_Tandil', 'Jacket_Fireman_Khaki_Tandil'},
            }, 'STFR')
        end
    end

    if SandboxVars.OccupationalClothing.WantHardhats then
        OCCL.UpdateClothing('fireofficer', {
            Hat = {'Hat_Fireman_Tandil_Blue', 'Hat_Fireman_Tandil_Black', 'Hat_Fireman_Tandil_Red',
            'Hat_Fireman_Tandil_Yellow'},
        }, 'STFR')
    end
end

OCCL.addAdditionalClothing(OCCL.STFR_Tandil.addClothes, OCCL.STFR_Tandil.checkEnabled)

function OCCL.STFR_Tandil.checkDressEnabled()
    return (SandboxVars.OccupationalClothing.WantSTRFormalDress and OCCL.STFR_Tandil.checkEnabled())
end

function OCCL.STFR_Tandil.addDressOutfits()
    OCCL.UpdateClothing('policeofficer', {
        Hat = {'Hat_Police_Tandil_Officer_Dress'},
    }, 'STFR')
    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Dress_Police_Tandil_Officer'},
        }, 'STFR')
    end
end

OCCL.addAdditionalClothing(OCCL.STFR_Tandil.addDressOutfits, OCCL.STFR_Tandil.checkDressEnabled)

function OCCL.STFR_Tandil.checkRanksEnabled()
    return (SandboxVars.OccupationalClothing.WantSTRRanks and OCCL.STFR_Tandil.checkEnabled())
end

function OCCL.STFR_Tandil.addRankedOutfits()
    OCCL.UpdateClothing('policeofficer', {
        Hat = {'Hat_Police_Tandil_SGT', 'Hat_Police_Tandil_CPT'},
        Shirt = {'Shirt_Police_Tandil_SGT', 'Shirt_Police_Tandil_CPT'},
        Tshirt = {'TShirt_Police_Tandil_SGT', 'TShirt_Police_Tandil_CPT'},
    }, 'STFR')
    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Police_Tandil_SGT', 'Jacket_Police_Tandil_CPT'},
        }, 'STFR')
    end
end

OCCL.addAdditionalClothing(OCCL.STFR_Tandil.addRankedOutfits, OCCL.STFR_Tandil.checkRanksEnabled)
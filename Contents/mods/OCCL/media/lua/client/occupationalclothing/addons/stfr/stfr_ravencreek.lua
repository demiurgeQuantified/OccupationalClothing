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
OCCL.STFR_RavenCreek = {}

function OCCL.STFR_RavenCreek.checkEnabled()
    return (SandboxVars.OccupationalClothing.WantSTR and getActivatedMods():contains('STFRRCR') and getActivatedMods():contains('RavenCreek'))
end

function OCCL.STFR_RavenCreek.addClothes()
    OCCL.UpdateClothing('fireofficer', {
        Shirt = {'Shirt_Fire_RavenCreek', 'Shirt_Fire_RavenCreek_Supervisor'},
        Tshirt = {'TShirt_Profession_Fireman_Blue_RavenCreek', 'TShirt_Profession_Fireman_Red_RavenCreek', 'TShirt_Profession_Fireman_Red_RavenCreek02', 'TShirt_Profession_Fireman_White_RavenCreek',},
        Pants = {'Trousers_Fire_Formal_RavenCreek',},
        Neck = {'Tie_Full_Fire_RavenCreek', 'Tie_Worn_Fire_RavenCreek',},
    }, 'STFR')
    OCCL.UpdateClothing('policeofficer', {
        Hat = {'Hat_Police_RavenCreek_Officer', 'Hat_BaseballCap_DOC_RavenCreek'},
        Shirt = {'Shirt_Police_RavenCreek_Officer', 'Shirt_DOC_RavenCreek'},
        Tshirt = {'TShirt_Police_RavenCreek_Officer', 'TShirt_DOC_RavenCreek'},
        Pants = {'Trousers_Police_RavenCreek', 'Trousers_DOC_RavenCreek'},
		Neck = {'Tie_Full_Police_RavenCreek', 'Tie_Worn_Police_RavenCreek'},
        --ChestWalkie = {'Chest_Walkie'},
        --DutyBelt = {'Belt_PoliceDuty'},
	}, 'STFR')
    OCCL.UpdateClothing('nurse', {
        Hat = {'Hat_BaseballCap_EMS_RavenCreek'},
        Shirt = {'Shirt_EMS_RavenCreek', 'Shirt_EMS_RavenCreek_Supervisor'},
        Tshirt = {'TShirt_EMS_RavenCreek', 'TShirt_EMS_RavenCreek_Supervisor'},
        Pants = {'Trousers_EMS_RavenCreek'},
    }, 'STFR')

    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Police_RavenCreek_Officer', 'Jacket_DOC_RavenCreek'},
        }, 'STFR')
        OCCL.UpdateClothing('nurse', {
            Jacket = {'Jacket_EMS_RavenCreek'},
        }, 'STFR')
    end
    if SandboxVars.OccupationalClothing.WantVests then
        OCCL.UpdateClothing('policeofficer', {
            Hat = {'Hat_Riot_Helmet_Police_RavenCreek'},
        }, 'STFR')
    end

    if SandboxVars.OccupationalClothing.WantFireman > 1 then
        OCCL.UpdateClothing('fireofficer', {
            Pants = {'Trousers_Fireman_Black_RavenCreek', 'Trousers_Fireman_Khaki_RavenCreek'},
        }, 'STFR')
        if SandboxVars.OccupationalClothing.WantFireman > 2 then
            OCCL.UpdateClothing('fireofficer', {
                Jacket = {'Jacket_Fireman_Black_RavenCreek', 'Jacket_Fireman_Khaki_RavenCreek'},
            }, 'STFR')
        end
    end

    if SandboxVars.OccupationalClothing.WantHardhats then
        OCCL.UpdateClothing('fireofficer', {
            Hat = {'Hat_Fireman_RavenCreek_Blue', 'Hat_Fireman_RavenCreek_Black', 'Hat_Fireman_RavenCreek_Red',
            'Hat_Fireman_RavenCreek_Yellow'},
        }, 'STFR')
    end
end

OCCL.addAdditionalClothing(OCCL.STFR_RavenCreek.addClothes, OCCL.STFR_RavenCreek.checkEnabled)

function OCCL.STFR_RavenCreek.checkDressEnabled()
    return (SandboxVars.OccupationalClothing.WantSTRFormalDress and OCCL.STFR_RavenCreek.checkEnabled())
end

function OCCL.STFR_RavenCreek.addDressOutfits()
    OCCL.UpdateClothing('fireofficer', {
        Hat = {'Hat_Fire_RavenCreek', 'Hat_Fire_RavenCreek_Supervisor_Black', 'Hat_Fire_RavenCreek_Supervisor_White'},
    }, 'STFR')
    OCCL.UpdateClothing('nurse', {
        Hat = {'Hat_EMS_RavenCreek', 'Hat_EMS_RavenCreek_Supervisor_Blue', 'Hat_EMS_RavenCreek_Supervisor_White'},
    }, 'STFR')
    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('fireofficer', {
            Jacket = {'Jacket_Dress_Fire_RavenCreek'},
        }, 'STFR')
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Dress_Police_RavenCreek_Officer'},
        }, 'STFR')
        OCCL.UpdateClothing('nurse', {
            Jacket = {'Jacket_Dress_EMS_RavenCreek', 'Jacket_Dress_EMS_RavenCreek_Supervisor'},
        }, 'STFR')
    end
end

OCCL.addAdditionalClothing(OCCL.STFR_RavenCreek.addDressOutfits, OCCL.STFR_RavenCreek.checkDressEnabled)

function OCCL.STFR_RavenCreek.checkRanksEnabled()
    return (SandboxVars.OccupationalClothing.WantSTRRanks and OCCL.STFR_RavenCreek.checkEnabled())
end

function OCCL.STFR_RavenCreek.addRankedOutfits()
    OCCL.UpdateClothing('policeofficer', {
        Shirt = {'Shirt_Police_RavenCreek_SGT', 'Shirt_Police_RavenCreek_CPT'},
        Tshirt = {'TShirt_Police_RavenCreek_SGT', 'TShirt_Police_RavenCreek_CPT'},
    }, 'STFR')
    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Police_RavenCreek_SGT', 'Jacket_Police_RavenCreek_CPT'},
        }, 'STFR')
    end
end

OCCL.addAdditionalClothing(OCCL.STFR_RavenCreek.addRankedOutfits, OCCL.STFR_RavenCreek.checkRanksEnabled)

function OCCL.STFR_RavenCreek.checkRankedDressEnabled()
    return (SandboxVars.OccupationalClothing.WantSTRFormalDress and SandboxVars.OccupationalClothing.WantSTRRanks and OCCL.STFR_RavenCreek.checkEnabled())
end

function OCCL.STFR_RavenCreek.addRankedDressOutfits()
    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Dress_Police_RavenCreek_SGT', 'Jacket_Dress_Police_RavenCreek_CPT'},
        }, 'STFR')
    end
end

OCCL.addAdditionalClothing(OCCL.STFR_RavenCreek.addRankedDressOutfits, OCCL.STFR_RavenCreek.checkRankedDressEnabled)

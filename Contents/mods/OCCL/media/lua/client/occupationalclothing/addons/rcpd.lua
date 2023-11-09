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
OCCL.RCPD = {}

function OCCL.RCPD.checkEnabled()
    return (SandboxVars.OccupationalClothing.WantSTR and getActivatedMods():contains('STR') and getActivatedMods():contains('RavenCreek'))
end

function OCCL.RCPD.addClothes()
    OCCL.UpdateClothing('fireofficer', {
        Shirt = {'Shirt_Fire_RavenCreek', 'Shirt_Fire_Supervisor_RavenCreek'},
        Tshirt = {'TShirt_Profession_FiremanBlue_RavenCreek', 'TShirt_Profession_FiremanRed_RavenCreek', 'TShirt_Profession_FiremanRed_RavenCreek02', 'TShirt_Profession_FiremanWhite_RavenCreek',},
        Pants = {'Trousers_Fire_Formal_RavenCreek',},
        Neck = {'Tie_Full_Fire_RavenCreek', 'Tie_Worn_Fire_RavenCreek',},
    }, 'STR')
    OCCL.UpdateClothing('policeofficer', {
        Hat = {'Hat_Police_RavenCreek', 'Hat_BaseballCap_DOC_RavenCreek'},
        Shirt = {'Shirt_Police_RavenCreek', 'Shirt_DOC_RavenCreek'},
        Tshirt = {'TShirt_Police_RavenCreek', 'TShirt_DOC_RavenCreek'},
        Pants = {'Trousers_Police_RavenCreek', 'Trousers_DOC_RavenCreek'},
		Neck = {'Tie_Full_Police_RavenCreek', 'Tie_Worn_Police_RavenCreek'},
        --ChestWalkie = {'Chest_Walkie'},
        --DutyBelt = {'Belt_PoliceDuty'},
	}, 'STR')
    OCCL.UpdateClothing('nurse', {
        Hat = {'Hat_BaseballCap_EMS_RavenCreek'},
        Shirt = {'Shirt_EMS_RavenCreek', 'Shirt_EMS_Supervisor_RavenCreek'},
        Tshirt = {'TShirt_EMS_RavenCreek', 'TShirt_EMS_Supervisor_RavenCreek'},
        Pants = {'Trousers_EMS_RavenCreek'},
    }, 'STR')

    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Police_RavenCreek', 'Jacket_DOC_RavenCreek'},
        }, 'STR')
        OCCL.UpdateClothing('nurse', {
            Jacket = {'Jacket_EMS_RavenCreek'},
        }, 'STR')
    end
    if SandboxVars.OccupationalClothing.WantVests then
        OCCL.UpdateClothing('policeofficer', {
            Hat = {'Hat_Riot_Helmet_RavenCreek'},
        }, 'STR')
    end

    if SandboxVars.OccupationalClothing.WantFireman > 1 then
        OCCL.UpdateClothing('fireofficer', {
            Pants = {'Trousers_Fireman_RavenCreek_Black', 'Trousers_Fireman_RavenCreek_Khaki'},
        }, 'STR')
        if SandboxVars.OccupationalClothing.WantFireman > 2 then
            OCCL.UpdateClothing('fireofficer', {
                Jacket = {'Jacket_Fireman_RavenCreek_Black', 'Jacket_Fireman_RavenCreek_Khaki'},
            }, 'STR')
        end
    end

    if SandboxVars.OccupationalClothing.WantHardhats then
        OCCL.UpdateClothing('fireofficer', {
            Hat = {'Hat_Fireman_RavenCreek_Blue', 'Hat_Fireman_RavenCreek_Black', 'Hat_Fireman_RavenCreek_Red',
            'Hat_Fireman_RavenCreek_Yellow'},
        }, 'STR')
    end
end

OCCL.addAdditionalClothing(OCCL.RCPD.addClothes, OCCL.RCPD.checkEnabled)

function OCCL.RCPD.checkDressEnabled()
    return (SandboxVars.OccupationalClothing.WantSTRFormalDress and OCCL.RCPD.checkEnabled())
end

function OCCL.RCPD.addDressOutfits()
    OCCL.UpdateClothing('fireofficer', {
        Hat = {'Hat_Fire_RavenCreek', 'Hat_Fire_Supervisor_RavenCreek', 'Hat_Fire_Supervisor_RavenCreek_White'},
    }, 'STR')
    OCCL.UpdateClothing('nurse', {
        Hat = {'Hat_EMS_RavenCreek', 'Hat_EMS_RavenCreek_Supervisor', 'Hat_EMS_RavenCreek_Supervisor_White'},
    }, 'STR')
    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('fireofficer', {
            Jacket = {'Jacket_Dress_Fire_RavenCreek'},
        }, 'STR')
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Dress_Police_RavenCreek'},
        }, 'STR')
        OCCL.UpdateClothing('nurse', {
            Jacket = {'Jacket_Dress_EMS_RavenCreek', 'Jacket_Dress_EMS_Supervisor_RavenCreek'},
        }, 'STR')
    end
end

OCCL.addAdditionalClothing(OCCL.RCPD.addDressOutfits, OCCL.RCPD.checkDressEnabled)
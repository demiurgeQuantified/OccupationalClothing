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
OCCL.TPD = {}

function OCCL.TPD.checkEnabled()
    return (SandboxVars.OccupationalClothing.WantSTR and getActivatedMods():contains('STR') and getActivatedMods():contains('Tandil'))
end

function OCCL.TPD.addClothes()
    OCCL.UpdateClothing('fireofficer', {
        Shirt = {'Shirt_Fire_Tandil'},
        Tshirt = {'TShirt_Profession_FiremanBlue_Tandil', 'TShirt_Profession_FiremanRed_Tandil', 'TShirt_Profession_FiremanRed_Tandil02', 'TShirt_Profession_FiremanWhite_Tandil',},
        Pants = {'Trousers_Fire_Formal_Tandil',},
    }, 'STR')
    OCCL.UpdateClothing('policeofficer', {
        Hat = {'Hat_Police_Tandil'},
        Shirt = {'Shirt_Police_Tandil'},
        Tshirt = {'TShirt_Police_Tandil'},
        Pants = {'Trousers_Police_Tandil'},
		Neck = {'Tie_Full_Police_Tandil', 'Tie_Worn_Police_Tandil'},
        --ChestWalkie = {'Chest_Walkie'},
        --DutyBelt = {'Belt_PoliceDuty'},
	}, 'STR')
    OCCL.UpdateClothing('nurse', {
        Hat = {'Hat_BaseballCap_EMS_Tandil'},
        Shirt = {'Shirt_EMS_Tandil'},
        Tshirt = {'TShirt_EMS_Tandil'},
        Pants = {'Trousers_EMS_Tandil'},
    }, 'STR')

    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Police_Tandil'},
        }, 'STR')
        OCCL.UpdateClothing('nurse', {
            Jacket = {'Jacket_EMS_Tandil'},
        }, 'STR')
    end
    if SandboxVars.OccupationalClothing.WantVests then
        OCCL.UpdateClothing('policeofficer', {
            Hat = {'Hat_Riot_Helmet_Tandil'},
        }, 'STR')
    end

    if SandboxVars.OccupationalClothing.WantFireman > 1 then
        OCCL.UpdateClothing('fireofficer', {
            Pants = {'Trousers_Fireman_Tandil_Black', 'Trousers_Fireman_Tandil_Khaki'},
        }, 'STR')
        if SandboxVars.OccupationalClothing.WantFireman > 2 then
            OCCL.UpdateClothing('fireofficer', {
                Jacket = {'Jacket_Fireman_Tandil_Black', 'Jacket_Fireman_Tandil_Khaki'},
            }, 'STR')
        end
    end

    if SandboxVars.OccupationalClothing.WantHardhats then
        OCCL.UpdateClothing('fireofficer', {
            Hat = {'Hat_Fireman_Tandil_Blue', 'Hat_Fireman_Tandil_Black', 'Hat_Fireman_Tandil_Red',
            'Hat_Fireman_Tandil_Yellow'},
        }, 'STR')
    end
end

OCCL.addAdditionalClothing(OCCL.TPD.addClothes, OCCL.TPD.checkEnabled)

function OCCL.TPD.checkDressEnabled()
    return (SandboxVars.OccupationalClothing.WantSTRFormalDress and OCCL.TPD.checkEnabled())
end

function OCCL.TPD.addDressOutfits()
    OCCL.UpdateClothing('policeofficer', {
        Hat = {'Hat_Police_Tandil_Dress'},
    }, 'STR')
    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Dress_Police_Tandil'},
        }, 'STR')
    end
end

OCCL.addAdditionalClothing(OCCL.TPD.addDressOutfits, OCCL.TPD.checkDressEnabled)
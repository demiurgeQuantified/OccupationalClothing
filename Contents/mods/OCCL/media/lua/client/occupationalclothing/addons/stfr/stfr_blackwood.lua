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
OCCL.STFR_Blackwood = {}

function OCCL.STFR_Blackwood.checkEnabled()
    return (SandboxVars.OccupationalClothing.WantSTR and getActivatedMods():contains('STFRBW') and getActivatedMods():contains('Blackwood'))
end

function OCCL.STFR_Blackwood.addClothes()
    OCCL.UpdateClothing('policeofficer', {
        Hat = {'Hat_Police_Blackwood_Officer'},
        Shirt = {'Shirt_Police_Blackwood_Officer'},
        Tshirt = {'TShirt_Police_Blackwood_Officer'},
        Pants = {'Trousers_Police_Blackwood'},
		Neck = {'Tie_Full_Police_Blackwood'},
        --ChestWalkie = {'Chest_Walkie'},
        --DutyBelt = {'Belt_PoliceDuty'},
	}, 'STFR')
    OCCL.UpdateClothing('nurse', {
        Hat = {'Hat_BaseballCap_EMS_Blackwood'},
        Shirt = {'Shirt_EMS_Blackwood'},
        Tshirt = {'TShirt_EMS_Blackwood'},
        Pants = {'Trousers_EMS_Blackwood'},
    }, 'STFR')

    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Police_Blackwood_Officer'},
        }, 'STFR')
        OCCL.UpdateClothing('nurse', {
            Jacket = {'Jacket_EMS_Blackwood'},
        }, 'STFR')
    end
    if SandboxVars.OccupationalClothing.WantVests then
        OCCL.UpdateClothing('policeofficer', {
            Hat = {'Hat_Riot_Helmet_Police_Blackwood'},
        }, 'STFR')
    end
end

OCCL.addAdditionalClothing(OCCL.STFR_Blackwood.addClothes, OCCL.STFR_Blackwood.checkEnabled)

function OCCL.STFR_Blackwood.checkDressEnabled()
    return (SandboxVars.OccupationalClothing.WantSTRFormalDress and OCCL.STFR_Blackwood.checkEnabled())
end

function OCCL.STFR_Blackwood.addDressOutfits()
    OCCL.UpdateClothing('nurse', {
        Hat = {'Hat_EMS_Blackwood'},
    }, 'STFR')
    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Dress_Police_Blackwood_Officer'},
        }, 'STFR')
        OCCL.UpdateClothing('nurse', {
            Jacket = {'Jacket_Dress_EMS_Blackwood'},
        }, 'STFR')
    end
end

OCCL.addAdditionalClothing(OCCL.STFR_Blackwood.addDressOutfits, OCCL.STFR_Blackwood.checkDressEnabled)

function OCCL.STFR_Blackwood.checkRanksEnabled()
    return (SandboxVars.OccupationalClothing.WantSTRRanks and OCCL.STFR_Blackwood.checkEnabled())
end

function OCCL.STFR_Blackwood.addRankedOutfits()
    OCCL.UpdateClothing('policeofficer', {
        Shirt = {'Shirt_Police_Blackwood_SGT', 'Shirt_Police_Blackwood_CPT'},
        Tshirt = {'TShirt_Police_Blackwood_SGT', 'TShirt_Police_Blackwood_CPT'},
    }, 'STFR')
    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Police_Blackwood_SGT', 'Jacket_Police_Blackwood_CPT'},
        }, 'STFR')
    end
end

OCCL.addAdditionalClothing(OCCL.STFR_Blackwood.addRankedOutfits, OCCL.STFR_Blackwood.checkRanksEnabled)

function OCCL.STFR_Blackwood.checkRankedDressEnabled()
    return (SandboxVars.OccupationalClothing.WantSTRFormalDress and SandboxVars.OccupationalClothing.WantSTRRanks and OCCL.STFR_Blackwood.checkEnabled())
end

function OCCL.STFR_Blackwood.addRankedDressOutfits()
    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Dress_Police_Blackwood_SGT', 'Jacket_Dress_Police_Blackwood_CPT'},
        }, 'STFR')
    end
end

OCCL.addAdditionalClothing(OCCL.STFR_Blackwood.addRankedDressOutfits, OCCL.STFR_Blackwood.checkRankedDressEnabled)

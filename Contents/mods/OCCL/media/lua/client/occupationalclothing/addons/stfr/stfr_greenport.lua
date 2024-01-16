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
OCCL.STFR_Greenport = {}

function OCCL.STFR_Greenport.checkEnabled()
    return (SandboxVars.OccupationalClothing.WantSTR and getActivatedMods():contains('STFRGP') and getActivatedMods():contains('Greenport'))
end

function OCCL.STFR_Greenport.addClothes()
    OCCL.UpdateClothing('policeofficer', {
        Hat = {'Hat_Police_Greenport_Officer'},
        Shirt = {'Shirt_Police_Greenport_Officer'},
        Tshirt = {'TShirt_Police_Greenport_Officer'},
        Pants = {'Trousers_Police_Greenport'},
		Neck = {'Tie_Full_Police_Greenport', 'Tie_Worn_Police_Greenport'},
        --ChestWalkie = {'Chest_Walkie'},
        --DutyBelt = {'Belt_PoliceDuty'},
	}, 'STFR')

    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Police_Greenport_Officer'},
        }, 'STFR')
    end
    if SandboxVars.OccupationalClothing.WantVests then
        OCCL.UpdateClothing('policeofficer', {
            Hat = {'Hat_Riot_Helmet_Greenport'},
        }, 'STFR')
    end
end

OCCL.addAdditionalClothing(OCCL.STFR_Greenport.addClothes, OCCL.STFR_Greenport.checkEnabled)

function OCCL.STFR_Greenport.checkDressEnabled()
    return (SandboxVars.OccupationalClothing.WantSTRFormalDress and OCCL.STFR_Greenport.checkEnabled())
end

function OCCL.STFR_Greenport.addDressOutfits()
    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Dress_Police_Greenport_Officer'},
        }, 'STFR')
    end
end

OCCL.addAdditionalClothing(OCCL.STFR_Greenport.addDressOutfits, OCCL.STFR_Greenport.checkDressEnabled)
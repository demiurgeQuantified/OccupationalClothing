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
OCCL.GPPD = {}

function OCCL.GPPD.checkEnabled()
    return (SandboxVars.OccupationalClothing.WantGreenportPD and getActivatedMods():contains('STR') and getActivatedMods():contains('Greenport'))
end

function OCCL.GPPD.addClothes()
    OCCL.UpdateClothing('policeofficer', {
        Hat = {'Hat_Police_Greenport'},
        Shirt = {'Shirt_Police_Greenport'},
        Tshirt = {'TShirt_Police_Greenport'},
        Pants = {'Trousers_Police_Greenport'},
		Neck = {'Tie_Full_Police_Greenport', 'Tie_Worn_Police_Greenport'},
        --ChestWalkie = {'Chest_Walkie'},
        --DutyBelt = {'Belt_PoliceDuty'},
	}, 'STR')

    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Police_Greenport'},
        }, 'STR')
    end
    if SandboxVars.OccupationalClothing.WantVests then
        OCCL.UpdateClothing('policeofficer', {
            Hat = {'Hat_Riot_Helmet_Blue_Stripe'},
        }, 'STR')
    end
end

OCCL.addAdditionalClothing(OCCL.GPPD.addClothes, OCCL.GPPD.checkEnabled)

function OCCL.GPPD.checkDressEnabled()
    return (SandboxVars.OccupationalClothing.WantSTRFormalDress and OCCL.GPPD.checkEnabled())
end

function OCCL.GPPD.addDressOutfits()
    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Dress_Police_Greenport'},
        }, 'STR')
    end
end

OCCL.addAdditionalClothing(OCCL.GPPD.addDressOutfits, OCCL.GPPD.checkDressEnabled)
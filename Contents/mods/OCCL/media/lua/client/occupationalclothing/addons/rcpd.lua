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

-- Raven Creek Police Department (https://steamcommunity.com/sharedfiles/filedetails/?id=2599486479)
OCCL.RCPD = {}

function OCCL.RCPD.checkEnabled()
    return (SandboxVars.OccupationalClothing.WantRavenCreekPD and getActivatedMods():contains('RavenCreekPDClothes'))
end

function OCCL.RCPD.addClothes()
    OCCL.UpdateClothing('policeofficer', {
        Hat = {'Hat_Police_RavenCreek'},
        Shirt = {'Shirt_Police_RavenCreek'},
        Tshirt = {'TShirt_Police_RavenCreek'},
        Pants = {'Trousers_Police_RavenCreek'},
    }, 'RavenCreekPDClothes')

    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Police_RavenCreek'},
        }, 'RavenCreekPDClothes')
    end

    if getActivatedMods():contains('RavenCreekPDHelicopters') then
        OCCL.UpdateClothing('policeofficer', {
            Hat = {'Hat_SPHPoliceRavenCreekVISORUP'},
            FullSuit = {'Boilersuit_PoliceRavenCreekFlying'},
        }, 'RavenCreekPDHelicopters')
    end
end

OCCL.addAdditionalClothing(OCCL.RCPD.addClothes, OCCL.RCPD.checkEnabled)
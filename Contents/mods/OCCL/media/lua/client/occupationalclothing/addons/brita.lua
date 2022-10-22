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

-- Brita's Armour Pack (https://steamcommunity.com/sharedfiles/filedetails/?id=2460154811)
OCCL.Brita = {}

function OCCL.Brita.checkEnabled()
    return (SandboxVars.OccupationalClothing.WantBrita and getActivatedMods():contains('Brita_2'))
end

function OCCL.Brita.addClothes()
    if SandboxVars.OccupationalClothing.WantVeteranUniforms then
        OCCL.UpdateClothing('veteran', {
            Hat = {'Hat_Ela_Hat', 'Hat_Ela_Hat_Only', 'Hat_Beret_Tactical_Only'},
            MaskEyes = {'Hat_MCU_GasMask', 'Hat_M45_GasMask', 'Hat_FM53', 'Hat_M50'},
            Eyes = {'Glasses_X1000', 'Glasses_Napier', 'Glasses_Crewman_Goggles'},
            Ears = {'Hat_Sordin', 'Hat_Astrocom'},
            TorsoExtra = {'Bag_D3M', 'Bag_Smersh_Vest', 'Bag_Blackhawk', 'Bag_Tactical_Belt_Front', 'Bag_Duty_Belt_Front'},
            Pants = {'Ela_Pants', 'Gorka_Pants', 'Gorka_Pants2', 'Gorka_Pants3'},
        })

        if SandboxVars.OccupationalClothing.WantJackets then
            OCCL.UpdateClothing('veteran', {
                Jacket = {'Ela_Jacket', 'Gorka_Jacket', 'Gorka_Jacket2', 'Gorka_Jacket3'},
            })
        end

        if SandboxVars.OccupationalClothing.WantVests then
            OCCL.UpdateClothing('veteran', {
                Hat = {'Hat_FAST_Opscore', 'Hat_M1_Helmet', 'Hat_M1_Helmet_Ori', 'Hat_Maska', 'Hat_Gentex_Helmet'},
                TorsoExtra = {'Armor_Defender', 'Bag_Plate_Carrier', 'Armor_6B13'},
            })
        end
    end

    OCCL.UpdateClothing('fireofficer', {
        MaskEyes = {'Hat_MCU_GasMask', 'Hat_M45_GasMask', 'Hat_FM53', 'Hat_M50'},
    })
end

OCCL.addAdditionalClothing(OCCL.Brita.addClothes, OCCL.Brita.checkEnabled)
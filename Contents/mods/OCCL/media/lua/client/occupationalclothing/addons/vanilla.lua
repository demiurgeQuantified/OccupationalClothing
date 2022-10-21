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

OCCL.Vanilla = {}

local function addDefaultClothing() -- adds clothing options that the vanilla game already gives to professions
    local SandboxVars = SandboxVars

    OCCL.UpdateClothing('policeofficer', {
        Eyes = {'Glasses', 'Glasses_Aviators'},
    })

    OCCL.UpdateClothing('constructionworker', {
        Shirt = {'Shirt_Denim'},
        TorsoExtra = {'Vest_HighViz'},
        Pants = {'Trousers_JeanBaggy'},
    })

    OCCL.UpdateClothing('securityguard', {
        Shirt = {'Shirt_FormalWhite'},
        Pants = {'Trousers_Black'},
    })

    OCCL.UpdateClothing('carpenter', {
        Mask = {'Hat_DustMask'},
        Eyes = {'Glasses_SafetyGoggles'},
        Shirt = {'Shirt_Denim', 'Shirt_Lumberjack'},
        Pants = {'Trousers_JeanBaggy'},
    })

    OCCL.UpdateClothing('burglar', {
        Hat = {'Hat_Beany'},
        Mask = {'Hat_BandanaMaskTINT'},
        MaskFull = {'Hat_BalaclavaFull'},
        Eyes = {'Glasses_Sun'},
        Pants = {'Trousers_Denim'},
    })

    OCCL.UpdateClothing('chef', {
        Hat = {'Hat_ChefHat'},
        Jacket = {'Jacket_Chef'},
        Pants = {'Trousers_Chef'},
    })

    OCCL.UpdateClothing('repairman', {
        Shirt = {'Shirt_Denim'},
        Pants = {'Trousers_Denim'},
    })

    OCCL.UpdateClothing('farmer', {
        Hat = {'Hat_Cowboy', 'Hat_SummerHat'},
        Shirt = {'Shirt_Denim', 'Shirt_Lumberjack'},
        Pants = {'Trousers_Denim'},
        Shoes = {'Shoes_Wellies'},
    })
    
    OCCL.UpdateClothing('fisherman', {
        Hat = {'Hat_Beany', 'Hat_BonnieHat_CamoGreen'},
        Shirt = {'Shirt_Denim', 'Shirt_Lumberjack'},
        Pants = {'Trousers_JeanBaggy'},
        Shoes = {'Shoes_Wellies'},
    })

    OCCL.UpdateClothing('doctor', {
        Neck = {'Tie_Full'},
        Hat = {'Hat_SurgicalMask_Blue', 'Hat_SurgicalMask_Green'},
        Shirt = {'Shirt_FormalTINT'},
        Hands = {'Gloves_Surgical'},
        Pants = {'Trousers_SuitTEXTURE'},
    })

    OCCL.UpdateClothing('veteran', {
        Hat = {'Hat_BaseballCapArmy', 'Hat_BeretArmy', 'Hat_BonnieHat_CamoGreen', 'Hat_Bandana'},
        Eyes = {'Glasses_Eyepatch_Left', 'Glasses_Eyepatch_Right', 'Glasses_Shooting'},
        Shirt = {'Shirt_CamoGreen'},
        Tshirt = {'Tshirt_Profession_VeterenGreen', 'Tshirt_Profession_VeterenRed'},
        Pants = {'Shorts_CamoGreenLong'},
        Shoes = {'Shoes_TrainerTINT'},
        Necklace = {'Necklace_DogTag'},
    })

    OCCL.UpdateClothing('nurse', {
        Hat = {'Hat_SurgicalCap_Blue', 'Hat_SurgicalCap_Green'},
        Mask = {'Hat_SurgicalMask_Blue', 'Hat_SurgicalMask_Green'},
        Shirt = {'Shirt_Scrubs'},
        Hands = {'Gloves_Surgical'},
        Pants = {'Trousers_Scrubs'},
        Shoes = {'Shoes_TrainerTINT'},
    })

    OCCL.UpdateClothing('lumberjack', {
        Hat = {'Hat_Beany'},
        Shirt = {'Shirt_Denim', 'Shirt_Lumberjack'},
        Tshirt = {'Tshirt_McCoys'},
        Pants = {'Trousers_JeanBaggy'},
    })

    OCCL.UpdateClothing('fitnessInstructor', {
        Hat = {'Hat_Sweatband'},
        Tshirt = {'Tshirt_Sport'},
        Hands = {'Gloves_FingerlessGloves'},
        Pants = {'Shorts_LongSport', 'Shorts_ShortSport'},
        Shoes = {'Shoes_TrainerTINT'},
    })

    OCCL.UpdateClothing('burgerflipper', {
        Hat = {'Hat_FastFood_Spiffo'},
        Tshirt = {'Tshirt_BusinessSpiffo'},
        Shoes = {'Shoes_TrainerTINT'},
        Pants = {'Trousers_Denim'},
    })

    OCCL.UpdateClothing('electrician', {
        Mask = {'Hat_DustMask'},
        Eyes = {'Glasses_SafetyGoggles'},
        Shirt = {'Shirt_Denim', 'Shirt_Lumberjack'},
        Pants = {'Trousers_Denim'},
        TorsoExtra = {'Vest_HighViz'},
    })

    OCCL.UpdateClothing('metalworker', {
        Mask = {'Hat_DustMask'},
        Eyes = {'Glasses_SafetyGoggles'},
        Shirt = {'Shirt_Denim', 'Shirt_Lumberjack'},
        Pants = {'Trousers_Denim'},
        TorsoExtra = {'Vest_HighViz'},
    })

    OCCL.UpdateClothing('engineer', {
        Hat = {'Hat_DustMask'},
        Neck = {'Tie_Full'},
        Shirt = {'Shirt_FormalTINT'},
        Pants = {'Trousers_SuitTEXTURE'},
        TorsoExtra = {'Vest_HighViz'},
    })

    OCCL.UpdateClothing('mechanics', {
        Hat = {'Hat_Bandana'},
        Mask = {'Hat_DustMask'},
        Eyes = {'Glasses_SafetyGoggles'},
        Shirt = {'Shirt_Denim', 'Shirt_Lumberjack'},
        Tshirt = {'Tshirt_Fossoil', 'Tshirt_Gas2Go', 'Tshirt_ThunderGas'},
        Pants = {'Trousers_Denim'},
    })

    -- conditional stuff
    if SandboxVars.OccupationalClothing.WantVanillaEMS then
        OCCL.UpdateClothing('fireofficer', {
            Tshirt = {'Tshirt_Profession_FiremanBlue', 'Tshirt_Profession_FiremanRed', 'Tshirt_Profession_FiremanRed02', 'Tshirt_Profession_FiremanWhite'},
            Shoes = {'Shoes_Black', 'Shoes_ArmyBoots'},
        })
    
        OCCL.UpdateClothing('policeofficer', {
            Tshirt = {'Tshirt_Profession_PoliceBlue', 'Tshirt_Profession_PoliceWhite'},
            Pants = {'Trousers_Police'},
        })
    
        OCCL.UpdateClothing('parkranger', {
            Tshirt = {'Tshirt_Profession_RangerBrown', 'Tshirt_Profession_RangerGreen'},
            Pants = {'Trousers_Ranger'},
        })

        if SandboxVars.OccupationalClothing.WantFireman > 1 then
            OCCL.UpdateClothing('fireofficer', {
                Pants = {'Trousers_Fireman'},
            })
        end
    end
end

OCCL.addAdditionalClothing(addDefaultClothing)

local function addVanillaClothes()
    OCCL.UpdateClothing('fireofficer', {
        MaskEyes = {'Hat_GasMask'},
    })

    OCCL.UpdateClothing('constructionworker', {
        TorsoExtra = {'Vest_Foreman'},
        Shoes = {'Shoes_BlackBoots'},
    })

    OCCL.UpdateClothing('securityguard', {
        Eyes = {'Glasses_Sun'},
        Neck = {'Tie_Full'},
    })

    OCCL.UpdateClothing('carpenter', {
        Shoes = {'Shoes_BlackBoots'},
    })

    --no clothes for burglar

    OCCL.UpdateClothing('chef', {
        TorsoExtra = {'Apron_White', 'Apron_Black'},
    })

    OCCL.UpdateClothing('repairman', {
        Pants = {'Dungarees'},
        Shirt = {'Shirt_Workman'},
    })

    OCCL.UpdateClothing('farmer', {
        Pants = {'Dungarees'},
        Shoes = {'Shoes_BlackBoots'},
    })

    OCCL.UpdateClothing('fisherman', {
        Hat = {'Hat_BucketHat'},
        Pants = {'Dungarees'},
        TorsoExtra = {'Vest_Hunting_Grey', 'Vest_Hunting_Camo', 'Vest_Hunting_CamoGreen'},
    })

    OCCL.UpdateClothing('doctor', {
        Mask = {'Hat_SurgicalMask_Blue', 'Hat_SurgicalMask_Green'},
    })

    OCCL.UpdateClothing('veteran', {
        Pants = {'Shorts_CamoUrbanLong', 'Trousers_ArmyService'},
    })

    OCCL.UpdateClothing('nurse', {
        Tshirt = {'Tshirt_Scrubs'},
        Shoes = {'Shoes_Slippers'},
    })

    -- the lumberjack and fitness instructor don't need anything new

    OCCL.UpdateClothing('burgerflipper', { -- while not strictly accurate to the job title, i've added anything to do with fast food serving
        Hat = {'Hat_FastFood'},
        Tshirt = {'Tshirt_PileOCrepe', 'Tshirt_PizzaWhirled'},
        TorsoExtra = {'Apron_PileOCrepe', 'Apron_PizzaWhirled', 'Apron_Spiffos'},
    })

    OCCL.UpdateClothing('electrician', {
        FullSuit = {'Boilersuit'},
        Shoes = {'Shoes_BlackBoots'},
    })

    OCCL.UpdateClothing('metalworker', {
        FullSuit = {'Boilersuit'},
    })

    OCCL.UpdateClothing('mechanics', {
        FullSuit = {'Boilersuit_BlueRed'},
    })

    -- conditional stuff ahead
    local SandboxVars = SandboxVars

    if SandboxVars.OccupationalClothing.WantHardhats then
        OCCL.UpdateClothing('constructionworker', {
            Hat = {'Hat_HardHat'},
        })

        OCCL.UpdateClothing('carpenter', {
            Hat = {'Hat_HardHat'},
        })

        OCCL.UpdateClothing('electrician', {
            Hat = {'Hat_HardHat'},
        })

        OCCL.UpdateClothing('engineer', {
            Hat = {'Hat_HardHat'},
        })

        OCCL.UpdateClothing('metalworker', {
            Hat = {'Hat_HardHat'},
        })
    end

    if SandboxVars.OccupationalClothing.WantGloves then
        OCCL.UpdateClothing('electrician', {
            Hands = {'Gloves_LeatherGlovesBlack'},
        })

        OCCL.UpdateClothing('mechanics', {
            Hands = {'Gloves_LeatherGlovesBlack'},
        })
    end

    if SandboxVars.OccupationalClothing.WantJackets  then
        OCCL.UpdateClothing('veteran', {
            Jacket = {'Jacket_CoatArmy'},
        })

        OCCL.UpdateClothing('doctor', {
            Jacket = {'JacketLong_Doctor'},
        })
    end

    if SandboxVars.OccupationalClothing.WantVeteranUniforms then
        OCCL.UpdateClothing('veteran', {
            Hat = {'Hat_BonnieHat_CamoGreen'},
            Shirt = {'Shirt_CamoGreen', 'Shirt_CamoDesert', 'Shirt_CamoUrban'},
            Tshirt = {'Tshirt_CamoGreen', 'Tshirt_CamoDesert', 'Tshirt_CamoUrban', 'Tshirt_ArmyGreen'},
            AmmoStrap = {'AmmoStrap_Bullets'},
            Pants = {'Trousers_CamoGreen', 'Trousers_CamoDesert', 'Trousers_CamoUrban'},
            Shoes = {'Shoes_ArmyBoots', 'Shoes_ArmyBootsDesert'},
        })
        if SandboxVars.OccupationalClothing.WantJackets then
            OCCL.UpdateClothing('veteran', {
                Jacket = {'Jacket_ArmyCamoGreen', 'Jacket_ArmyCamoDesert'},
            })
        end
        if SandboxVars.OccupationalClothing.WantVests then
            OCCL.UpdateClothing('veteran', {
                Hat = {'Hat_Army'},
                TorsoExtra = {'Vest_BulletArmy'},
            })
        end
    end
end

OCCL.addAdditionalClothing(addVanillaClothes)

function OCCL.Vanilla.CheckEMSEnabled()
    return SandboxVars.OccupationalClothing.WantVanillaEMS
end

local function addVanillaEMS()
    local SandboxVars = SandboxVars

    OCCL.UpdateClothing('policeofficer', {
        Hat = {'Hat_Police', 'Hat_Police_Grey'},
        Shirt = {'Shirt_OfficerWhite', 'Shirt_PoliceBlue', 'Shirt_PoliceGrey', 'Shirt_PrisonGuard'},
        Tshirt = {'Tshirt_PoliceBlue', 'Tshirt_PoliceGrey'},
        Pants = {'Trousers_PoliceGrey', 'Trousers_PrisonGuard'},
    })
    
    OCCL.UpdateClothing('parkranger', {
        Hat = {'Hat_Ranger'},
        Shirt = {'Shirt_Ranger', 'Shirt_OfficerWhite'},
        Tshirt = {'Tshirt_Ranger'},
    })

    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('parkranger', {
            Jacket = {'Jacket_Ranger'},
        })

        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Police'},
        })
    end

    if SandboxVars.OccupationalClothing.WantFireman > 2 then
        OCCL.UpdateClothing('fireofficer', {
            Jacket = {'Jacket_Fireman'},
        })
    end

    if SandboxVars.OccupationalClothing.WantHardhats then
        OCCL.UpdateClothing('fireofficer', {
            Hat = {'Hat_Fireman'},
        })
    end

    if SandboxVars.OccupationalClothing.WantVests then
        OCCL.UpdateClothing('policeofficer', {
            Hat = {'Hat_CrashHelmet_Police', 'Hat_RiotHelmet'},
            TorsoExtra = {'Vest_BulletPolice'},
        })
    end
end

OCCL.addAdditionalClothing(addVanillaEMS, OCCL.Vanilla.CheckEMSEnabled)
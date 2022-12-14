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
OCCL.STR = {}

function OCCL.STR.checkEnabled()
    return (SandboxVars.OccupationalClothing.WantSTR and (getActivatedMods():contains('STR') or getActivatedMods():contains('SmallTownResponders')))
end

function OCCL.STR.addClothes()
    OCCL.UpdateClothing('fireofficer', {
        Shirt = {'Shirt_Fire_Louisville', 'Shirt_Fire_Supervisor_Louisville', 'Shirt_Fire_Meade', 'Shirt_Fire_Supervisor_Meade', 'Shirt_Fire_Rosewood', 'Shirt_Fire_Supervisor_Rosewood'},
        Tshirt = {'TShirt_Profession_FiremanBlue_Meade', 'TShirt_Profession_FiremanRed_Meade', 'TShirt_Profession_FiremanRed_Meade02', 'TShirt_Profession_FiremanWhite_Meade',
                'TShirt_Profession_FiremanBlue_Rosewood', 'TShirt_Profession_FiremanRed_Rosewood', 'TShirt_Profession_FiremanRed_Rosewood02', 'TShirt_Profession_FiremanWhite_Rosewood',
                'TShirt_Profession_FiremanBlue_Louisville', 'TShirt_Profession_FiremanRed_Louisville', 'TShirt_Profession_FiremanRed_Louisville02', 'TShirt_Profession_FiremanWhite_Louisville',
                'TShirt_Fire_Louisville', 'TShirt_Fire_Supervisor_Louisville', 'TShirt_Fire_Meade', 'TShirt_Fire_Supervisor_Meade', 'TShirt_Fire_Rosewood', 'TShirt_Fire_Supervisor_Rosewood',},
        Pants = {'Trousers_Fire_Formal_Louisville', 'Trousers_Fire_Formal_Meade', 'Trousers_Fire_Formal_Rosewood',}
    }, 'STR')

    OCCL.UpdateClothing('policeofficer', {
        Hat = {'Hat_Police_Muldraugh', 'Hat_Police_Meade', 'Hat_Police_WestPoint', 'Hat_Police_Riverside', 'Hat_Police_Rosewood', 
                'Hat_Police_Louisville', 'Hat_Police_JeffersonPD', 'Hat_Police_JeffersonSD', 'Hat_PoliceKSP', 'Hat_BaseballCap_DOC_Meade',
                'Hat_BaseballCap_DOC_Meade_Reverse', 'Hat_BaseballCap_DOC_Jefferson', 'Hat_BaseballCap_DOC_Jefferson_Reverse'},
        Shirt = {'Shirt_Police_Muldraugh', 'Shirt_Police_Meade', 'Shirt_Police_WestPoint', 'Shirt_Police_Riverside', 'Shirt_Police_Rosewood',
                'Shirt_Police_Louisville', 'Shirt_Police_JeffersonPD', 'Shirt_Police_JeffersonSD', 'Shirt_PoliceKSP', 'Shirt_DOC_Meade', 'Shirt_DOC_Jefferson'},
        Tshirt = {'TShirt_Police_Muldraugh', 'TShirt_Police_Meade', 'TShirt_Police_WestPoint', 'TShirt_Police_Riverside', 'TShirt_Police_Rosewood',
                'TShirt_Police_Louisville', 'TShirt_Police_JeffersonPD', 'TShirt_Police_JeffersonSD', 'TShirt_PoliceKSP', 'TShirt_DOC_Meade', 'TShirt_DOC_Jefferson'},
        Pants = {'Trousers_Police_Muldraugh', 'Trousers_Police_Meade', 'Trousers_Police_WestPoint', 'Trousers_Police_Riverside', 'Trousers_Police_Rosewood',
                'Trousers_Police_Louisville', 'Trousers_Police_JeffersonPD', 'Trousers_Police_JeffersonSD', 'Trousers_PoliceKSP_Summer', 'Trousers_PoliceKSP_Winter',
                'Trousers_DOC_Meade', 'Trousers_DOC_Jefferson'},
        Neck = {'Tie_Full_KSP'},
        Tail = {'Chest_Walkie'},
        BeltExtra = {'Belt_PoliceDuty'},
    }, 'STR')

    OCCL.UpdateClothing('parkranger', {
        Hat = {'Hat_FederalRanger', 'Hat_StateLawRanger', 'Hat_StateRanger'},
        Shirt = {'Shirt_Federal_Ranger', 'Shirt_State_LawRanger', 'Shirt_State_Ranger'},
        Tshirt = {'TShirt_Federal_Ranger', 'TShirt_State_LawRanger', 'TShirt_State_Ranger',
        'TShirt_Polo_Federal_Ranger', 'TShirt_Polo_State_Ranger', 'TShirt_Polo_State_Law_Ranger'},
        Pants = {'Trousers_FederalRanger', 'Trousers_StateLawRanger', 'Trousers_StateRanger'},
    }, 'STR')

    OCCL.UpdateClothing('securityguard', {
        Tail = {'Chest_Walkie'},
    }, 'STR')

    OCCL.UpdateClothing('nurse', {
        Hat = {'Hat_BaseballCap_EMS_Meade', 'Hat_BaseballCap_EMS_Louisville', 'Hat_BaseballCap_EMS_Jefferson'},
        Shirt = {'Shirt_EMS_Meade', 'Shirt_EMS_Louisville', 'Shirt_EMS_Jefferson'},
        Tshirt = {'TShirt_EMS_Meade', 'TShirt_EMS_Louisville', 'TShirt_EMS_Jefferson'},
        Pants = {'Trousers_EMS_Meade', 'Trousers_EMS_Louisville', 'Trousers_EMS_Jefferson'},
    }, 'STR')

    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Police_Muldraugh', 'Jacket_Police_Meade', 'Jacket_Police_WestPoint', 'Jacket_Police_Riverside',
            'Jacket_Police_Rosewood', 'Jacket_Police_Louisville', 'Jacket_Police_JeffersonPD', 'Jacket_Police_JeffersonSD',
            'Jacket_PoliceKSP', 'Jacket_DOC_Meade', 'Jacket_DOC_Jefferson'},
        }, 'STR')

        OCCL.UpdateClothing('parkranger', {
            Jacket = {'Jacket_Federal_Ranger', 'Jacket_State_LawRanger', 'Jacket_State_Ranger'},
        }, 'STR')

        OCCL.UpdateClothing('nurse', {
            Jacket = {'Jacket_EMS_Meade', 'Jacket_EMS_Louisville', 'Jacket_EMS_Jefferson'},
        }, 'STR')
    end

    if SandboxVars.OccupationalClothing.WantVests then
        OCCL.UpdateClothing('policeofficer', {
            TorsoExtra = {'Base.Vest_BulletPolice', 'STR.Vest_BulletPolice_Meade'},
        }, false)
        OCCL.UpdateClothing('policeofficer', {
            Hat = {'Hat_Riot_Helmet_Louisville', 'Hat_Riot_Helmet_Grey', 'Hat_Riot_Helmet_Meade', 'Hat_Riot_Helmet_Brown', 'Hat_Riot_Helmet_Brown_Stripe',
            'Hat_Riot_Helmet_Black', 'Hat_Riot_Helmet_Blue', 'Hat_Riot_Helmet_Blue_Stripe', 'Hat_Riot_Helmet_Navy', 'Hat_Riot_Helmet_Navy_Stripe',
            'Hat_Riot_Helmet_Brown_Dark', 'Hat_Riot_Helmet_Brown_Dark_Stripe'},
            Gloves = {'Gloves_Leather_Black', 'Gloves_Leather_Brown'},
        }, 'STR')
    end

    if SandboxVars.OccupationalClothing.WantFireman > 1 then
        OCCL.UpdateClothing('fireofficer', {
            Pants = {'Trousers_Fireman_Meade_Black', 'Trousers_Fireman_Meade_Khaki',
            'Trousers_Fireman_Rosewood_Black', 'Trousers_Fireman_Rosewood_Khaki',
            'Trousers_Fireman_Louisville_Black', 'Trousers_Fireman_Louisville_Khaki'},
        }, 'STR')
        if SandboxVars.OccupationalClothing.WantFireman > 2 then
            OCCL.UpdateClothing('fireofficer', {
                Jacket = {'Jacket_Fireman_Meade_Black', 'Jacket_Fireman_Meade_Khaki',
                'Jacket_Fireman_Rosewood_Black', 'Jacket_Fireman_Rosewood_Khaki',
                'Jacket_Fireman_Louisville_Black', 'Jacket_Fireman_Louisville_Khaki'},
            }, 'STR')
            if SandboxVars.OccupationalClothing.WantGloves then
                OCCL.UpdateClothing('fireofficer', {
                    Gloves = {'Gloves_Fireman_Khaki', 'Gloves_Fireman_Khaki_Simple', 'Gloves_Fireman_Black', 'Gloves_Fireman_Black_Simple'}
                }, 'STR')
            end
        end
    end

    if SandboxVars.OccupationalClothing.WantHardhats then
        OCCL.UpdateClothing('fireofficer', {
            Hat = {'Hat_Fireman_Meade_Black', 'Hat_Fireman_Meade_Red', 'Hat_Fireman_Meade_Yellow',
            'Hat_Fireman_Rosewood_Black', 'Hat_Fireman_Rosewood_Red', 'Hat_Fireman_Rosewood_Yellow',
            'Hat_Fireman_Louisville_Black', 'Hat_Fireman_Louisville_Red', 'Hat_Fireman_Louisville_Yellow',
            'Hat_Fireman_Louisville_Blue', 'Hat_Fireman_Louisville_White', 'Hat_Fireman_Rosewood_White', 'Hat_Fireman_Meade_White'},
        }, 'STR')
    end
end

OCCL.addAdditionalClothing(OCCL.STR.addClothes, OCCL.STR.checkEnabled)

function OCCL.STR.checkNonspecificEnabled()
    return (SandboxVars.OccupationalClothing.WantUnemployedNonspecificOutfits and OCCL.STR.checkEnabled())
end

function OCCL.STR.addNonspecificOutfits()
    OCCL.UpdateClothing('unemployed', {
        Hat = {'Hat_BaseballCap_USPS'},
        Jacket = {'Jacket_USPS', 'Judge_Robe'},
        Shirt = {'Shirt_USPS'},
        Tshirt = {'TShirt_USPS'},
        Pants = {'Trousers_USPS', 'Shorts_USPS', 'Shorts_ShortUSPS'},
    }, 'STR')
end

OCCL.addAdditionalClothing(OCCL.STR.addNonspecificOutfits, OCCL.STR.checkNonspecificEnabled)

function OCCL.STR.checkDressEnabled()
    return (SandboxVars.OccupationalClothing.WantSTRFormalDress and OCCL.STR.checkEnabled())
end

function OCCL.STR.addDressOutfits()
    OCCL.UpdateClothing('fireofficer', {
        Hat = {'Hat_Fire_Louisville', 'Hat_Fire_Supervisor_Louisville'},
        Shirt = {'Shirt_Fire_Supervisor_Formal_Louisville'},
        Tshirt = {'TShirt_Fire_Supervisor_Formal_Louisville'},
        Gloves = {'Gloves_Dress_White'},
    }, 'STR')
    OCCL.UpdateClothing('policeofficer', {
        Gloves = {'Gloves_Dress_White'},
    }, 'STR')
    OCCL.UpdateClothing('parkranger', {
        Gloves = {'Gloves_Dress_White'},
    }, 'STR')
    OCCL.UpdateClothing('nurse', {
        Hat = {'Hat_EMS_Jefferson', 'Hat_EMS_Louisville', 'Hat_EMS_Meade'},
        Gloves = {'Gloves_Dress_White'},
    }, 'STR')
    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('fireofficer', {
            Jacket = {'Jacket_Dress_Fire_Louisville'},
        }, 'STR')
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Dress_Police_Rosewood', 'Jacket_Dress_Police_Jefferson', 'Jacket_Dress_Police_KSP', 'Jacket_Dress_Police_Louisville',
            'Jacket_Dress_Police_Meade', 'Jacket_Dress_Police_Muldraugh', 'Jacket_Dress_Police_Riverside', 'Jacket_Dress_Police_WestPoint', 'Jacket_Dress_Sheriff_Jefferson'},
        }, 'STR')
        OCCL.UpdateClothing('parkranger', {
            Jacket = {'Jacket_Dress_Federal_Ranger', 'Jacket_Dress_State_Ranger', 'Jacket_Dress_State_Law_Ranger'},
        }, 'STR')
        OCCL.UpdateClothing('nurse', {
            Jacket = {'Jacket_Dress_EMS_Jefferson', 'Jacket_Dress_EMS_Louisville', 'Jacket_Dress_EMS_Meade'},
        }, 'STR')
    end
end

OCCL.addAdditionalClothing(OCCL.STR.addDressOutfits, OCCL.STR.checkDressEnabled)
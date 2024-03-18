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
OCCL.STFR_Main = {}

function OCCL.STFR_Main.checkEnabled()
    return (SandboxVars.OccupationalClothing.WantSTR and (getActivatedMods():contains('STFR')))
end

function OCCL.STFR_Main.addClothes()
    OCCL.UpdateClothing('fireofficer', {
        Shirt = {'Shirt_Fire_Louisville', 'Shirt_Fire_Louisville_Supervisor', 'Shirt_Fire_Meade', 'Shirt_Fire_Meade_Supervisor', 'Shirt_Fire_Rosewood', 'Shirt_Fire_Rosewood_Supervisor'},
        Tshirt = {'TShirt_Profession_Fireman_Blue_Meade', 'TShirt_Profession_Fireman_Red_Meade', 'TShirt_Profession_Fireman_Red_Meade02', 'TShirt_Profession_Fireman_White_Meade',
                'TShirt_Profession_Fireman_Blue_Rosewood', 'TShirt_Profession_Fireman_Red_Rosewood', 'TShirt_Profession_Fireman_Red_Rosewood02', 'TShirt_Profession_Fireman_White_Rosewood',
                'TShirt_Profession_Fireman_Blue_Louisville', 'TShirt_Profession_Fireman_Red_Louisville', 'TShirt_Profession_Fireman_Red_Louisville02', 'TShirt_Profession_Fireman_White_Louisville',
                'TShirt_Fire_Louisville', 'TShirt_Fire_Louisville_Supervisor', 'TShirt_Fire_Meade', 'TShirt_Fire_Meade_Supervisor', 'TShirt_Fire_Rosewood', 'TShirt_Fire_Rosewood_Supervisor',},
        Pants = {'Trousers_Fire_Formal_Louisville', 'Trousers_Fire_Formal_Meade', 'Trousers_Fire_Formal_Rosewood',},
        Neck = {'Tie_Full_Fire_Louisville', 'Tie_Worn_Fire_Louisville',},
	}, 'STFR')

    OCCL.UpdateClothing('policeofficer', {
        Hat = {'Hat_Police_Muldraugh_Officer', 'Hat_Sheriff_Meade_Officer', 'Hat_Police_WestPoint_Officer', 'Hat_Police_Riverside_Officer', 'Hat_Sheriff_Rosewood_Officer', 
                'Hat_Police_Louisville_Officer', 'Hat_Police_Jefferson_Officer', 'Hat_Sheriff_Jefferson_Officer', 'Hat_Police_KSP_Officer', 'Hat_BaseballCap_DOC_Meade',
                'Hat_BaseballCap_DOC_Meade_Reverse', 'Hat_BaseballCap_DOC_Jefferson', 'Hat_BaseballCap_DOC_Jefferson_Reverse'},
        Shirt = {'Shirt_Police_Muldraugh_Officer', 'Shirt_Sheriff_Meade_Officer', 'Shirt_Police_WestPoint_Officer', 'Shirt_Police_Riverside_Officer', 'Shirt_Sheriff_Rosewood_Officer',
                'Shirt_Police_Louisville_Officer', 'Shirt_Police_Jefferson_Officer', 'Shirt_Sheriff_Jefferson_Officer', 'Shirt_Police_KSP_Officer', 'Shirt_DOC_Meade', 'Shirt_DOC_Jefferson'},
        Tshirt = {'TShirt_Police_Muldraugh_Officer', 'TShirt_Sheriff_Meade_Officer', 'TShirt_Police_WestPoint_Officer', 'TShirt_Police_Riverside_Officer', 'TShirt_Sheriff_Rosewood_Officer',
                'TShirt_Police_Louisville_Officer', 'TShirt_Police_Jefferson_Officer', 'TShirt_Sheriff_Jefferson_Officer', 'TShirt_Police_KSP_Officer', 'TShirt_DOC_Meade', 'TShirt_DOC_Jefferson'},
        Pants = {'Trousers_Police_Muldraugh', 'Trousers_Sheriff_Meade', 'Trousers_Police_WestPoint', 'Trousers_Police_Riverside', 'Trousers_Sheriff_Rosewood',
                'Trousers_Police_Louisville', 'Trousers_Police_Jefferson', 'Trousers_Sheriff_Jefferson', 'Trousers_Police_KSP_Summer', 'Trousers_Police_KSP_Winter',
                'Trousers_DOC_Meade', 'Trousers_DOC_Jefferson'},
        Neck = {'Tie_Full_Police_KSP', 'Tie_Worn_Police_KSP', 'Tie_Full_Police_Jefferson',
				'Tie_Worn_Police_Jefferson', 'Tie_Full_Police_Louisville', 'Tie_Worn_Police_Louisville', 'Tie_Full_Sheriff_Meade', 'Tie_Worn_Sheriff_Meade', 'Tie_Full_Police_Muldraugh', 'Tie_Worn_Police_Muldraugh',
				'Tie_Full_Police_Riverside', 'Tie_Worn_Police_Riverside', 'Tie_Full_Sheriff_Rosewood', 'Tie_Worn_Sheriff_Rosewood', 'Tie_Full_Police_WestPoint', 'Tie_Worn_Police_WestPoint', 'Tie_Full_Sheriff_Jefferson',
				'Tie_Worn_Sheriff_Jefferson'},
        ChestWalkie = {'Chest_Walkie'},
        DutyBelt = {'Belt_Police_Duty'},
    }, 'STFR')

    OCCL.UpdateClothing('parkranger', {
        Hat = {'Hat_Ranger_Federal', 'Hat_Ranger_State_Park', 'Hat_Ranger_Conservation'},
        Shirt = {'Shirt_Ranger_Federal', 'Shirt_Ranger_State_Park', 'Shirt_Ranger_Conservation'},
        Tshirt = {'TShirt_Ranger_Federal', 'TShirt_Ranger_State_Park', 'TShirt_Ranger_Conservation',
        'TShirt_Polo_Ranger_Federal', 'TShirt_Polo_Ranger_Conservation', 'TShirt_Polo_Ranger_State_Park'},
        Pants = {'Trousers_Ranger_Federal', 'Trousers_Ranger_State_Park', 'Trousers_Ranger_Conservation'},
    }, 'STFR')

    OCCL.UpdateClothing('securityguard', {
        Hat = {'Hat_Security_Bank', 'Hat_Security_Hotel_Havisham', 'Hat_Security_Mall_Grand_Ohio', 'Hat_Security_Mall_Valley_Station', 'Hat_Security_Mall_Louisville'},
        Shirt = {'Shirt_Security_Bank', 'Shirt_Security_Hotel_Havisham', 'Shirt_Security_Hotel_Fancy', 'Shirt_Security_Mall_Grand_Ohio', 'Shirt_Security_Mall_Valley_Station', 'Shirt_Security_Mall_Louisville'},
        Tshirt = {'TShirt_Security_Bank', 'TShirt_Security_Hotel_Havisham', 'TShirt_Polo_Security_Hotel_Fancy', 'TShirt_Security_Mall_Grand_Ohio', 'TShirt_Security_Mall_Valley_Station', 'TShirt_Security_Mall_Louisville'},
        Pants = {'Trousers_Security_Bank', 'Trousers_Security_Hotel_Havisham', 'Trousers_Security_Hotel_Fancy', 'Trousers_Security_Mall_Grand_Ohio', 'Trousers_Security_Mall_Valley_Station', 'Trousers_Security_Mall_Louisville'},
        ChestWalkie = {'Chest_Walkie'},
        Neck = {'Tie_Full_Security_Bank', 'Tie_Worn_Security_Bank', 'Tie_Full_Security_Hotel_Havisham', 'Tie_Worn_Security_Hotel_Havisham',
				'Tie_Full_Security_Hotel_Fancy', 'Tie_Worn_Security_Hotel_Fancy', 'Tie_Full_Security_Mall_Grand_Ohio', 'Tie_Worn_Security_Mall_Grand_Ohio'},
    }, 'STFR')

    OCCL.UpdateClothing('nurse', {
        Hat = {'Hat_BaseballCap_EMS_Meade', 'Hat_BaseballCap_EMS_Louisville', 'Hat_BaseballCap_EMS_Jefferson'},
        Shirt = {'Shirt_EMS_Meade', 'Shirt_EMS_Louisville', 'Shirt_EMS_Jefferson'},
        Tshirt = {'TShirt_EMS_Meade', 'TShirt_EMS_Louisville', 'TShirt_EMS_Jefferson'},
        Pants = {'Trousers_EMS_Meade', 'Trousers_EMS_Louisville', 'Trousers_EMS_Jefferson'},
    }, 'STFR')

    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Police_Muldraugh_Officer', 'Jacket_Sheriff_Meade_Officer', 'Jacket_Police_WestPoint_Officer', 'Jacket_Police_Riverside_Officer',
            'Jacket_Sheriff_Rosewood_Officer', 'Jacket_Police_Louisville_Officer', 'Jacket_Police_Jefferson_Officer', 'Jacket_Sheriff_Jefferson_Officer',
            'Jacket_Police_KSP_Officer', 'Jacket_DOC_Meade', 'Jacket_DOC_Jefferson'},
        }, 'STFR')

        OCCL.UpdateClothing('parkranger', {
            Jacket = {'Jacket_Ranger_Federal', 'Jacket_Ranger_State_Park', 'Jacket_Ranger_Conservation'},
        }, 'STFR')

        OCCL.UpdateClothing('securityguard', {
            Jacket = {'Jacket_Security_Bank', 'Jacket_Dress_Security_Hotel_Havisham', 'Jacket_Suit_Security_Hotel_Fancy', 'Jacket_Security_Mall_Grand_Ohio', 'Jacket_Security_Mall_Valley_Station', 'Jacket_Security_Mall_Louisville', 'Jacket_Sweater_Security_Hotel_Havisham', 'Jacket_Sweater_Security_Bank'},
        }, 'STFR')

        OCCL.UpdateClothing('nurse', {
            Jacket = {'Jacket_EMS_Meade', 'Jacket_EMS_Louisville', 'Jacket_EMS_Jefferson'},
        }, 'STFR')
    end

    if SandboxVars.OccupationalClothing.WantVests then
        OCCL.UpdateClothing('policeofficer', {
            TorsoExtra = {'Base.Vest_BulletPolice', 'STFR.Vest_BulletPolice_Meade'},
        }, false)
        OCCL.UpdateClothing('policeofficer', {
            Hat = {'Hat_Riot_Helmet_Police_Louisville', 'Hat_Riot_Helmet_Police_KSP', 'Hat_Riot_Helmet_Sheriff_Meade', 'Hat_Riot_Helmet_Sheriff_Meade_Solid', 'Hat_Riot_Helmet_Sheriff_Meade_Stripe',
            'Hat_Riot_Helmet_Police_Muldraugh', 'Hat_Riot_Helmet_Police_Riverside', 'Hat_Riot_Helmet_Police_Riverside_Stripe', 'Hat_Riot_Helmet_Police_WestPoint', 'Hat_Riot_Helmet_Police_Jefferson',
            'Hat_Riot_Helmet_Sheriff_Rosewood', 'Hat_Riot_Helmet_Sheriff_Jefferson'},
            Gloves = {'Gloves_Riot_Leather_Black', 'Gloves_Riot_Leather_Brown'},
        }, 'STFR')
    end

    if SandboxVars.OccupationalClothing.WantFireman > 1 then
        OCCL.UpdateClothing('fireofficer', {
            Pants = {'Trousers_Fireman_Black_Meade', 'Trousers_Fireman_Khaki_Meade',
            'Trousers_Fireman_Black_Rosewood', 'Trousers_Fireman_Khaki_Rosewood',
            'Trousers_Fireman_Black_Louisville', 'Trousers_Fireman_Khaki_Louisville'},
        }, 'STFR')
        if SandboxVars.OccupationalClothing.WantFireman > 2 then
            OCCL.UpdateClothing('fireofficer', {
                Jacket = {'Jacket_Fireman_Black_Meade', 'Jacket_Fireman_Khaki_Meade',
                'Jacket_Fireman_Black_Rosewood', 'Jacket_Fireman_Khaki_Rosewood',
                'Jacket_Fireman_Black_Louisville', 'Jacket_Fireman_Khaki_Louisville'},
            }, 'STFR')
            if SandboxVars.OccupationalClothing.WantGloves then
                OCCL.UpdateClothing('fireofficer', {
                    Gloves = {'Gloves_Fireman_Khaki', 'Gloves_Fireman_Khaki_Simple', 'Gloves_Fireman_Black', 'Gloves_Fireman_Black_Simple'}
                }, 'STFR')
            end
        end
    end

    if SandboxVars.OccupationalClothing.WantHardhats then
        OCCL.UpdateClothing('fireofficer', {
            Hat = {'Hat_Fireman_Meade_Black', 'Hat_Fireman_Meade_Red', 'Hat_Fireman_Meade_Yellow',
            'Hat_Fireman_Rosewood_Black', 'Hat_Fireman_Rosewood_Red', 'Hat_Fireman_Rosewood_Yellow',
            'Hat_Fireman_Louisville_Black', 'Hat_Fireman_Louisville_Red', 'Hat_Fireman_Louisville_Yellow',
            'Hat_Fireman_Louisville_Blue', 'Hat_Fireman_Louisville_White', 'Hat_Fireman_Rosewood_White', 'Hat_Fireman_Meade_White'},
        }, 'STFR')
    end
end

OCCL.addAdditionalClothing(OCCL.STFR_Main.addClothes, OCCL.STFR_Main.checkEnabled)

function OCCL.STFR_Main.checkNonspecificEnabled()
    return (SandboxVars.OccupationalClothing.WantUnemployedNonspecificOutfits and OCCL.STFR_Main.checkEnabled())
end

function OCCL.STFR_Main.addNonspecificOutfits()
    OCCL.UpdateClothing('unemployed', {
        Hat = {'Hat_BaseballCap_USPS'},
        Jacket = {'Jacket_USPS', 'Judge_Robe'},
        Shirt = {'Shirt_USPS'},
        Tshirt = {'TShirt_USPS'},
        Pants = {'Trousers_USPS', 'Shorts_USPS', 'Shorts_Short_USPS'},
    }, 'STFR')
end

OCCL.addAdditionalClothing(OCCL.STFR_Main.addNonspecificOutfits, OCCL.STFR_Main.checkNonspecificEnabled)

function OCCL.STFR_Main.checkDressEnabled()
    return (SandboxVars.OccupationalClothing.WantSTRFormalDress and OCCL.STFR_Main.checkEnabled())
end

function OCCL.STFR_Main.addDressOutfits()
    OCCL.UpdateClothing('fireofficer', {
        Hat = {'Hat_Fire_Louisville', 'Hat_Fire_Louisville_Supervisor_White', 'Hat_Fire_Louisville_Supervisor_Black'},
        Shirt = {'Shirt_Fire_Louisville_Supervisor_Station'},
        Tshirt = {'TShirt_Fire_Louisville_Supervisor_Station'},
        Gloves = {'Gloves_Dress_White'},
    }, 'STFR')
    OCCL.UpdateClothing('policeofficer', {
        Gloves = {'Gloves_Dress_White'},
    }, 'STFR')
    OCCL.UpdateClothing('parkranger', {
        Gloves = {'Gloves_Dress_White'},
    }, 'STFR')
    OCCL.UpdateClothing('nurse', {
        Hat = {'Hat_EMS_Jefferson', 'Hat_EMS_Louisville', 'Hat_EMS_Meade'},
        Gloves = {'Gloves_Dress_White'},
    }, 'STFR')
    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('fireofficer', {
            Jacket = {'Jacket_Dress_Fire_Louisville'},
        }, 'STFR')
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Dress_Sheriff_Rosewood_Officer', 'Jacket_Dress_Police_Jefferson_Officer', 'Jacket_Dress_Police_KSP_Officer', 'Jacket_Dress_Police_Louisville_Officer',
            'Jacket_Dress_Sheriff_Meade_Officer', 'Jacket_Dress_Police_Muldraugh_Officer', 'Jacket_Dress_Police_Riverside_Officer', 'Jacket_Dress_Police_WestPoint_Officer', 'Jacket_Dress_Sheriff_Jefferson_Officer'},
        }, 'STFR')
        OCCL.UpdateClothing('parkranger', {
            Jacket = {'Jacket_Dress_Ranger_Federal', 'Jacket_Dress_Ranger_Conservation', 'Jacket_Dress_Ranger_State_Park'},
        }, 'STFR')
        OCCL.UpdateClothing('nurse', {
            Jacket = {'Jacket_Dress_EMS_Jefferson', 'Jacket_Dress_EMS_Louisville', 'Jacket_Dress_EMS_Meade'},
        }, 'STFR')
    end
end

OCCL.addAdditionalClothing(OCCL.STFR_Main.addDressOutfits, OCCL.STFR_Main.checkDressEnabled)

function OCCL.STFR_Main.checkRanksEnabled()
    return (SandboxVars.OccupationalClothing.WantSTRRanks and OCCL.STFR_Main.checkEnabled())
end

function OCCL.STFR_Main.addRankedOutfits()
    OCCL.UpdateClothing('policeofficer', {
        Hat = {'Hat_Police_Muldraugh_SGT', 'Hat_Police_WestPoint_SGT', 'Hat_Police_Riverside_SGT', 'Hat_Sheriff_Rosewood_SGT', 
                'Hat_Police_Louisville_SGT', 'Hat_Police_Jefferson_SGT', 'Hat_Police_Muldraugh_CPT', 'Hat_Police_WestPoint_CPT', 'Hat_Police_Riverside_CPT', 'Hat_Sheriff_Rosewood_CPT', 
                'Hat_Police_Louisville_CPT'},
        Shirt = {'Shirt_Police_Muldraugh_SGT', 'Shirt_Sheriff_Meade_SGT', 'Shirt_Police_WestPoint_SGT', 'Shirt_Police_Riverside_SGT', 'Shirt_Sheriff_Rosewood_SGT',
                'Shirt_Police_Louisville_SGT', 'Shirt_Police_Jefferson_SGT', 'Shirt_Sheriff_Jefferson_SGT', 'Shirt_Police_KSP_SGT', 'Shirt_Police_Muldraugh_CPT', 'Shirt_Sheriff_Meade_CPT', 'Shirt_Police_WestPoint_CPT', 'Shirt_Police_Riverside_CPT', 'Shirt_Sheriff_Rosewood_CPT',
                'Shirt_Police_Louisville_CPT', 'Shirt_Police_Jefferson_CPT', 'Shirt_Sheriff_Jefferson_CPT', 'Shirt_Police_KSP_CPT'},
        Tshirt = {'TShirt_Police_Muldraugh_SGT', 'TShirt_Sheriff_Meade_SGT', 'TShirt_Police_WestPoint_SGT', 'TShirt_Police_Riverside_SGT', 'TShirt_Sheriff_Rosewood_SGT',
                'TShirt_Police_Louisville_SGT', 'TShirt_Police_Jefferson_SGT', 'TShirt_Sheriff_Jefferson_SGT', 'TShirt_Police_KSP_SGT', 'TShirt_Police_Muldraugh_CPT', 'TShirt_Sheriff_Meade_CPT', 'TShirt_Police_WestPoint_CPT', 'TShirt_Police_Riverside_CPT', 'TShirt_Sheriff_Rosewood_CPT',
                'TShirt_Police_Louisville_CPT', 'TShirt_Police_Jefferson_CPT', 'TShirt_Sheriff_Jefferson_CPT', 'TShirt_Police_KSP_CPT'},
    }, 'STFR')
    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Police_Muldraugh_SGT', 'Jacket_Sheriff_Meade_SGT', 'Jacket_Police_WestPoint_SGT', 'Jacket_Police_Riverside_SGT',
            'Jacket_Sheriff_Rosewood_SGT', 'Jacket_Police_Louisville_SGT', 'Jacket_Police_Jefferson_SGT', 'Jacket_Sheriff_Jefferson_SGT',
            'Jacket_Police_KSP_SGT', 'Jacket_Police_Muldraugh_CPT', 'Jacket_Sheriff_Meade_CPT', 'Jacket_Police_WestPoint_CPT', 'Jacket_Police_Riverside_CPT',
            'Jacket_Sheriff_Rosewood_CPT', 'Jacket_Police_Louisville_CPT', 'Jacket_Police_Jefferson_CPT', 'Jacket_Sheriff_Jefferson_CPT',
            'Jacket_Police_KSP_CPT'},
        }, 'STFR')
    end
end

OCCL.addAdditionalClothing(OCCL.STFR_Main.addRankedOutfits, OCCL.STFR_Main.checkRanksEnabled)

function OCCL.STFR_Main.checkRankedDressEnabled()
    return (SandboxVars.OccupationalClothing.WantSTRFormalDress and SandboxVars.OccupationalClothing.WantSTRRanks and OCCL.STFR_Main.checkEnabled())
end

function OCCL.STFR_Main.addRankedDressOutfits()
    if SandboxVars.OccupationalClothing.WantJackets then
        OCCL.UpdateClothing('policeofficer', {
            Jacket = {'Jacket_Dress_Sheriff_Rosewood_SGT', 'Jacket_Dress_Police_Jefferson_SGT', 'Jacket_Dress_Police_KSP_SGT', 'Jacket_Dress_Police_Louisville_SGT',
            'Jacket_Dress_Sheriff_Meade_SGT', 'Jacket_Dress_Police_Muldraugh_SGT', 'Jacket_Dress_Police_Riverside_SGT', 'Jacket_Dress_Police_WestPoint_SGT', 'Jacket_Dress_Sheriff_Jefferson_SGT', 
			'Jacket_Dress_Sheriff_Rosewood_CPT', 'Jacket_Dress_Police_Jefferson_CPT', 'Jacket_Dress_Police_KSP_CPT', 'Jacket_Dress_Police_Louisville_CPT',
            'Jacket_Dress_Sheriff_Meade_CPT', 'Jacket_Dress_Police_Muldraugh_CPT', 'Jacket_Dress_Police_Riverside_CPT', 'Jacket_Dress_Police_WestPoint_CPT', 'Jacket_Dress_Sheriff_Jefferson_CPT'},
        }, 'STFR')
    end
end

OCCL.addAdditionalClothing(OCCL.STFR_Main.addRankedDressOutfits, OCCL.STFR_Main.checkRankedDressEnabled)

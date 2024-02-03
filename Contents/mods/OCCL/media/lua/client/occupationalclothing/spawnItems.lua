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

local clothingPriorities = {'Shirt', 'Tshirt', 'Jacket'}

local badgeTable = {
	parkranger = {
		Federal_Ranger = 'STR.FederalRangerBadge', 
		State_Ranger = 'STR.StateRangerBadge', 
		State_LawRanger = 'STR.StateLawRangerBadge',

		Ranger_Federal = 'STFR.Badge_Ranger_Federal_Gold', 
		Ranger_Conservation = 'STFR.Badge_Ranger_Conservation_Gold', 
		Ranger_State_Park = 'STFR.Badge_Ranger_State_Park_Silver'},
	securityguard = {
		Bank = 'STR.SecurityBankBadge', 
		Havisham = 'STR.SecurityHotelHavishamBadge', 
		Ohio = 'STR.SecurityMallOhioBadge', 
		Valley = 'STR.SecurityMallValleyBadge', 
		LV = 'STR.SecurityMallLVBadge',

		Security_Bank = 'STFR.Badge_Security_Bank_Gold', 
		Security_Hotel_Havisham = 'STFR.Badge_Security_Hotel_Havisham_Gold', 
		Security_Mall_Grand_Ohio = 'STFR.Badge_Security_Mall_Grand_Ohio_Silver', 
		Security_Mall_Valley_Station = 'STFR.Badge_Security_Mall_Valley_Station_Gold', 
		Security_Mall_Louisville = 'STFR.Badge_Security_Mall_Louisville_Silver'},
	policeofficer = {
		Muldraugh = 'STR.MuldraughPoliceBadge', 
		Rosewood = 'STR.RosewoodSheriffBadge', 
		WestPoint = 'STR.WestPointPoliceBadge',
		Riverside = 'STR.RiversidePoliceBadge', 
		Louisville = 'STR.LouisvillePoliceBadge',
		Meade = 'STR.MeadeSheriffBadge', 
		JeffersonPD = 'STR.JeffersonPoliceBadge', 
		JeffersonSD = 'STR.JeffersonSheriffBadge', 
		KSP = 'STR.KSPPoliceBadge',
		RavenCreek = 'STR.RavenCreekPoliceBadge', 
		Tandil = 'STR.TandilPoliceBadge',
		Greenport = 'STR.TandilPoliceBadge',

		Police_Muldraugh_Officer = 'STFR.Badge_Police_Muldraugh_Silver', 
		Sheriff_Rosewood_Officer = 'STFR.Badge_Sheriff_Rosewood_Silver', 
		Police_WestPoint_Officer = 'STFR.Badge_Police_WestPoint_Silver',
		Police_Riverside_Officer = 'STFR.Badge_Police_Riverside_Silver', 
		Police_Louisville_Officer = 'STFR.Badge_Police_Louisville_Silver',
		Sheriff_Meade_Officer = 'STFR.Badge_Sheriff_Meade_Gold', 
		Police_Jefferson_Officer = 'STFR.Badge_Police_Jefferson_Silver', 
		Sheriff_Jefferson_Officer = 'STFR.Badge_Sheriff_Jefferson_Gold', 
		Police_KSP_Officer = 'STFR.Badge_Police_KSP_Silver',
		Police_RavenCreek_Officer = 'STFR.Badge_Police_RavenCreek_Silver', 
		Police_Tandil_Officer = 'STFR.Badge_Police_Tandil_Silver',
		Police_Greenport_Officer = 'STFR.Badge_Police_Greenport_Gold',
		Police_Tikitown_Officer = 'STFR.Badge_Police_Tikitown_Silver',

		Police_Muldraugh_SGT = 'STFR.Badge_Police_Muldraugh_Gold', 
		Sheriff_Rosewood_SGT = 'STFR.Badge_Sheriff_Rosewood_Gold', 
		Police_WestPoint_SGT = 'STFR.Badge_Police_WestPoint_Gold',
		Police_Riverside_SGT = 'STFR.Badge_Police_Riverside_Gold', 
		Police_Louisville_SGT = 'STFR.Badge_Police_Louisville_Gold',
		Sheriff_Meade_SGT = 'STFR.Badge_Sheriff_Meade_Gold', 
		Police_Jefferson_SGT = 'STFR.Badge_Police_Jefferson_Gold', 
		Sheriff_Jefferson_SGT = 'STFR.Badge_Sheriff_Jefferson_Gold', 
		Police_KSP_SGT = 'STFR.Badge_Police_KSP_Gold',
		Police_RavenCreek_SGT = 'STFR.Badge_Police_RavenCreek_Gold', 
		Police_Tandil_SGT = 'STFR.Badge_Police_Tandil_Gold',
		Police_Greenport_SGT = 'STFR.Badge_Police_Greenport_Gold',
		Police_Tikitown_SGT = 'STFR.Badge_Police_Tikitown_Silver',

		Police_Muldraugh_CPT = 'STFR.Badge_Police_Muldraugh_Gold', 
		Sheriff_Rosewood_CPT = 'STFR.Badge_Sheriff_Rosewood_Gold', 
		Police_WestPoint_CPT = 'STFR.Badge_Police_WestPoint_Gold',
		Police_Riverside_CPT = 'STFR.Badge_Police_Riverside_Gold', 
		Police_Louisville_CPT = 'STFR.Badge_Police_Louisville_Gold',
		Sheriff_Meade_CPT = 'STFR.Badge_Sheriff_Meade_Gold', 
		Police_Jefferson_CPT = 'STFR.Badge_Police_Jefferson_Gold', 
		Sheriff_Jefferson_CPT = 'STFR.Badge_Sheriff_Jefferson_Gold', 
		Police_KSP_CPT = 'STFR.Badge_Police_KSP_Gold',
		Police_RavenCreek_CPT = 'STFR.Badge_Police_RavenCreek_Gold', 
		Police_Tandil_CPT = 'STFR.Badge_Police_Tandil_Gold',
		Police_Greenport_CPT = 'STFR.Badge_Police_Greenport_Gold',
		Police_Tikitown_CPT = 'STFR.Badge_Police_Tikitown_Silver'
	}
}

local function grantItems()
    if not SandboxVars.OccupationalClothing.STRBadges then return end
	local character = getPlayer()
	if character:getModData().occlBadge then return end
	local profession = character:getDescriptor():getProfession()
	if not badgeTable[profession] then return end
	for _,location in pairs(clothingPriorities) do
		local item = character:getWornItem(location)
		if item then
			for k,v in pairs(badgeTable[profession]) do
				if luautils.stringEnds(item:getType(), k) then
					character:getInventory():AddItem(v)
					character:getModData().occlBadge = true
					return
				end
			end
		end
	end
end

local function OnCreatePlayer()
	if getActivatedMods():contains('STR') or getActivatedMods():contains('STFR') then
    	grantItems()
	end
end
Events.OnCreatePlayer.Add(OnCreatePlayer)

--[[local STREnabled = true

local OCCLPanelProfessions = {['parkranger'] = STREnabled, ['policeofficer'] = STREnabled}

STREnabled = nil]]

-- ui crap

--[[local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)
local FONT_HGT_MEDIUM = getTextManager():getFontHeight(UIFont.Medium)

local OCCLPanel = ISPanelJoypad:derive("OccupationalClothingPanel")

function OCCLPanel:prerender()
	self:doRightJoystickScrolling(20, 20)
	ISPanelJoypad.prerender(self)
	self:setStencilRect(0, 0, self.width, self.height)
end

function OCCLPanel:render()
	ISPanelJoypad.render(self)
	self:clearStencilRect()
	if self.joyfocus then
		self:drawRectBorder(0, -self:getYScroll(), self:getWidth(), self:getHeight(), 0.4, 0.2, 1.0, 1.0);
		self:drawRectBorder(1, 1-self:getYScroll(), self:getWidth()-2, self:getHeight()-2, 0.4, 0.2, 1.0, 1.0);
	end
end

function OCCLPanel:onMouseWheel(del)
	self:setYScroll(self:getYScroll() - del * 40)
end

function OCCLPanel:onGainJoypadFocus(joypadData)
	ISPanelJoypad.onGainJoypadFocus(self, joypadData)
	self.joypadButtonsY = {}
	for _,table1 in ipairs(self.parent.parent.clothingWidgets) do
		self:insertNewLineOfButtons(table1[1], table1[2], table1[3], table1[4])
	end
	self.joypadIndex = 1
	if self.prevJoypadIndexY ~= -1 then
		self.joypadIndexY = self.prevJoypadIndexY
	else
		self.joypadIndexY = 1
	end
	self.joypadButtons = self.joypadButtonsY[self.joypadIndexY]
	self.joypadButtons[self.joypadIndex]:setJoypadFocused(true)
end

function OCCLPanel:onLoseJoypadFocus(joypadData)
	self.prevJoypadIndexY = self.joypadIndexY
	self:clearJoypadFocus(joypadData)
	ISPanelJoypad.onLoseJoypadFocus(self, joypadData)
end

function OCCLPanel:onJoypadDown(button, joypadData)
	if button == Joypad.BButton and not self:isFocusOnControl() then
		joypadData.focus = self.parent.parent
		updateJoypadFocus(joypadData)
	else
		ISPanelJoypad.onJoypadDown(self, button, joypadData)
	end
end

function OCCLPanel:onJoypadDirLeft(joypadData)
	if self.joypadIndex == 1 then
		joypadData.focus = self.parent.parent.characterPanel
		updateJoypadFocus(joypadData)
	else
		ISPanelJoypad.onJoypadDirLeft(self, joypadData)
	end
end

function OCCLPanel:onJoypadDirRight(joypadData)
	ISPanelJoypad.onJoypadDirRight(self, joypadData)
end

function OCCLPanel:new(x, y, width, height)
	local o = ISPanelJoypad:new(x, y, width, height)
	setmetatable(o, self)
	self.__index = self
	self.prevJoypadIndexY = -1
	return o
end

function CharacterCreationMain:createOCCLPanel()
	local comboHgt = FONT_HGT_SMALL + 3 * 2

	local x = self.mainPanel:getWidth() / 2
	
	self.OCCLPanel = OCCLPanel:new(x, 0, self.mainPanel.width / 2, self.clothingLbl.y + FONT_HGT_MEDIUM + 6 + comboHgt)
	self.OCCLPanel:initialise()
	self.OCCLPanel.background = false
	self.mainPanel:addChild(self.OCCLPanel)
	
	x = 0
	self.OCCLLbl = ISLabel:new(x, self.clothingLbl.y, FONT_HGT_MEDIUM, getText("UI_characreation_occupation"), 1, 1, 1, 1, UIFont.Medium, true)
	self.OCCLLbl:initialise()
	self.OCCLPanel:addChild(self.OCCLLbl)
	
	local rect = ISRect:new(x, self.clothingLbl.y + FONT_HGT_MEDIUM + 5, 400, 1, 1, 0.3, 0.3, 0.3)
	rect:setAnchorRight(true)
	rect:initialise()
	rect:instantiate()
	self.OCCLPanel:addChild(rect)
	
	--[[self.yOffset = self.yOffset + FONT_HGT_MEDIUM + 15
	self.originalYOffset = self.yOffset]]
--end

--[[local old_createClothingBtn = CharacterCreationMain.createClothingBtn

function CharacterCreationMain:createClothingBtn()
    self:createOCCLPanel()
	old_createClothingBtn(self)
end]]

--[[local old_onResolutionChange = CharacterCreationMain.onResolutionChange

function CharacterCreationMain:onResolutionChange(oldw, oldh, neww, newh)
	old_onResolutionChange(self, oldw, oldh, neww, newh)

	if self.OCCLPanel then
		self.OCCLPanel:setX(self.characterPanel:getRight())
		self.OCCLPanel:setWidth(self.mainPanel:getWidth() - self.OCCLPanel.x)
		--self.OCCLPanel:setHeight(self.mainPanel:getHeight() - 5 - 25 - 10)
		self.clothingPanel:setY(self.OCCLPanel.y + self.OCCLPanel.height)
		self.clothingPanel:setHeight(self.clothingPanel.height - self.OCCLPanel.height)
	else
		self.clothingPanel:setY(0)
	end
end

local old_setVisible = CharacterCreationMain.setVisible

function CharacterCreationMain:setVisible(bVisible, joypadData)
	if bVisible then
		if OCCLPanelProfessions[MainScreen.instance.desc:getProfession()] then
			self:createOCCLPanel()
		end
	else if self.OCCLPanel then self.mainPanel:removeChild(self.OCCLPanel); self.OCCLPanel = nil end
	end
	
	old_setVisible(self, bVisible, joypadData)
end]]
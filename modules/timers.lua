-- Variables -------------------------------------------------------------------
Scholar_Timers    = {}
Scholar_Timer_Bar = {}

local colorYellow     = "|cFFFF00"
local colorSoftYellow = "|cCCCC00"
local colorRed        = "|cFF0000"
local colorBlue       = "|c1155bb"
local colorWidget     = "|c1fda9a"

-- Setup new bar ---------------------------------------------------------------
function Scholar_Timer_Bar:New()
	local ret    = setmetatable({}, self)
	self.__index = self

	return ret
end

-- Remove bar ------------------------------------------------------------------
function Scholar_Timer_Bar:Destroy()
	self.bar:SetHandler("OnUpdate", nil)
	self.barsPool:ReleaseObject(self.barKey)

	local key = ""

	if self.craftingSkillType then
		key = self.craftingSkillType .. " " .. self.researchLineIndex .. " " .. self.traitIndex
	else
		key = "riding"
	end

	Scholar_Timers.timers[key]                                 = nil
	Scholar_Timers.parent.savedVariables.timers.completed[key] = nil

	for i=1, #Scholar_Timers.timerKeys do
		if Scholar_Timers.timerKeys[i] == key then
			table.remove(Scholar_Timers.timerKeys, i)
			break
		end
	end

	Scholar_Timers:RearrangeBars()
end

-- Initialize ------------------------------------------------------------------
function Scholar_Timer_Bar:Initialize()
	self.barsPool = ZO_ControlPool:New("Scholar_Timer", Scholar_ResearchTimersContainer, "Bar")
end

-- Update bar ------------------------------------------------------------------
function Scholar_Timer_Bar:Update(time)
	if time > self.timeout then
		self:Completed()
		return
	end

	if time > self.nextBarUpdate then
		local t = ""

		if Scholar_Timers.parent.savedVariables.timers.timerAction == GetString(SCHOLAR_OPTION_DRAIN) then
			t = self.remaining
		else
			t = self.barValue + time - self.start
		end

		self.progressBar:SetValue(t)
		self.nextBarUpdate = time + self.updateInterval
	end

	if time > self.nextTimeUpdate then
		self.remaining = self.timeout - time
		self.timeLeftLabel:SetText(ZO_FormatTime(self.remaining, TIME_FORMAT_STYLE_COLONS, TIME_FORMAT_PRECISION_TWELVE_HOUR))
		self.nextTimeUpdate = time + 1
	end
end

function Scholar_Timer_Bar:ForceUpdate(time)
	if self.completed then
		return
	end

	self.nextBarUpdate  = 0
	self.nextTimeUpdate = 0
	self:Update(time)
end

-- Create bar ------------------------------------------------------------------
function Scholar_Timer_Bar:CreateNewBar(craftingSkillType, researchLineIndex, traitIndex, count)
	self.bar, self.barKey = self.barsPool:AcquireObject()
	self.bar:ClearAnchors()
	self.bar:SetAnchor(TOP, Scholar_ResearchTimersContainer, TOP, 0, (count*Scholar_Timers.parent.savedVariables.timers.spacing)+30)
	Scholar_ResearchTimersContainer:SetHeight((count+1)*52)
	self.closeButton = self.bar:GetNamedChild("Close")
	self.closeButton:SetHidden(true)
	self.closeButton:SetHandler("OnClicked", function() self:Destroy() end)

	self.timeLeftLabel = self.bar:GetNamedChild("TimeLeft")
	self.progressBar   = self.bar:GetNamedChild("Bar")
	self.label         = self.bar:GetNamedChild("Label")
	self.label:SetFont(Scholar_Fonts:GetTimerLabelFontString(Scholar_Timers.parent))
	self.label:SetColor(unpack(Scholar_Timers.parent.savedVariables.timers.labelColor))
	self.timeLeftLabel:SetFont(Scholar_Fonts:GetTimerTimeFontString(Scholar_Timers.parent))
	self.timeLeftLabel:SetColor(unpack(Scholar_Timers.parent.savedVariables.timers.timeColor))

	if researchLineIndex then
		self.progressBar:GetNamedChild("Gloss"):SetColor(unpack(Scholar_Timers.parent.savedVariables.timers.glossColor))
		self.progressBar:SetColor(unpack(Scholar_Timers.parent.savedVariables.timers.backgroundColor))

		self.craftingSkillType = craftingSkillType
		self.researchLineIndex = researchLineIndex
		self.traitIndex        = traitIndex

		local skillName = GetSkillLineInfo(GetCraftingSkillLineIndices(craftingSkillType))
		local name      = GetSmithingResearchLineInfo(craftingSkillType, researchLineIndex)
		local traitName = GetString("SI_ITEMTRAITTYPE", GetSmithingResearchLineTraitInfo(craftingSkillType, researchLineIndex, traitIndex))

		self.duration, self.remaining = GetSmithingResearchLineTraitTimes(craftingSkillType, researchLineIndex, traitIndex)
		self.label:SetText(string.upper(zo_strformat("<<1>> - <<2>> - <<3>>", skillName, name, traitName)))
	else
		self.progressBar:GetNamedChild("Gloss"):SetColor(unpack(Scholar_Timers.parent.savedVariables.timers.stableGlossColor))
		self.progressBar:SetColor(unpack(Scholar_Timers.parent.savedVariables.timers.stableBackgroundColor))

		self.label:SetText(string.upper(GetString(SCHOLAR_TRAIN_RIDING_SKILL)))

		self.remaining, self.duration = GetTimeUntilCanBeTrained()
		self.duration                 = self.duration/1000
		self.remaining                = self.remaining/1000
	end

	if not self.duration or not self.remaining then
		return
	end

	local now = GetGameTimeMilliseconds()/1000

	self.label:ClearAnchors()
	self.closeButton:ClearAnchors()

	if Scholar_Timers.parent.savedVariables.timers.labelAlignment == GetString(SCHOLAR_OPTION_RIGHT) then
		self.closeButton:SetAnchor(RIGHT, self.bar, LEFT, -8)
		self.label:SetAnchor(BOTTOMRIGHT, self.progressBar, TOPRIGHT, 0, -4)
		self.progressBar:SetBarAlignment(BAR_ALIGNMENT_REVERSE)
		self.progressBar:GetNamedChild("Gloss"):SetBarAlignment(BAR_ALIGNMENT_REVERSE)
	else
		self.closeButton:SetAnchor(LEFT, self.bar, RIGHT, 8)
		self.label:SetAnchor(BOTTOMLEFT, self.progressBar, TOPLEFT, 0, -4)
		self.progressBar:SetBarAlignment(BAR_ALIGNMENT_NORMAL)
		self.progressBar:GetNamedChild("Gloss"):SetBarAlignment(BAR_ALIGNMENT_NORMAL)
	end

	self.progressBar:SetMinMax(0, self.duration)

	if Scholar_Timers.parent.savedVariables.timers.timerAction == GetString(SCHOLAR_OPTION_DRAIN) then
		self.barValue = self.remaining
	else
		self.barValue = self.duration-self.remaining
	end

	self.updateInterval = self.duration/320
	self.nextBarUpdate  = 0
	self.timeout        = now + self.remaining
	self.nextTimeUpdate = 0
	self.start          = now
	self.bar:SetHandler("OnUpdate", function(control, time) self:Update(time) end)
end

-- Complete --------------------------------------------------------------------
function Scholar_Timer_Bar:Completed()
	self.bar:GetNamedChild("Close"):SetHidden(false)
	self.bar:SetHandler("OnUpdate", nil)
	self.progressBar:SetMinMax(0, 1)
	self.progressBar:SetValue(1)
	self.completed = true

	self.timeLeftLabel:SetText(GetString(SI_ACHIEVEMENTS_TOOLTIP_COMPLETE) .. "!")

	local key   = ""
	local label = ""
	local icon  = ""

	if self.craftingSkillType then
		local skillName       = GetSkillLineInfo(GetCraftingSkillLineIndices(self.craftingSkillType))
		local name, craftIcon = GetSmithingResearchLineInfo(self.craftingSkillType, self.researchLineIndex)
		local traitName       = GetString("SI_ITEMTRAITTYPE", GetSmithingResearchLineTraitInfo(self.craftingSkillType, self.researchLineIndex, self.traitIndex))

		key   = self.craftingSkillType .. " " .. self.researchLineIndex .. " " .. self.traitIndex
		label = zo_strformat("<<1>> - <<2>> - <<3>>", skillName, name, traitName)
		icon  = craftIcon
	else
		key   = "riding"
		label = GetString(SCHOLAR_STABLE_TIMER_LABEL)
		icon = "esoui/art/icons/mounticon_horse_a.dds"
	end

	if not Scholar_Timers.parent.savedVariables.timers.completed[key] then
		Scholar_Timers.parent.savedVariables.timers.completed[key] = { craftingSkillType = self.craftingSkillType, researchLineIndex = self.researchLineIndex, traitIndex = self.traitIndex }
	end

	if Scholar_Timers.parent.savedVariables.timers.notifications == "Chat" then
		PlaySound("Smithing_Finish_Research")
		CHAT_SYSTEM:AddMessage(colorWidget .. "[Scholar] " .. colorYellow .. GetString(SCHOLAR_TIMERS_COMPLETED) .. ": " .. label)
	elseif Scholar_Timers.parent.savedVariables.timers.notifications == "Announcement" then
		CENTER_SCREEN_ANNOUNCE:AddMessage(0, CSA_EVENT_COMBINED_TEXT, SOUNDS.SMITHING_FINISH_RESEARCH, GetString(SCHOLAR_TIMERS_COMPLETED), label, icon, "esoui/art/achievements/achievements_iconbg.dds")
	end

	if Scholar_Timers.parent.savedVariables.timers.autoClear then
		self:Destroy()
	end
end

-- Apply settings on save ------------------------------------------------------
function Scholar_Timers:ApplySettings()
	for i=1, #self.timerKeys do
		self.timers[self.timerKeys[i]].label:SetFont(Scholar_Fonts:GetTimerLabelFontString(Scholar_Timers.parent))
		self.timers[self.timerKeys[i]].label:SetColor(unpack(Scholar_Timers.parent.savedVariables.timers.labelColor))
		self.timers[self.timerKeys[i]].timeLeftLabel:SetFont(Scholar_Fonts:GetTimerTimeFontString(Scholar_Timers.parent))
		self.timers[self.timerKeys[i]].timeLeftLabel:SetColor(unpack(Scholar_Timers.parent.savedVariables.timers.timeColor))

		if self.timerKeys[i] == "riding" then
			self.timers[self.timerKeys[i]].progressBar:GetNamedChild("Gloss"):SetColor(unpack(Scholar_Timers.parent.savedVariables.timers.stableGlossColor))
			self.timers[self.timerKeys[i]].progressBar:SetColor(unpack(Scholar_Timers.parent.savedVariables.timers.stableBackgroundColor))
		else
			self.timers[self.timerKeys[i]].progressBar:GetNamedChild("Gloss"):SetColor(unpack(Scholar_Timers.parent.savedVariables.timers.glossColor))
			self.timers[self.timerKeys[i]].progressBar:SetColor(unpack(Scholar_Timers.parent.savedVariables.timers.backgroundColor))
		end
	end
end

-- Rearrange bars --------------------------------------------------------------
function Scholar_Timers:RearrangeBars()
	if #self.timerKeys == 0 then
		Scholar_ResearchTimersContainer:SetHeight(1)
		return
	end

	local count = 0

	for i=1, #self.timerKeys do
		self.timers[self.timerKeys[i]].bar:ClearAnchors()
		self.timers[self.timerKeys[i]].bar:SetAnchor(TOP, Scholar_ResearchTimersContainer, TOP, 0, (count*Scholar_Timers.parent.savedVariables.timers.spacing)+30)

		Scholar_ResearchTimersContainer:SetHeight((count+1)*Scholar_Timers.parent.savedVariables.timers.spacing)

		self.timers[self.timerKeys[i]].label:ClearAnchors()
		self.timers[self.timerKeys[i]].closeButton:ClearAnchors()

		if Scholar_Timers.parent.savedVariables.timers.labelAlignment == GetString(SCHOLAR_OPTION_RIGHT) then
			self.timers[self.timerKeys[i]].closeButton:SetAnchor(RIGHT, self.timers[self.timerKeys[i]].bar, LEFT, -8)
			self.timers[self.timerKeys[i]].label:SetAnchor(BOTTOMRIGHT, self.timers[self.timerKeys[i]].progressBar, TOPRIGHT, 0, -4)
			self.timers[self.timerKeys[i]].progressBar:SetBarAlignment(BAR_ALIGNMENT_REVERSE)
			self.timers[self.timerKeys[i]].progressBar:GetNamedChild("Gloss"):SetBarAlignment(BAR_ALIGNMENT_REVERSE)
		else
			self.timers[self.timerKeys[i]].closeButton:SetAnchor(LEFT, self.timers[self.timerKeys[i]].bar, RIGHT, 8)
			self.timers[self.timerKeys[i]].label:SetAnchor(BOTTOMLEFT, self.timers[self.timerKeys[i]].progressBar, TOPLEFT, 0, -4)
			self.timers[self.timerKeys[i]].progressBar:SetBarAlignment(BAR_ALIGNMENT_NORMAL)
			self.timers[self.timerKeys[i]].progressBar:GetNamedChild("Gloss"):SetBarAlignment(BAR_ALIGNMENT_NORMAL)
		end

		count = count + 1
	end
end

-- Add timer -------------------------------------------------------------------
function Scholar_Timers:AddResearchTimer(craftingSkillType, researchLineIndex, traitIndex)
	local bar = Scholar_Timer_Bar:New()
	local key = craftingSkillType .. " " .. researchLineIndex .. " " .. traitIndex

	bar:CreateNewBar(craftingSkillType, researchLineIndex, traitIndex, #self.timerKeys)

	self.timers[key] = bar
	table.insert(self.timerKeys, key)
end

-- Research completed ----------------------------------------------------------
function Scholar_Timers.ResearchCompleted(eventCode, craftingSkillType, researchLineIndex, traitIndex)
	local key = craftingSkillType .. " " .. researchLineIndex .. " " .. traitIndex

	if not Scholar_Timers.timers[key] then
		Scholar_Timers:AddResearchTimer(craftingSkillType, researchLineIndex, traitIndex)
	end

	Scholar_Timers.timers[key]:Completed()
end

-- Research started ------------------------------------------------------------
function Scholar_Timers.ResearchStarted(eventCode, ...)
	Scholar_Timers:AddResearchTimer(...)
end

-- Update timers ---------------------------------------------------------------
function Scholar_Timers:UpdateTimers(time)
	for i=1, #self.timerKeys do
		self.timers[self.timerKeys[i]]:ForceUpdate(time)
	end
end

-- Show timers ------------------------------------------------------------------
function Scholar_Timers:ShowTimers(inCombat)
	if not Scholar_Timers.parent.savedVariables.timers.hideInCombat then
		return
	end

	if not Scholar_Timers.parent.savedVariables.timers.isHidden then
		Scholar_ResearchTimersContainer:SetHidden(inCombat)

		if not inCombat then
			self:UpdateTimers(GetGameTimeMilliseconds()/1000)
		end
	end
end

-- Toggle timers ---------------------------------------------------------------
function Scholar_Timers_Toggle()
	Scholar_Timers.parent.savedVariables.timers.isHidden = not Scholar_Timers.parent.savedVariables.timers.isHidden
	Scholar_ResearchTimersContainer:SetHidden(Scholar_Timers.parent.savedVariables.timers.isHidden)
end

-- Mount update ----------------------------------------------------------------
function Scholar_Timers:MountUpdate()
	if self.timers["riding"] then
		return
	end

	local time = GetTimeUntilCanBeTrained()

	if time and time > 0 then
		self:AddStableTimer()
	end
end

-- Add stable timer ------------------------------------------------------------
function Scholar_Timers:AddStableTimer()
	local bar = Scholar_Timer_Bar:New()
	local key = "riding"

	bar:CreateNewBar(key, nil, nil, #self.timerKeys)

	self.timers[key] = bar
	table.insert(self.timerKeys, key)
end

-- Initialize timers -----------------------------------------------------------
function Scholar_Timers:Initialize(parent)
	Scholar_Timer_Bar:Initialize()

	Scholar_Timers.timers        = {}
	Scholar_Timers.timerKeys     = {}
	Scholar_Timers.parent        = parent
	Scholar_Timers.smithingTypes = {CRAFTING_TYPE_BLACKSMITHING, CRAFTING_TYPE_CLOTHIER, CRAFTING_TYPE_WOODWORKING}

	Scholar_ResearchTimersContainer:SetAnchor(Scholar_Timers.parent.savedVariables.timers.position.point, GuiRoot, Scholar_Timers.parent.savedVariables.timers.position.relPoint, Scholar_Timers.parent.savedVariables.timers.position.x, Scholar_Timers.parent.savedVariables.timers.position.y)
	Scholar_ResearchTimersContainer:SetScale(Scholar_Timers.parent.savedVariables.timers.scale)
	Scholar_ResearchTimersContainer:SetHandler( "OnMoveStop", function()
		local _, point, _, relPoint, x, y = Scholar_ResearchTimersContainer:GetAnchor(0)
		Scholar_Timers.parent.savedVariables.timers.position = nil
		Scholar_Timers.parent.savedVariables.timers.position = { point = point, relPoint = relPoint, x=x, y=y }
	end )

	local timers = {}

	if Scholar_Timers.parent.savedVariables.enable.timers then
		for s=1, #Scholar_Timers.smithingTypes do
			for i=1, GetNumSmithingResearchLines(Scholar_Timers.smithingTypes[s]) do
				local _, _, numTraits = GetSmithingResearchLineInfo(Scholar_Timers.smithingTypes[s], i)

				for t=1, numTraits do
					local dur, remaining = GetSmithingResearchLineTraitTimes(Scholar_Timers.smithingTypes[s], i, t)
					if dur and remaining then
						table.insert(timers, {remaining, Scholar_Timers.smithingTypes[s], i, t})
					end
				end
			end
		end

		table.sort(timers, function(t1, t2)
			if t2[1] < t1[1] and Scholar_Timers.parent.savedVariables.timers.sort == GetString(SCHOLAR_OPTION_DESCENDING) then
				return true
			elseif t1[1] < t2[1] and Scholar_Timers.parent.savedVariables.timers.sort == GetString(SCHOLAR_OPTION_ASCENDING) then
				return true
			end
			return false
		end)

		for i=1, #timers do
			Scholar_Timers:AddResearchTimer(timers[i][2], timers[i][3], timers[i][4])
		end

		for k, v in pairs(Scholar_Timers.parent.savedVariables.timers.completed) do
			Scholar_Timers.ResearchCompleted(nil, v.craftingSkillType, v.researchLineIndex, v.traitIndex)
		end

		Scholar_ResearchTimersContainer:RegisterForEvent(EVENT_SMITHING_TRAIT_RESEARCH_STARTED, Scholar_Timers.ResearchStarted)
		Scholar_ResearchTimersContainer:RegisterForEvent(EVENT_SMITHING_TRAIT_RESEARCH_COMPLETED, Scholar_Timers.ResearchCompleted)

		Scholar_ResearchTimersContainer:RegisterForEvent(EVENT_PLAYER_COMBAT_STATE, function(eventCode, inCombat) Scholar_Timers:ShowTimers(inCombat) end)
	end

	if Scholar_Timers.parent.savedVariables.enable.stableTimer then
		Scholar_Timers:MountUpdate()
		STABLE_MANAGER:RegisterCallback("StableInteractEnd", function() Scholar_Timers:MountUpdate() end)
	end

	local fragment = ZO_SimpleSceneFragment:New(Scholar_ResearchTimersContainer)
	fragment:RegisterCallback("StateChange", function(oldState, newState)
		if newState == SCENE_FRAGMENT_SHOWING then
			Scholar_Timers:UpdateTimers(GetGameTimeMilliseconds()/1000)
		end

		if newState == SCENE_FRAGMENT_SHOWN then
			Scholar_ResearchTimersContainer:SetHidden(Scholar_Timers.parent.savedVariables.timers.isHidden)
		end
	end)

	local scene = SCENE_MANAGER:GetScene("hudui")

	scene:AddFragment(fragment)
	scene = SCENE_MANAGER:GetScene("hud")
	scene:AddFragment(fragment)
end

-- Variables -------------------------------------------------------------------
Scholar_Spinner = {}
Scholar_Spinner_Tables = {
	provisioning = {},
	enchanting   = {},
	alchemy      = {},
	smithing     = {}
}

-- Provisioning ----------------------------------------------------------------
function Scholar_Spinner:OverrideProvisioning()
	Scholar_Spinner_Tables.provisioning.RefreshRecipeList = PROVISIONER.RefreshRecipeList
	PROVISIONER.RefreshRecipeList = function(...)
		Scholar_Spinner_Tables.provisioning.RefreshRecipeList(...)

		self:SetMode()
		self:Reset()
	end

	Scholar_Spinner_Tables.provisioning.SelectNode = PROVISIONER.recipeTree.SelectNode
	PROVISIONER.recipeTree.SelectNode = function(...)
		Scholar_Spinner_Tables.provisioning.SelectNode(...)
		self:Reset()
	end

	-- Create all the things!
	Scholar_Spinner_Tables.provisioning.Create = function()
		PROVISIONER:Create()
	end

	Scholar_Spinner_Tables.provisioning.GetMode = function()
		return 1
	end

	-- Check if an item is craftable
	Scholar_Spinner_Tables.provisioning.IsCraftable = function()
		return PROVISIONER:IsCraftable()
	end
end

-- Enchanting ------------------------------------------------------------------
function Scholar_Spinner:OverrideEnchanting()
	local original = ENCHANTING.SetEnchantingMode
	ENCHANTING.SetEnchantingMode = function(...)
		original(...)

		self:SetMode()
		self:Reset()
	end

	-- Polymorphism
	Scholar_Spinner_Tables.enchanting.GetMode = function()
		return ENCHANTING:GetEnchantingMode()
	end

	-- Rune slot
	Scholar_Spinner_Tables.enchanting.SetRuneSlotItem = ENCHANTING.SetRuneSlotItem
	ENCHANTING.SetRuneSlotItem = function(...)
		Scholar_Spinner_Tables.enchanting.SetRuneSlotItem(...)
		self:Reset()
	end

	-- Extraction
	local original = ENCHANTING.OnSlotChanged
	ENCHANTING.OnSlotChanged = function(...)
		original(...)

		self:SetMode()
		self:Reset()
	end

	-- Create and extract
	Scholar_Spinner_Tables.enchanting.Create = function()
		ENCHANTING:Create()
	end

	-- Check if an item is craftable
	Scholar_Spinner_Tables.enchanting.IsCraftable = function()
		return ENCHANTING:IsCraftable()
	end

	Scholar_Spinner_Tables.enchanting.IsExtractable = Scholar_Spinner_Tables.enchanting.IsCraftable
end

-- Alchemy ---------------------------------------------------------------------
function Scholar_Spinner:OverrideAlchemy()
	Scholar_Spinner_Tables.alchemy.OnSlotChanged = ALCHEMY.OnSlotChanged
	ALCHEMY.OnSlotChanged = function(...)
		Scholar_Spinner_Tables.alchemy.OnSlotChanged(...)
		self:Reset()
	end

	-- Create all the things!
	Scholar_Spinner_Tables.alchemy.Create = function()
		ALCHEMY:Create()
	end

	-- Polymorphism
	Scholar_Spinner_Tables.alchemy.GetMode = function(...)
		return ALCHEMY.mode
	end

	-- Check if an item is craftable
	Scholar_Spinner_Tables.alchemy.IsCraftable = function()
		return ALCHEMY:IsCraftable()
	end

	local original = ALCHEMY.SetMode
	ALCHEMY.SetMode = function(...)
		original(...)
		self:SetMode()
		self:Reset()
	end
end

-- Smithing --------------------------------------------------------------------
function Scholar_Spinner:OverrideSmithing()
	local original = SMITHING.SetMode
	SMITHING.SetMode = function(...)
		original(...)

		self:SetMode()
		self:Reset()
	end

	Scholar_Spinner_Tables.smithing.GetMode = function()
		return SMITHING.mode
	end

	Scholar_Spinner_Tables.smithing.OnSelectedPatternChanged = SMITHING.OnSelectedPatternChanged
	SMITHING.OnSelectedPatternChanged = function(...)
		Scholar_Spinner_Tables.smithing.OnSelectedPatternChanged(...)
		self:Reset()
	end

	-- Deconstruction
	Scholar_Spinner_Tables.smithing.OnExtractionSlotChanged = SMITHING.OnExtractionSlotChanged
	SMITHING.OnExtractionSlotChanged = function(...)
		Scholar_Spinner_Tables.smithing.OnExtractionSlotChanged(...)
		self:Reset()
	end

	-- Create all the things!
	Scholar_Spinner_Tables.smithing.Create = function()
		SMITHING.creationPanel:Create()
	end

	-- Check if an item is craftable
	Scholar_Spinner_Tables.smithing.IsCraftable = function()
		return SMITHING.creationPanel:IsCraftable()
	end

	-- Extraction
	Scholar_Spinner_Tables.smithing.Deconstruct = function()
		SMITHING.deconstructionPanel:Extract()
	end

	-- Check if an item is deconstructable
	Scholar_Spinner_Tables.smithing.IsDeconstructable = function()
		return SMITHING.deconstructionPanel:IsExtractable()
	end

	-- Refinement extraction
	Scholar_Spinner_Tables.smithing.Extract = function()
		SMITHING.refinementPanel:Extract()
	end

	-- Check if an item is refinable
	Scholar_Spinner_Tables.smithing.IsExtractable = function()
		return SMITHING.refinementPanel:IsExtractable()
	end
end

-- Set crafting mode -----------------------------------------------------------
function Scholar_Spinner:SetMode()
	Scholar_Spinner_Tables.craftingStation = GetCraftingInteractionType()

	if Scholar_Spinner_Tables.craftingStation == CRAFTING_TYPE_PROVISIONING then
		Scholar_Spinner_Tables.selectedCraft = Scholar_Spinner_Tables.provisioning
		Scholar_Spinner_Tables.mode          = Scholar_Spinner_Tables.selectedCraft:GetMode()
	elseif Scholar_Spinner_Tables.craftingStation == CRAFTING_TYPE_ENCHANTING then
		Scholar_Spinner_Tables.selectedCraft = Scholar_Spinner_Tables.enchanting
		Scholar_Spinner_Tables.mode          = Scholar_Spinner_Tables.selectedCraft:GetMode()

		if Scholar_Spinner_Tables.mode == ENCHANTING_MODE_RECIPES then
			Scholar_Spinner_Tables.selectedCraft = Scholar_Spinner_Tables.provisioning
		end
	elseif Scholar_Spinner_Tables.craftingStation == CRAFTING_TYPE_ALCHEMY then
		Scholar_Spinner_Tables.selectedCraft = Scholar_Spinner_Tables.alchemy
		Scholar_Spinner_Tables.mode          = Scholar_Spinner_Tables.selectedCraft:GetMode()

		if Scholar_Spinner_Tables.mode == ZO_ALCHEMY_MODE_RECIPES then
			Scholar_Spinner_Tables.selectedCraft = Scholar_Spinner_Tables.provisioning
		end
	elseif Scholar_Spinner_Tables.craftingStation == CRAFTING_TYPE_BLACKSMITHING or Scholar_Spinner_Tables.craftingStation == CRAFTING_TYPE_CLOTHIER or Scholar_Spinner_Tables.craftingStation == CRAFTING_TYPE_WOODWORKING then
		Scholar_Spinner_Tables.selectedCraft = Scholar_Spinner_Tables.smithing
		Scholar_Spinner_Tables.mode = Scholar_Spinner_Tables.selectedCraft:GetMode()

		if Scholar_Spinner_Tables.mode == SMITHING_MODE_RECIPES then
			Scholar_Spinner_Tables.selectedCraft = Scholar_Spinner_Tables.provisioning
		end
	end
end

-- Reset the spinner -----------------------------------------------------------
function Scholar_Spinner:Reset()
	self:Toggle()

	local craftable = 1

	if Scholar_Spinner_Tables.selectedCraft == Scholar_Spinner_Tables.provisioning then
		if Scholar_Spinner_Tables.selectedCraft:IsCraftable() then
			local data = PROVISIONER.recipeTree:GetSelectedData()
			craftable = data.numCreatable
		else
			-- TODO: Make this work better with 1 food/0 drink in provisioning
			craftable = 0
		end
	elseif Scholar_Spinner_Tables.selectedCraft == Scholar_Spinner_Tables.enchanting then
		if Scholar_Spinner_Tables.mode == ENCHANTING_MODE_CREATION then
			if Scholar_Spinner_Tables.selectedCraft:IsCraftable() then
				for k, v in pairs(ENCHANTING.runeSlots) do
					if k == 1 then
						craftable = v.craftingInventory.itemCounts[v.itemInstanceId]
					else
						craftable = zo_min(craftable, v.craftingInventory.itemCounts[v.itemInstanceId])
					end
				end
			else
				craftable = 0
			end
		elseif Scholar_Spinner_Tables.mode == ENCHANTING_MODE_EXTRACTION then
			if Scholar_Spinner_Tables.selectedCraft:IsExtractable() then
				craftable = ENCHANTING.extractionSlot.craftingInventory.itemCounts[ENCHANTING.extractionSlot.itemInstanceId]
			else
				craftable = 0
			end
		end
	elseif Scholar_Spinner_Tables.selectedCraft == Scholar_Spinner_Tables.alchemy then
		if Scholar_Spinner_Tables.selectedCraft:IsCraftable() then
			craftable = ALCHEMY.solventSlot.craftingInventory.itemCounts[ALCHEMY.solventSlot.itemInstanceId]

			if craftable then
				for k, data in pairs(ALCHEMY.reagentSlots) do
					if data:MeetsUsabilityRequirement() then
						if data.craftingInventory.itemCounts[data.itemInstanceId] then
							craftable = zo_min(craftable, data.craftingInventory.itemCounts[data.itemInstanceId])
						end
					end
				end
			else
				craftable = 0
			end
		else
			craftable = 0
		end
	elseif Scholar_Spinner_Tables.selectedCraft == Scholar_Spinner_Tables.smithing then
		if Scholar_Spinner_Tables.mode == SMITHING_MODE_REFINMENT then
			if Scholar_Spinner_Tables.selectedCraft:IsExtractable() then
				craftable = SMITHING.refinementPanel.extractionSlot.craftingInventory.itemCounts[SMITHING.refinementPanel.extractionSlot.itemInstanceId]
				craftable = craftable / GetRequiredSmithingRefinementStackSize()
			else
				craftable = 0
			end
		elseif Scholar_Spinner_Tables.mode == SMITHING_MODE_CREATION then
			if Scholar_Spinner_Tables.selectedCraft:IsCraftable() then
				local patternIndex, materialIndex, materialQuantity, styleIndex, traitIndex = SMITHING.creationPanel:GetAllCraftingParameters()

				local materialCount  = GetCurrentSmithingMaterialItemCount(patternIndex, materialIndex) / materialQuantity
				local styleItemCount = GetCurrentSmithingStyleItemCount(styleIndex)
				local traitCount     = GetCurrentSmithingTraitItemCount(traitIndex)

				craftable = zo_min(materialCount, styleItemCount)

				if traitIndex ~= 1 then
					craftable = zo_min(craftable, traitCount)
				end
			else
				craftable = 0
			end
		elseif Scholar_Spinner_Tables.mode == SMITHING_MODE_DECONSTRUCTION then
			if Scholar_Spinner_Tables.selectedCraft:IsDeconstructable() then
				craftable = SMITHING.deconstructionPanel.extractionSlot.craftingInventory.itemCounts[SMITHING.deconstructionPanel.extractionSlot.itemInstanceId]
			else
				craftable = 0
			end
		end
	end

	craftable = zo_floor(craftable)

	if craftable > 0 then
		self:Toggle()
	end

	if craftable <= 1 then
		Scholar_SpinnerContainer:SetHidden(true)
	else
		Scholar_SpinnerContainer:SetHidden(false)
		Scholar_Spinner_Tables.max = craftable
	end

	if Scholar_Spinner_Tables.isCrafting and Scholar_Spinner_Tables.sliderValue and Scholar_Spinner_Tables.sliderValue >= 1 and Scholar_Spinner_Tables.sliderValue <= Scholar_Spinner_Tables.max then
		Scholar_SpinnerContainer:GetNamedChild("Display"):SetText(Scholar_Spinner_Tables.sliderValue)
	else
		Scholar_SpinnerContainer:GetNamedChild("Display"):SetText(1)
	end
end

-- Check if we can craft selected items ----------------------------------------
function Scholar_Spinner:Craftable()
	local craftable = false

	if Scholar_Spinner_Tables.selectedCraft == Scholar_Spinner_Tables.provisioning then
		craftable = Scholar_Spinner_Tables.selectedCraft:IsCraftable()
	elseif Scholar_Spinner_Tables.selectedCraft == Scholar_Spinner_Tables.enchanting then
		if Scholar_Spinner_Tables.mode == ENCHANTING_MODE_CREATION then
			craftable = Scholar_Spinner_Tables.selectedCraft:IsCraftable()
		elseif Scholar_Spinner_Tables.mode == ENCHANTING_MODE_EXTRACTION then
			craftable = Scholar_Spinner_Tables.selectedCraft:IsExtractable()
		end
	elseif Scholar_Spinner_Tables.selectedCraft == Scholar_Spinner_Tables.alchemy then
		craftable = Scholar_Spinner_Tables.selectedCraft:IsCraftable()
	elseif Scholar_Spinner_Tables.selectedCraft == Scholar_Spinner_Tables.smithing then
		if Scholar_Spinner_Tables.mode == SMITHING_MODE_REFINMENT then
			craftable = Scholar_Spinner_Tables.selectedCraft:IsExtractable()
		elseif Scholar_Spinner_Tables.mode == SMITHING_MODE_CREATION then
			craftable = Scholar_Spinner_Tables.selectedCraft:IsCraftable()
		elseif Scholar_Spinner_Tables.mode == SMITHING_MODE_DECONSTRUCTION then
			craftable = Scholar_Spinner_Tables.selectedCraft:IsDeconstructable()
		end

	end

	return craftable
end

-- Process crafting ------------------------------------------------------------
function Scholar_Spinner:Process(func)
	if Scholar_Spinner_Tables.selectedCraft and not Scholar_Spinner_Tables.isCrafting then
		if Scholar_SpinnerContainer:IsHidden() == false then
			Scholar_Spinner_Qty(0)

			if Scholar_Spinner_Tables.sliderValue > 1 and self:Craftable() then
				Scholar_Spinner_Tables.isCrafting = true

				EVENT_MANAGER:RegisterForEvent(SCHOLAR_NAME, EVENT_CRAFT_COMPLETED, function() self:ContinueProcess(func) end)
			else
				self:Reset()

				EVENT_MANAGER:RegisterForEvent(SCHOLAR_NAME, EVENT_CRAFT_COMPLETED, function() self:ContinueProcess(func) end)
			end
		end
	end
end

function Scholar_Spinner:ContinueProcess(func)
	if Scholar_Spinner_Tables.sliderValue > 1 and Scholar_Spinner_Tables.sliderValue - 1 <= Scholar_Spinner_Tables.max then
		Scholar_Spinner_Tables.sliderValue = Scholar_Spinner_Tables.sliderValue - 1
		zo_callLater(func, callDelay)
	else
		EVENT_MANAGER:UnregisterForEvent(SCHOLAR_NAME, EVENT_CRAFT_COMPLETED)

		Scholar_Spinner_Tables.isCrafting = false
		self:Reset()
	end
end

-- Toggle interface ------------------------------------------------------------
function Scholar_Spinner:Toggle()
	local hidden = true

	if Scholar_Spinner_Tables.selectedCraft == Scholar_Spinner_Tables.provisioning or Scholar_Spinner_Tables.selectedCraft == Scholar_Spinner_Tables.alchemy then
		if Scholar_Spinner_Tables.selectedCraft:IsCraftable() then
			hidden = false
		end
	elseif Scholar_Spinner_Tables.selectedCraft == Scholar_Spinner_Tables.enchanting then
		if (Scholar_Spinner_Tables.mode == ENCHANTING_MODE_CREATION and Scholar_Spinner_Tables.selectedCraft:IsCraftable()) or (Scholar_Spinner_Tables.mode == ENCHANTING_MODE_EXTRACTION and Scholar_Spinner_Tables.selectedCraft:IsExtractable()) then
			hidden = false
		end
	elseif Scholar_Spinner_Tables.selectedCraft == Scholar_Spinner_Tables.smithing then
		if (Scholar_Spinner_Tables.mode == SMITHING_MODE_REFINMENT and Scholar_Spinner_Tables.selectedCraft:IsExtractable()) or
			(Scholar_Spinner_Tables.mode == SMITHING_MODE_CREATION and Scholar_Spinner_Tables.selectedCraft:IsCraftable()) or
			(Scholar_Spinner_Tables.mode == SMITHING_MODE_DECONSTRUCTION and Scholar_Spinner_Tables.selectedCraft:IsDeconstructable()) then
			hidden = false
		end
	end

	Scholar_SpinnerContainer:SetHidden(hidden)
end

-- Track the current crafting station type -------------------------------------
function Scholar_Spinner_SetCraftingSkill(_, craftingType)
	Scholar_Spinner_Tables.craftingStation = GetCraftingInteractionType()

	CALLBACK_MANAGER:FireCallbacks("CraftingAnimationsStopped")
end

-- Hide interface while crafting -----------------------------------------------
function Scholar_Spinner_HideWhileCrafting()
	Scholar_SpinnerContainer:SetHidden(true)
end

-- Cleanup and reset when crafting completes -----------------------------------
function Scholar_Spinner_Cleanup()
	Scholar_Spinner_HideWhileCrafting()

	Scholar_Spinner_Tables.isCrafting      = false
	Scholar_Spinner_Tables.selectedCraft   = nil
	Scholar_Spinner_Tables.craftingStation = nil
	Scholar_Spinner_Tables.max             = 1
	Scholar_Spinner_Tables.sliderValue     = 1
end

-- Set spinner quantity --------------------------------------------------------
function Scholar_Spinner_Qty(delta, ctrl, alt, shift)
	local currentValue = Scholar_SpinnerContainer:GetNamedChild("Display"):GetText()

	if currentValue ~= "" then
		local value = tonumber(currentValue)

		if ctrl or alt or shift or command or IsShiftKeyDown() or IsControlKeyDown() or IsAltKeyDown() or IsCommandKeyDown() then
			delta = delta * 10
		end

		value = value + delta

		if ctrl or alt or shift or command or IsShiftKeyDown() or IsControlKeyDown() or IsAltKeyDown() or IsCommandKeyDown() then
			if value < 1 then
				value = 1
			end

			if value > Scholar_Spinner_Tables.max then
				value = Scholar_Spinner_Tables.max
			end
		else
			-- Rollover on min/max
			if value < 1 then
				value = Scholar_Spinner_Tables.max
			end

			if value > Scholar_Spinner_Tables.max then
				value = 1
			end
		end

		Scholar_SpinnerContainer:GetNamedChild("Display"):SetText(value)
		Scholar_Spinner_Tables.sliderValue = value
	else
		Scholar_SpinnerContainer:GetNamedChild("Display"):SetText(1)
		Scholar_Spinner_Tables.sliderValue = 1
	end
end

-- Initialize timers -----------------------------------------------------------
function Scholar_Spinner:Initialize(parent)
	-- Set up function overrides
	self:OverrideProvisioning()
	self:OverrideEnchanting()
	self:OverrideAlchemy()
	self:OverrideSmithing()

	-- Execute Scholar functions before ESO internal ones
	ZO_PreHook(PROVISIONER, 'Create', function() self:Process(Scholar_Spinner_Tables.provisioning.Create) end)
	ZO_PreHook(ENCHANTING, 'Create', function() self:Process(Scholar_Spinner_Tables.enchanting.Create) end)
	ZO_PreHook(ALCHEMY, 'Create', function() self:Process(Scholar_Spinner_Tables.alchemy.Create) end)
	ZO_PreHook(SMITHING.creationPanel, 'Create', function() self:Process(Scholar_Spinner_Tables.smithing.Create) end)
	ZO_PreHook(SMITHING.deconstructionPanel, 'Extract', function() self:Process(Scholar_Spinner_Tables.smithing.Deconstruct) end)
	ZO_PreHook(SMITHING.refinementPanel, 'Extract', function() self:Process(Scholar_Spinner_Tables.smithing.Extract) end)

	EVENT_MANAGER:RegisterForEvent(SCHOLAR_NAME, EVENT_CRAFTING_STATION_INTERACT, Scholar_Spinner_SetCraftingSkill)
	EVENT_MANAGER:RegisterForEvent(SCHOLAR_NAME, EVENT_CRAFT_STARTED, Scholar_Spinner_HideWhileCrafting)
	EVENT_MANAGER:RegisterForEvent(SCHOLAR_NAME, EVENT_END_CRAFTING_STATION_INTERACT, Scholar_Spinner_Cleanup)

	EVENT_MANAGER:UnregisterForEvent(SCHOLAR_NAME, EVENT_ADD_ON_LOADED)
end

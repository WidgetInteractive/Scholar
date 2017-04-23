-- Constants -------------------------------------------------------------
ADDON_NAME    = "Scholar"
ADDON_VERSION = "0.0.1"
ADDON_WEBSITE = "https://widgetinteractive.com/scholar"

-- Local variables -------------------------------------------------------------
local Scholar = ZO_Object:New()

-- Utilities ------------------------------------------------------------------
function Scholar:SwapSavedVars(useAccountWide)
	if useAccountWide then
		self.savedVariables = self.savedAccount
	else
		self.savedVariables = self.savedCharacter
	end
end

-- Initialization ------------------------------------------------------------
function Scholar:New()
	local norm                     = ZO_NORMAL_TEXT
	self.FONT_COLOR_NORMAL_DEFAULT = {norm.r, norm.g, norm.b, norm.a}

	local defaults = {
		enable = {
			spinner = true,
			timers  = true
		},
		timers = {
			position = {
				point    = RIGHT,
				relPoint = RIGHT,
				x        = 0,
				y        = 0
			},
			completed       = {},
			labelFont       = "Bold",
			labelOutline    = "Soft Thick Shadow",
			labelSize       = 16,
			timeFont        = "Medium",
			timeOutline     = "Thick Outline",
			timeSize        = 14,
			labelColor      = self.FONT_COLOR_NORMAL_DEFAULT,
			timeColor       = {1, 1, 1, 1},
			backgroundColor = {0.529, 1, 1, 1},
			glossColor      = {1, 1, 1, 1},
			labelAlignment  = "Right",
			sort            = "Descending",
			scale           = 0.7,
			spacing         = 50,
			hideInCombat    = true,
			autoClear       = false
		}
	}
	
	self.savedVariables = {}
	self.savedAccount   = ZO_SavedVars:NewAccountWide("Scholar_SavedVariables", 1.8, nil, defaults)
	self.savedCharacter = ZO_SavedVars:New("Scholar_SavedVariables", 1.8, nil, defaults)
	self:SwapSavedVars(self.savedAccount.accountWide)

	self:Initialize()

	return self
end

function Scholar:Initialize()
	Scholar_Settings:CreateMenu(self)

	-- Load modules
	if self.savedVariables.enable.timers then
		Scholar_Timers:Initialize(self)
	end
end

local function OnAddonLoaded(event, addonName)
	if addonName == ADDON_NAME then
		SCHOLAR = Scholar:New()
	end
end
EVENT_MANAGER:RegisterForEvent(ADDON_NAME, EVENT_ADD_ON_LOADED, OnAddonLoaded)
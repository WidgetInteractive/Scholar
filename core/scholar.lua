-- Constants -------------------------------------------------------------------
ADDON_NAME    = "Scholar"
ADDON_VERSION = "1.2.3"
ADDON_WEBSITE = "http://www.esoui.com/downloads/info1670-Scholar.html"

-- Local variables -------------------------------------------------------------
local Scholar = ZO_Object:New()

-- Hotkey definition -----------------------------------------------------------
ZO_CreateStringId("SI_BINDING_NAME_SCHOLAR_TITLE", GetString(SCHOLAR_TITLE))
ZO_CreateStringId("SI_BINDING_NAME_SCHOLAR_TOGGLE_TIMERS", GetString(SCHOLAR_KEYBIND_TOGGLE))

-- Utilities -------------------------------------------------------------------
function Scholar:SwapSavedVars(useAccountWide)
	if useAccountWide then
		self.savedVariables = self.savedAccount
	else
		self.savedVariables = self.savedCharacter
	end
end

-- Initialization --------------------------------------------------------------
function Scholar:New()
	local norm                     = ZO_NORMAL_TEXT
	self.FONT_COLOR_NORMAL_DEFAULT = {norm.r, norm.g, norm.b, norm.a}

	local defaults = {
		enable = {
			timers      = true,
			stableTimer = false
		},
		timers = {
			position = {
				point    = RIGHT,
				relPoint = RIGHT,
				x        = 0,
				y        = 0
			},
			completed = {},
			riding    = {
				inv = -1,
				sta = -1,
				spd = -1
			},
			hideInCombat          = true,
			autoClear             = false,
			notifications         = GetString(SCHOLAR_OPTION_NONE),
			useAbbr               = false,
			labelFont             = GetString(SCHOLAR_OPTION_BOLD),
			labelOutline          = GetString(SCHOLAR_OPTION_SOFT_THICK_SHADOW),
			labelSize             = 16,
			timeFont              = GetString(SCHOLAR_OPTION_MEDIUM),
			timeOutline           = GetString(SCHOLAR_OPTION_THICK_OUTLINE),
			timeSize              = 14,
			labelColor            = self.FONT_COLOR_NORMAL_DEFAULT,
			timeColor             = {1, 1, 1, 1},
			backgroundColor       = {0.529, 1, 1, 1},
			glossColor            = {1, 1, 1, 1},
			labelAlignment        = GetString(SCHOLAR_OPTION_RIGHT),
			timerAction           = GetString(SCHOLAR_OPTION_FILL),
			sort                  = GetString(SCHOLAR_OPTION_DESCENDING),
			scale                 = 0.7,
			spacing               = 50,
			stableBackgroundColor = {0.529, 1, 1, 1},
			stableGlossColor      = {1, 1, 1, 1}
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
	Scholar_Slash_Commands:Initialize(self)

	-- Load modules
	if self.savedVariables.enable.timers or self.savedVariables.enable.stableTimer then
		Scholar_Timers:Initialize(self)
	end
end

local function OnAddonLoaded(event, addonName)
	if addonName == ADDON_NAME then
		SCHOLAR = Scholar:New()
	end
end
EVENT_MANAGER:RegisterForEvent(ADDON_NAME, EVENT_ADD_ON_LOADED, OnAddonLoaded)

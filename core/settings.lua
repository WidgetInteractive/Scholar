-- Libraries -------------------------------------------------------------------
local LAM = LibStub("LibAddonMenu-2.0")

-- Variables -------------------------------------------------------------------
Scholar_Settings = {}

-- Settings menu ---------------------------------------------------------------
function Scholar_Settings:CreateMenu(parent)
	-- Register panel
	local panelData = {
		type                = "panel",
		name                = GetString(SCHOLAR_TITLE),
		displayName         = GetString(SCHOLAR_TITLE),
		author              = "Widget Interactive",
		version             = ADDON_VERSION,
		slashCommand        = "/scholar",
		registerForRefresh  = true,
		registerForDefaults = true,
		website             = ADDON_WEBSITE
	}
	LAM:RegisterAddonPanel("Scholar_Settings", panelData)

	-- Load ZO_NORMAL_TEXT to set defaults
	local norm = ZO_NORMAL_TEXT
	
	-- Define options
	local optionsData = {
		{
			type     = "submenu",
			name     = GetString(SCHOLAR_GENERAL_TITLE),
			controls = {
				{
					type    = "checkbox",
					name    = GetString(SCHOLAR_ACCOUNT_WIDE),
					tooltip = GetString(SCHOLAR_ACCOUNT_WIDE_TIP),
					default = true,
					getFunc = function() return parent.savedAccount.accountWide end,
					setFunc = function(bValue)
						parent.savedAccount.accountWide = bValue
						if not bValue then
							local sDisplayName = GetDisplayName()
							local sUnitName    = GetUnitName("player")
						end
						parent:SwapSavedVars(bValue)
					end
				},
				{
					type = "header",
					name = GetString(SCHOLAR_MODULES_HEADER)
				},
				{
					type = "description",
					text = GetString(SCHOLAR_MODULES_DESCRIPTION)
				},
				{
					type    = "checkbox",
					name    = GetString(SCHOLAR_ENABLE_TIMERS),
					tooltip = GetString(SCHOLAR_ENABEL_TIMERS_TIP),
					default = true,
					getFunc = function() return parent.savedVariables.enable.timers end,
					setFunc = function(enable) parent.savedVariables.enable.timers = enable end
				},
				{
					type    = "button",
					name    = GetString(SCHOLAR_RELOAD_UI),
					tooltip = GetString(SCHOLAR_RELOAD_UI_TIP),
					func    = function() ReloadUI("ingame") end
				}
			}
		},
		{
			type     = "submenu",
			name     = GetString(SCHOLAR_TIMERS_TITLE),
			controls = {
				{
					type    = "dropdown",
					name    = GetString(SCHOLAR_TIMERS_LABEL_FONT),
					tooltip = GetString(SCHOLAR_TIMERS_LABEL_FONT_TIP),
					choices = Scholar_Fonts:GetFontChoices(),
					default = parent.savedVariables.default.timers.labelFont,
					getFunc = function() return parent.savedVariables.timers.labelFont end,
					setFunc = function(labelFont) parent.savedVariables.timers.labelFont = labelFont
						Scholar_Timers:ApplySettings()
					end
				},
				{
					type    = "dropdown",
					name    = GetString(SCHOLAR_TIMERS_LABEL_OUTLINE),
					tooltip = GetString(SCHOLAR_TIMERS_LABEL_OUTLINE_TIP),
					choices = Scholar_Fonts:GetOutlineChoices(),
					default = parent.savedVariables.default.timers.labelOutline,
					getFunc = function() return parent.savedVariables.timers.labelOutline end,
					setFunc = function(labelOutline) parent.savedVariables.timers.labelOutline = labelOutline
						Scholar_Timers:ApplySettings()
					end
				},
				{
					type     = "slider",
					name     = GetString(SCHOLAR_TIMERS_LABEL_SIZE),
					tooltip  = GetString(SCHOLAR_TIMERS_LABEL_SIZE_TIP),
					default  = 16,
					min      = 10,
					max      = 24,
					step     = 1,
					decimals = 0,
					getFunc  = function() return parent.savedVariables.timers.labelSize end,
					setFunc  = function(labelSize) parent.savedVariables.timers.labelSize = labelSize
						Scholar_Timers:ApplySettings()
					end
				},
				{
					type    = "colorpicker",
					name    = GetString(SCHOLAR_TIMERS_LABEL_COLOR),
					tooltip = GetString(SCHOLAR_TIMERS_LABEL_COLOR_TIP),
					default = {r=norm.r, g=norm.g, b=norm.b, a=norm.a},
					getFunc = function() return unpack(parent.savedVariables.timers.labelColor) end,
					setFunc = function(r,g,b,a) parent.savedVariables.timers.labelColor = {r, g, b, a}
						Scholar_Timers:ApplySettings()
					end
				},
				{
					type    = "dropdown",
					name    = GetString(SCHOLAR_TIMERS_TIME_FONT),
					tooltip = GetString(SCHOLAR_TIMERS_TIME_FONT_TIP),
					choices = Scholar_Fonts:GetFontChoices(),
					default = parent.savedVariables.default.timers.timeFont,
					getFunc = function() return parent.savedVariables.timers.timeFont end,
					setFunc = function(timeFont) parent.savedVariables.timers.timeFont = timeFont
						Scholar_Timers:ApplySettings()
					end
				},
				{
					type    = "dropdown",
					name    = GetString(SCHOLAR_TIMERS_TIME_OUTLINE),
					tooltip = GetString(SCHOLAR_TIMERS_TIME_OUTLINE_TIP),
					choices = Scholar_Fonts:GetOutlineChoices(),
					default = parent.savedVariables.default.timers.timeOutline,
					getFunc = function() return parent.savedVariables.timers.timeOutline end,
					setFunc = function(timeOutline) parent.savedVariables.timers.timeOutline = timeOutline
						Scholar_Timers:ApplySettings()
					end
				},
				{
					type     = "slider",
					name     = GetString(SCHOLAR_TIMERS_TIME_SIZE),
					tooltip  = GetString(SCHOLAR_TIMERS_TIME_SIZE_TIP),
					default  = 14,
					min      = 10,
					max      = 24,
					step     = 1,
					decimals = 0,
					getFunc  = function() return parent.savedVariables.timers.timeSize end,
					setFunc  = function(timeSize) parent.savedVariables.timers.timeSize = timeSize
						Scholar_Timers:ApplySettings()
					end
				},
				{
					type    = "colorpicker",
					name    = GetString(SCHOLAR_TIMERS_TIME_COLOR),
					tooltip = GetString(SCHOLAR_TIMERS_TIME_COLOR_TIP),
					default = {r=1, g=1, b=1, a=1},
					getFunc = function() return unpack(parent.savedVariables.timers.timeColor) end,
					setFunc = function(r,g,b,a) parent.savedVariables.timers.timeColor = {r, g, b, a}
						Scholar_Timers:ApplySettings()
					end
				},
				{
					type    = "colorpicker",
					name    = GetString(SCHOLAR_TIMERS_BACKGROUND_COLOR),
					tooltip = GetString(SCHOLAR_TIMERS_BACKGROUND_COLOR_TIP),
					default = {r=0.529, g=1, b=1, a=1},
					getFunc = function() return unpack(parent.savedVariables.timers.backgroundColor) end,
					setFunc = function(r,g,b,a) parent.savedVariables.timers.backgroundColor = {r, g, b, a}
						Scholar_Timers:ApplySettings()
					end
				},
				{
					type    = "colorpicker",
					name    = GetString(SCHOLAR_TIMERS_GLOSS_COLOR),
					tooltip = GetString(SCHOLAR_TIMERS_GLOSS_COLOR_TIP),
					default = {r=1, g=1, b=1, a=1},
					getFunc = function() return unpack(parent.savedVariables.timers.glossColor) end,
					setFunc = function(r,g,b,a) parent.savedVariables.timers.glossColor = {r, g, b, a}
						Scholar_Timers:ApplySettings()
					end
				},
				{
					type    = "dropdown",
					name    = GetString(SCHOLAR_TIMERS_LABEL_ALIGNMENT),
					tooltip = GetString(SCHOLAR_TIMERS_LABEL_ALIGNMENT_TIP),
					choices = {"Right", "Left"},
					default = "Right",
					getFunc = function() return parent.savedVariables.timers.labelAlignment end,
					setFunc = function(labelAlignment) parent.savedVariables.timers.labelAlignment = labelAlignment
						Scholar_Timers:RearrangeBars()
					end
				},
				{
					type    = "dropdown",
					name    = GetString(SCHOLAR_TIMERS_SORT),
					tooltip = GetString(SCHOLAR_TIMERS_SORT_TIP),
					warning = GetString(SCHOLAR_RELOAD_WARNING),
					choices = {"Descending", "Ascending"},
					default = "Descending",
					getFunc = function() return parent.savedVariables.timers.sort end,
					setFunc = function(sort) parent.savedVariables.timers.sort = sort
						ReloadUI("ingame")
					end
				},
				{
					type     = "slider",
					name     = GetString(SCHOLAR_TIMERS_SCALE),
					tooltip  = GetString(SCHOLAR_TIMERS_SCALE_TIP),
					default  = 0.7,
					min      = 0.5,
					max      = 1,
					step     = 0.1,
					decimals = 1,
					getFunc  = function() return parent.savedVariables.timers.scale end,
					setFunc  = function(scale) parent.savedVariables.timers.scale = scale
						Scholar_ResearchTimersContainer:SetScale(scale)
					end
				},
				{
					type    = "slider",
					name    = GetString(SCHOLAR_TIMERS_SPACING),
					tooltip = GetString(SCHOLAR_TIMERS_SPACING_TIP),
					default = 50,
					min     = 30,
					max     = 70,
					step    = 1,
					getFunc = function() return parent.savedVariables.timers.spacing end,
					setFunc = function(spacing) parent.savedVariables.timers.spacing = spacing
						Scholar_Timers:RearrangeBars()
					end
				},
				{
					type    = "checkbox",
					name    = GetString(SCHOLAR_TIMERS_HIDE_IN_COMBAT),
					tooltip = GetString(SCHOLAR_TIMERS_HIDE_IN_COMBAT_TIP),
					default = true,
					getFunc = function() return parent.savedVariables.timers.hideInCombat end,
					setFunc = function(hideInCombat) parent.savedVariables.timers.hideInCombat = hideInCombat
						Scholar_Timers:ApplySettings()
					end
				},
				{
					type    = "checkbox",
					name    = GetString(SCHOLAR_TIMERS_AUTOCLEAR),
					tooltip = GetString(SCHOLAR_TIMERS_AUTOCLEAR_TIP),
					default = false,
					getFunc = function() return parent.savedVariables.timers.autoClear end,
					setFunc = function(autoClear) parent.savedVariables.timers.autoClear = autoClear
						Scholar_Timers:ApplySettings()
					end
				}
			}
		}
	}
	LAM:RegisterOptionControls("Scholar_Settings", optionsData)
end
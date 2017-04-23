local strings = {
	-- Settings menu header
	SCHOLAR_TITLE = "Scholar",

	-- Common use
	SCHOLAR_RELOAD_WARNING = "Changing this setting will reload the UI!",
	
	-- General settings
	SCHOLAR_GENERAL_TITLE       = "General Settings",
	SCHOLAR_ACCOUNT_WIDE        = "Use Account Wide Settings",
	SCHOLAR_ACCOUNT_WIDE_TIP    = "Enable this setting to allow use the same configuration for all of your characters.",
	SCHOLAR_MODULES_HEADER      = "Modules",
	SCHOLAR_MODULES_DESCRIPTION = "Enabling or disabling modules requires reloading the UI for changes to take effect.",
	SCHOLAR_ENABLE_TIMERS       = "Research Timers",
	SCHOLAR_ENABLE_TIMERS_TIP   = "Enable this setting to display research timers.",
	SCHOLAR_RELOAD_UI           = "Reload UI",
	SCHOLAR_RELOAD_UI_TIP       = "Click this button to reload the UI if you enable or disable modules.",
	
	-- Timers settings
	SCHOLAR_TIMERS_TITLE                = "Research Timer Settings",
	SCHOLAR_TIMERS_LABEL_FONT           = "Label Font",
	SCHOLAR_TIMERS_LABEL_FONT_TIP       = "Set the font used for timer labels.",
	SCHOLAR_TIMERS_LABEL_OUTLINE        = "Label Outline",
	SCHOLAR_TIMERS_LABEL_OUTLINE_TIP    = "Set the outline effect used for timer labels.",
	SCHOLAR_TIMERS_LABEL_SIZE           = "Label Size",
	SCHOLAR_TIMERS_LABEL_SIZE_TIP       = "Set the font size used for label timers.",
	SCHOLAR_TIMERS_LABEL_COLOR          = "Label Color",
	SCHOLAR_TIMERS_LABEL_COLOR_TIP      = "Set the color used for timer labels.",
	SCHOLAR_TIMERS_TIME_FONT            = "Time Font",
	SCHOLAR_TIMERS_TIME_FONT_TIP        = "Set the font used for timer time display.",
	SCHOLAR_TIMERS_TIME_OUTLINE         = "Time Outline",
	SCHOLAR_TIMERS_TIME_OUTLINE_TIP     = "Set the outline effect used for timer time display.",
	SCHOLAR_TIMERS_TIME_SIZE            = "Time Size",
	SCHOLAR_TIMERS_TIME_SIZE_TIP        = "Set the font size used for timer time display.",
	SCHOLAR_TIMERS_TIME_COLOR           = "Time Color",
	SCHOLAR_TIMERS_TIME_COLOR_TIP       = "Set the color used for timer time display.",
	SCHOLAR_TIMERS_BACKGROUND_COLOR     = "Background Color",
	SCHOLAR_TIMERS_BACKGROUND_COLOR_TIP = "Set the color used for the background of individual timer bars.",
	SCHOLAR_TIMERS_GLOSS_COLOR          = "Gloss Color",
	SCHOLAR_TIMERS_GLOSS_COLOR_TIP      = "Set the color used for the gloss (highlight) of individual timer bars.",
	SCHOLAR_TIMERS_LABEL_ALIGNMENT      = "Label Alignment",
	SCHOLAR_TIMERS_LABEL_ALIGNMENT_TIP  = "Set whether you prefer timer labels to be right or left aligned.",
	SCHOLAR_TIMERS_SORT                 = "Sort Order",
	SCHOLAR_TIMERS_SORT_TIP             = "Set whether you prefer timers to be sorted by time left ascending or descending.",
	SCHOLAR_TIMERS_SCALE                = "UI Scale",
	SCHOLAR_TIMERS_SCALE_TIP            = "Set the scale ratio for the timer display.",
	SCHOLAR_TIMERS_SPACING              = "Timer Spacing",
	SCHOLAR_TIMERS_SPACING_TIP          = "Set the spacing between individual timers.",
	SCHOLAR_TIMERS_HIDE_IN_COMBAT       = "Hide While In Combat",
	SCHOLAR_TIMERS_HIDE_IN_COMBAT_TIP   = "Enable this setting to hide research timers while in combat.",
	SCHOLAR_TIMERS_AUTOCLEAR            = "Auto-Clear Timers",
	SCHOLAR_TIMERS_AUTOCLEAR_TIP        = "Enable this setting to automatically clear research timers when they are completed."
}
for stringId, stringValue in pairs(strings) do
	ZO_CreateStringId(stringId, stringValue)
	SafeAddVersion(stringId, 1)
end
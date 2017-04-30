--------------------------------------
-- English localization for Scholar --
--------------------------------------

-- The below code is commented out because English strings are
-- in the strings.lua file. This file exists to provide an example
-- of what a localization file should look like. Please feel free
-- to translate to your own language and contribute!

--[[
-- Settings menu header
SafeAddString(SCHOLAR_TITLE, "Scholar"), 1),

-- Common use
SafeAddString(SCHOLAR_RELOAD_WARNING, "Changing this setting will reload the UI!"), 1),

-- Commands
SafeAddString(SCHOLAR_COMMANDS_VALID, "Valid Commands"),
SafeAddString(SCHOLAR_COMMANDS_TIMERS, "Toggle display of timers"),
SafeAddString(SCHOLAR_COMMANDS_SETTINGS, "Display settings panel"),
SafeAddString(SCHOLAR_COMMANDS_NONE, "There are no valid slash commands for the current configuration."),

-- General settings
SafeAddString(SCHOLAR_GENERAL_TITLE, "General Settings"), 1),
SafeAddString(SCHOLAR_ACCOUNT_WIDE, "Use Account Wide Settings"), 1),
SafeAddString(SCHOLAR_ACCOUNT_WIDE_TIP, "Enable this setting to allow use the same configuration for all of your characters."), 1),
SafeAddString(SCHOLAR_MODULES_HEADER, "Modules, 1),
SafeAddString(SCHOLAR_MODULES_DESCRIPTION, "Enabling or disabling modules requires reloading the UI for changes to take effect., 1),
SafeAddString(SCHOLAR_ENABLE_TIMERS, "Research Timers, 1),
SafeAddString(SCHOLAR_ENABLE_TIMERS_TIP, "Enable this setting to display research timers., 1),
SafeAddString(SCHOLAR_ENABLE_STABLE_TIMER, "Stable Timer"),
SafeAddString(SCHOLAR_ENABLE_STABLE_TIMER_TIP, "Enable this setting to display the stable timer."),
SafeAddString(SCHOLAR_RELOAD_UI, "Reload UI, 1),
SafeAddString(SCHOLAR_RELOAD_UI_TIP, "Click this button to reload the UI if you enable or disable modules., 1),

-- Timers settings
SafeAddString(SCHOLAR_TIMERS_TITLE, "Research Timer Settings"), 1),
SafeAddString(SCHOLAR_TIMERS_LABEL_FONT, "Label Font"), 1),
SafeAddString(SCHOLAR_TIMERS_LABEL_FONT_TIP, "Set the font used for timer labels."), 1),
SafeAddString(SCHOLAR_TIMERS_LABEL_OUTLINE, "Label Outline"), 1),
SafeAddString(SCHOLAR_TIMERS_LABEL_OUTLINE_TIP, "Set the outline effect used for timer labels."), 1),
SafeAddString(SCHOLAR_TIMERS_LABEL_SIZE, "Label Size"), 1),
SafeAddString(SCHOLAR_TIMERS_LABEL_SIZE_TIP, "Set the font size used for label timers."), 1),
SafeAddString(SCHOLAR_TIMERS_LABEL_COLOR, "Label Color"), 1),
SafeAddString(SCHOLAR_TIMERS_LABEL_COLOR_TIP, "Set the color used for timer labels."), 1),
SafeAddString(SCHOLAR_TIMERS_TIME_FONT, "Time Font"), 1),
SafeAddString(SCHOLAR_TIMERS_TIME_FONT_TIP, "Set the font used for timer time display."), 1),
SafeAddString(SCHOLAR_TIMERS_TIME_OUTLINE, "Time Outline"), 1),
SafeAddString(SCHOLAR_TIMERS_TIME_OUTLINE_TIP, "Set the outline effect used for timer time display."), 1),
SafeAddString(SCHOLAR_TIMERS_TIME_SIZE, "Time Size"), 1),
SafeAddString(SCHOLAR_TIMERS_TIME_SIZE_TIP, "Set the font size used for timer time display."), 1),
SafeAddString(SCHOLAR_TIMERS_TIME_COLOR, "Time Color"), 1),
SafeAddString(SCHOLAR_TIMERS_TIME_COLOR_TIP, "Set the color used for timer time display."), 1),
SafeAddString(SCHOLAR_TIMERS_BACKGROUND_COLOR, "Background Color"), 1),
SafeAddString(SCHOLAR_TIMERS_BACKGROUND_COLOR_TIP, "Set the color used for the background of individual timer bars."), 1),
SafeAddString(SCHOLAR_TIMERS_GLOSS_COLOR, "Gloss Color"), 1),
SafeAddString(SCHOLAR_TIMERS_GLOSS_COLOR_TIP, "Set the color used for the gloss (highlight) of individual timer bars."), 1),
SafeAddString(SCHOLAR_TIMERS_LABEL_ALIGNMENT, "Label Alignment"), 1),
SafeAddString(SCHOLAR_TIMERS_LABEL_ALIGNMENT_TIP, "Set whether you prefer timer labels to be right or left aligned."), 1),
SafeAddString(SCHOLAR_TIMERS_SORT, "Sort Order"), 1),
SafeAddString(SCHOLAR_TIMERS_SORT_TIP, "Set whether you prefer timers to be sorted by time left ascending or descending."), 1),
SafeAddString(SCHOLAR_TIMERS_SCALE, "UI Scale"), 1),
SafeAddString(SCHOLAR_TIMERS_SCALE_TIP, "Set the scale ratio for the timer display."), 1),
SafeAddString(SCHOLAR_TIMERS_SPACING, "Timer Spacing"), 1),
SafeAddString(SCHOLAR_TIMERS_SPACING_TIP, "Set the spacing between individual timers."), 1),
SafeAddString(SCHOLAR_TIMERS_HIDE_IN_COMBAT, "Hide While In Combat"), 1),
SafeAddString(SCHOLAR_TIMERS_HIDE_IN_COMBAT_TIP, "Enable this setting to hide research timers while in combat."), 1),
SafeAddString(SCHOLAR_TIMERS_AUTOCLEAR, "Auto-Clear Timers"), 1),
SafeAddString(SCHOLAR_TIMERS_AUTOCLEAR_TIP, "Enable this setting to automatically clear research timers when they are completed."
SafeAddString(SCHOLAR_TIMERS_AUTOCLEAR, "Auto-Clear Timers"), 1),
SafeAddString(SCHOLAR_TIMERS_AUTOCLEAR_TIP, "Enable this setting to automatically clear research timers when they are completed."),
SafeAddString(SCHOLAR_TIMERS_NOTIFICATIONS, "Notification Type"),
SafeAddString(SCHOLAR_TIMERS_NOTIFICATIONS_TIP, "Choose how notifications should be displayed when research completes."),
SafeAddString(SCHOLAR_STABLE_TIMER_TITLE, "Stable Timer Settings"),
SafeAddString(SCHOLAR_STABLE_TIMER_DESCRIPTION, "The stable timer inherits its settings from the research timers, but the timer color can be independently configured for clarity."),
SafeAddString(SCHOLAR_STABLE_TIMER_BACKGROUND_COLOR, "Background Color"),
SafeAddString(SCHOLAR_STABLE_TIMER_BACKGROUND_COLOR_TIP, "Set the color used for the background of the stable timer bar."),
SafeAddString(SCHOLAR_STABLE_TIMER_GLOSS_COLOR, "Gloss Color"),
SafeAddString(SCHOLAR_STABLE_TIMER_GLOSS_COLOR_TIP, "Set the color used for the gloss (highlight) of the stable timer bar."),
SafeAddString(SCHOLAR_STABLE_TIMER_LABEL, "Riding skill"),
SafeAddString(SCHOLAR_TRAIN_RIDING_SKILL, "Train riding skill in"),
SafeAddString(SCHOLAR_TIMERS_COMPLETED, "Completed training"),

-- Dropdown option strings
SafeAddString(SCHOLAR_OPTION_NONE, "None"),
SafeAddString(SCHOLAR_OPTION_CHAT, "Chat"),
SafeAddString(SCHOLAR_OPTION_ANNOUNCEMENT, "Announcement"),
SafeAddString(SCHOLAR_OPTION_LEFT, "Left"),
SafeAddString(SCHOLAR_OPTION_RIGHT, "Right"),
SafeAddString(SCHOLAR_OPTION_ASCENDING, "Ascending"),
SafeAddString(SCHOLAR_OPTION_DESCENDING, "Descending"),
SafeAddString(SCHOLAR_OPTION_BOLD, "Bold"),
SafeAddString(SCHOLAR_OPTION_MEDIUM, "Medium"),
SafeAddString(SCHOLAR_OPTION_ANTIQUE, "Antique"),
SafeAddString(SCHOLAR_OPTION_HANDWRITTEN, "Handwritten"),
SafeAddString(SCHOLAR_OPTION_STONE_TABLET, "Stone Tablet"),
SafeAddString(SCHOLAR_OPTION_GAMEPAD_BOLD, "Gamepad Bold"),
SafeAddString(SCHOLAR_OPTION_GAMEPAD_MEDIUM, "Gamepad Medium"),
SafeAddString(SCHOLAR_OPTION_ARIAL_NARROW, "Arial Narrow"),
SafeAddString(SCHOLAR_OPTION_SOFT_THICK_SHADOW, "Soft Thick Shadow"),
SafeAddString(SCHOLAR_OPTION_SOFT_THIN_SHADOW, "Soft Thin Shadow"),
SafeAddString(SCHOLAR_OPTION_SHADOW, "Shadow"),
SafeAddString(SCHOLAR_OPTION_THICK_OUTLINE, "Thick Outline"),
SafeAddString(SCHOLAR_OPTION_THIN_OUTLINE, "Thin Outline"),
SafeAddString(SCHOLAR_OPTION_OUTLINE, "Outline")
--]]

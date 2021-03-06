--------------------------------------
-- English localization for Scholar --
--------------------------------------

-- The below code is commented out because English strings are
-- in the strings.lua file. This file exists to provide an example
-- of what a localization file should look like. Please feel free
-- to translate to your own language and contribute!

--[[
-- Settings menu header
SafeAddString(SCHOLAR_TITLE, "Scholar", 1),

-- Common use
SafeAddString(SCHOLAR_RELOAD_WARNING, "Changing this setting will reload the UI!", 1),

-- Keybindings
SafeAddString(SCHOLAR_KEYBIND_TOGGLE, "Toggle display of timers", 1),

-- Commands
SafeAddString(SCHOLAR_COMMANDS_VALID, "Valid Commands", 1),
SafeAddString(SCHOLAR_COMMANDS_TIMERS, "Toggle display of timers", 1),
SafeAddString(SCHOLAR_COMMANDS_SETTINGS, "Display settings panel", 1),
SafeAddString(SCHOLAR_COMMANDS_NONE, "There are no valid slash commands for the current configuration.", 1),
SafeAddString(SCHOLAR_COMMANDS_SET, "Set custom options for a certain available settings.", 1),

-- Commands - set
SafeAddString(SCHOLAR_COMMANDS_SET_TIMERSOUND, "Set a custom sound for notification timers (See http://wiki.esoui.com/Sounds).", 1),

-- General settings
SafeAddString(SCHOLAR_GENERAL_TITLE, "General Settings", 1),
SafeAddString(SCHOLAR_ACCOUNT_WIDE, "Use Account Wide Settings", 1),
SafeAddString(SCHOLAR_ACCOUNT_WIDE_TIP, "Enable this setting to allow use the same configuration for all of your characters.", 1),
SafeAddString(SCHOLAR_MODULES_HEADER, "Modules, 1),
SafeAddString(SCHOLAR_MODULES_DESCRIPTION, "Enabling or disabling modules requires reloading the UI for changes to take effect.", 1),
SafeAddString(SCHOLAR_ENABLE_TIMERS, "Research Timers, 1),
SafeAddString(SCHOLAR_ENABLE_TIMERS_TIP, "Enable this setting to display research timers.", 1),
SafeAddString(SCHOLAR_ENABLE_STABLE_TIMER, "Stable Timer", 1),
SafeAddString(SCHOLAR_ENABLE_STABLE_TIMER_TIP, "Enable this setting to display the stable timer.", 1),
SafeAddString(SCHOLAR_ENABLE_SPINNER, "Crafting Spinner", 1),
SafeAddString(SCHOLAR_ENABLE_SPINNER_TIP, "Enable this setting to add a spinner to crafting stations, allowing you to craft an item multiple times.", 1),
SafeAddString(SCHOLAR_RELOAD_UI, "Reload UI, 1),
SafeAddString(SCHOLAR_RELOAD_UI_TIP, "Click this button to reload the UI if you enable or disable modules.", 1),

-- Timers settings
SafeAddString(SCHOLAR_TIMERS_TITLE, "Research Timer Settings", 1),
SafeAddString(SCHOLAR_TIMERS_LABEL_HEADER, "Label Settings", 1),
SafeAddString(SCHOLAR_TIMERS_BAR_COLORS_HEADER, "Timer Bar Color Settings", 1),
SafeAddString(SCHOLAR_TIMERS_DISPLAY_HEADER, "Display Settings", 1),
SafeAddString(SCHOLAR_TIMERS_USE_ABBR, "Use Abbreviations", 1),
SafeAddString(SCHOLAR_TIMERS_USE_ABBR_TIP, "Enable this setting to abbreviate skill type and trait names in timer labels.", 1),
SafeAddString(SCHOLAR_TIMERS_TYPE, "Timer Type", 1),
SafeAddString(SCHOLAR_TIMERS_TYPE_TIP, "Specify whether to display timers with times or percentages.", 1),
SafeAddString(SCHOLAR_TIMERS_LABEL_FONT, "Label Font", 1),
SafeAddString(SCHOLAR_TIMERS_LABEL_FONT_TIP, "Set the font used for timer labels.", 1),
SafeAddString(SCHOLAR_TIMERS_LABEL_OUTLINE, "Label Outline", 1),
SafeAddString(SCHOLAR_TIMERS_LABEL_OUTLINE_TIP, "Set the outline effect used for timer labels.", 1),
SafeAddString(SCHOLAR_TIMERS_LABEL_SIZE, "Label Size", 1),
SafeAddString(SCHOLAR_TIMERS_LABEL_SIZE_TIP, "Set the font size used for label timers.", 1),
SafeAddString(SCHOLAR_TIMERS_LABEL_COLOR, "Label Color", 1),
SafeAddString(SCHOLAR_TIMERS_LABEL_COLOR_TIP, "Set the color used for timer labels.", 1),
SafeAddString(SCHOLAR_TIMERS_TIME_FONT, "Time Font", 1),
SafeAddString(SCHOLAR_TIMERS_TIME_FONT_TIP, "Set the font used for timer time display.", 1),
SafeAddString(SCHOLAR_TIMERS_TIME_OUTLINE, "Time Outline", 1),
SafeAddString(SCHOLAR_TIMERS_TIME_OUTLINE_TIP, "Set the outline effect used for timer time display.", 1),
SafeAddString(SCHOLAR_TIMERS_TIME_SIZE, "Time Size", 1),
SafeAddString(SCHOLAR_TIMERS_TIME_SIZE_TIP, "Set the font size used for timer time display.", 1),
SafeAddString(SCHOLAR_TIMERS_TIME_COLOR, "Time Color", 1),
SafeAddString(SCHOLAR_TIMERS_TIME_COLOR_TIP, "Set the color used for timer time display.", 1),
SafeAddString(SCHOLAR_TIMERS_TIMER_ACTION, "Timer Action", 1),
SafeAddString(SCHOLAR_TIMERS_TIMER_ACTION_TIP, "Set whether timers should fill or drain as they progress.", 1),
SafeAddString(SCHOLAR_TIMERS_LABEL_ALIGNMENT, "Label Alignment", 1),
SafeAddString(SCHOLAR_TIMERS_LABEL_ALIGNMENT_TIP, "Set whether you prefer timer labels to be right or left aligned.", 1),
SafeAddString(SCHOLAR_TIMERS_CL_BACKGROUND_COLOR, "Clothing Timers - Background", 1),
SafeAddString(SCHOLAR_TIMERS_CL_BACKGROUND_COLOR_TIP, "Set the color used for the background of clothing timer bars.", 1),
SafeAddString(SCHOLAR_TIMERS_CL_GLOSS_COLOR, "Clothing Timers - Gloss", 1),
SafeAddString(SCHOLAR_TIMERS_CL_GLOSS_COLOR_TIP, "Set the color used for the gloss (highlight) of clothing timer bars.", 1),
SafeAddString(SCHOLAR_TIMERS_SM_BACKGROUND_COLOR, "Smithing Timers - Background", 1),
SafeAddString(SCHOLAR_TIMERS_SM_BACKGROUND_COLOR_TIP, "Set the color used for the background of smithing timer bars.", 1),
SafeAddString(SCHOLAR_TIMERS_SM_GLOSS_COLOR, "Smithing Timers - Gloss", 1),
SafeAddString(SCHOLAR_TIMERS_SM_GLOSS_COLOR_TIP, "Set the color used for the gloss (highlight) of smithing timer bars.", 1),
SafeAddString(SCHOLAR_TIMERS_WW_BACKGROUND_COLOR, "Wood Working Timers - Background", 1),
SafeAddString(SCHOLAR_TIMERS_WW_BACKGROUND_COLOR_TIP, "Set the color used for the background of wood working timer bars.", 1),
SafeAddString(SCHOLAR_TIMERS_WW_GLOSS_COLOR, "Wood Working Timers - Gloss", 1),
SafeAddString(SCHOLAR_TIMERS_WW_GLOSS_COLOR_TIP, "Set the color used for the gloss (highlight) of wood working timer bars.", 1),
SafeAddString(SCHOLAR_TIMERS_SORT, "Sort Order", 1),
SafeAddString(SCHOLAR_TIMERS_SORT_TIP, "Set whether you prefer timers to be sorted by time left ascending or descending.", 1),
SafeAddString(SCHOLAR_TIMERS_LOCK_UI, "Lock UI", 1),
SafeAddString(SCHOLAR_TIMERS_LOCK_UI_TIP, "Enable this setting to prevent the timers window from being moved.", 1),
SafeAddString(SCHOLAR_TIMERS_SCALE, "UI Scale", 1),
SafeAddString(SCHOLAR_TIMERS_SCALE_TIP, "Set the scale ratio for the timer display.", 1),
SafeAddString(SCHOLAR_TIMERS_SPACING, "Timer Spacing", 1),
SafeAddString(SCHOLAR_TIMERS_SPACING_TIP, "Set the spacing between individual timers.", 1),
SafeAddString(SCHOLAR_TIMERS_HIDE_IN_COMBAT, "Hide While In Combat", 1),
SafeAddString(SCHOLAR_TIMERS_HIDE_IN_COMBAT_TIP, "Enable this setting to hide research timers while in combat.", 1),
SafeAddString(SCHOLAR_TIMERS_AUTOCLEAR, "Auto-Clear Timers", 1),
SafeAddString(SCHOLAR_TIMERS_AUTOCLEAR_TIP, "Enable this setting to automatically clear research timers when they are completed."
SafeAddString(SCHOLAR_TIMERS_AUTOCLEAR, "Auto-Clear Timers", 1),
SafeAddString(SCHOLAR_TIMERS_AUTOCLEAR_TIP, "Enable this setting to automatically clear research timers when they are completed.", 1),
SafeAddString(SCHOLAR_TIMERS_NOTIFICATIONS, "Notification Type", 1),
SafeAddString(SCHOLAR_TIMERS_NOTIFICATIONS_TIP, "Choose how notifications should be displayed when research completes.", 1),
SafeAddString(SCHOLAR_TIMERS_NOTIFICATION_SOUND, "Notification Sound", 1),
SafeAddString(SCHOLAR_TIMERS_NOTIFICATION_SOUND_TIP, "Choose the sound effect played when research completes.", 1),
SafeAddString(SCHOLAR_TIMERS_NOTIFICATION_SOUND_TEST, "Test Notification Sound", 1),
SafeAddString(SCHOLAR_TIMERS_NOTIFICATION_SOUND_TEST_TIP, "Click this button to test the currently selected notification sound.", 1),
SafeAddString(SCHOLAR_STABLE_TIMER_TITLE, "Stable Timer Settings", 1),
SafeAddString(SCHOLAR_STABLE_TIMER_DESCRIPTION, "The stable timer inherits its settings from the research timers, but the timer color can be independently configured for clarity.", 1),
SafeAddString(SCHOLAR_STABLE_TIMER_BACKGROUND_COLOR, "Background Color", 1),
SafeAddString(SCHOLAR_STABLE_TIMER_BACKGROUND_COLOR_TIP, "Set the color used for the background of the stable timer bar.", 1),
SafeAddString(SCHOLAR_STABLE_TIMER_GLOSS_COLOR, "Gloss Color", 1),
SafeAddString(SCHOLAR_STABLE_TIMER_GLOSS_COLOR_TIP, "Set the color used for the gloss (highlight) of the stable timer bar.", 1),
SafeAddString(SCHOLAR_STABLE_TIMER_LABEL, "Riding skill", 1),
SafeAddString(SCHOLAR_STABLE_TIMER_INVENTORY, "Carry Capacity", 1),
SafeAddString(SCHOLAR_STABLE_TIMER_STAMINA, "Stamina", 1),
SafeAddString(SCHOLAR_STABLE_TIMER_SPEED, "Speed", 1),
SafeAddString(SCHOLAR_STABLE_TIMER_UNKNOWN, "Unknown", 1),
SafeAddString(SCHOLAR_TRAIN_RIDING_SKILL, "Train riding skill in", 1),
SafeAddString(SCHOLAR_TIMERS_COMPLETED, "Completed training", 1),

-- Dropdown option strings
SafeAddString(SCHOLAR_OPTION_NONE, "None", 1),
SafeAddString(SCHOLAR_OPTION_CHAT, "Chat", 1),
SafeAddString(SCHOLAR_OPTION_ANNOUNCEMENT, "Announcement", 1),
SafeAddString(SCHOLAR_OPTION_LEFT, "Left", 1),
SafeAddString(SCHOLAR_OPTION_RIGHT, "Right", 1),
SafeAddString(SCHOLAR_OPTION_ASCENDING, "Ascending", 1),
SafeAddString(SCHOLAR_OPTION_DESCENDING, "Descending", 1),
SafeAddString(SCHOLAR_OPTION_BOLD, "Bold", 1),
SafeAddString(SCHOLAR_OPTION_MEDIUM, "Medium", 1),
SafeAddString(SCHOLAR_OPTION_ANTIQUE, "Antique", 1),
SafeAddString(SCHOLAR_OPTION_HANDWRITTEN, "Handwritten", 1),
SafeAddString(SCHOLAR_OPTION_STONE_TABLET, "Stone Tablet", 1),
SafeAddString(SCHOLAR_OPTION_GAMEPAD_BOLD, "Gamepad Bold", 1),
SafeAddString(SCHOLAR_OPTION_GAMEPAD_MEDIUM, "Gamepad Medium", 1),
SafeAddString(SCHOLAR_OPTION_ARIAL_NARROW, "Arial Narrow", 1),
SafeAddString(SCHOLAR_OPTION_SOFT_THICK_SHADOW, "Soft Thick Shadow", 1),
SafeAddString(SCHOLAR_OPTION_SOFT_THIN_SHADOW, "Soft Thin Shadow", 1),
SafeAddString(SCHOLAR_OPTION_SHADOW, "Shadow", 1),
SafeAddString(SCHOLAR_OPTION_THICK_OUTLINE, "Thick Outline", 1),
SafeAddString(SCHOLAR_OPTION_THIN_OUTLINE, "Thin Outline", 1),
SafeAddString(SCHOLAR_OPTION_OUTLINE, "Outline",
SafeAddString(SCHOLAR_OPTION_FILL, "Fill", 1),
SafeAddString(SCHOLAR_OPTION_DRAIN, "Drain", 1),

-- Crafting type abbreviations
SafeAddString(SCHOLAR_ABBR_BLACKSMITHING, "Bl", 1),
SafeAddString(SCHOLAR_ABBR_CLOTHING, "Cl", 1),
SafeAddString(SCHOLAR_ABBR_WOODWORKING, "Ww", 1),

-- Crafting trait abbreviations
SafeAddString(SCHOLAR_ABBR_POWERED, "Pwd", 1),
SafeAddString(SCHOLAR_ABBR_CHARGED, "Chg", 1),
SafeAddString(SCHOLAR_ABBR_PRECISE, "Pre", 1),
SafeAddString(SCHOLAR_ABBR_INFUSED, "Inf", 1),
SafeAddString(SCHOLAR_ABBR_DEFENDING, "Def", 1),
SafeAddString(SCHOLAR_ABBR_TRAINING, "Tra", 1),
SafeAddString(SCHOLAR_ABBR_SHARPENED, "Sha", 1),
SafeAddString(SCHOLAR_ABBR_DECISIVE, "Dec", 1),
SafeAddString(SCHOLAR_ABBR_STURDY , "Stu", 1),
SafeAddString(SCHOLAR_ABBR_IMPENETRABLE, "Imp", 1),
SafeAddString(SCHOLAR_ABBR_REINFORCED, "Ren", 1),
SafeAddString(SCHOLAR_ABBR_WELLFITTED, "Fit", 1),
SafeAddString(SCHOLAR_ABBR_PROSPEROUS, "Pro", 1),
SafeAddString(SCHOLAR_ABBR_DIVINES, "Div", 1),
SafeAddString(SCHOLAR_ABBR_NIRNHONED, "Nrn", 1),

-- Riding abbreviations
SafeAddString(SCHOLAR_ABBR_RIDING, "Ri", 1),
SafeAddString(SCHOLAR_ABBR_SPEED, "Spd", 1),
SafeAddString(SCHOLAR_ABBR_CAPACITY, "Cap", 1),
SafeAddString(SCHOLAR_ABBR_STAMINA, "Sta", 1),

SafeAddString(SCHOLAR_ABBR_UNKNOWN, "Unk", 1)
--]]

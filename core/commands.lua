-- Variables -------------------------------------------------------------------
Scholar_Slash_Commands = {}

local colorYellow     = "|cFFFF00"
local colorSoftYellow = "|cCCCC00"
local colorRed        = "|cFF0000"
local colorBlue       = "|c1155bb"
local colorWidget     = "|c1fda9a"

-- Initialize slash commands ---------------------------------------------------
function Scholar_Slash_Commands:Initialize(parent)
	SLASH_COMMANDS["/scholar"] = function(command)
		if command == "timers" then
			if parent.savedVariables.enable.timers or parent.savedVariables.enable.stableTimer then
				Scholar_Timers_Toggle()
			end
		else
			d(colorWidget .. "[Scholar] " .. colorYellow .. GetString(SCHOLAR_COMMANDS_VALID) .. ":")

			if parent.savedVariables.enable.timers or parent.savedVariables.enable.stableTimer then
				d(colorBlue .. "    /scholar timers" .. colorSoftYellow .. " - " .. GetString(SCHOLAR_COMMANDS_TIMERS))
			else
				d(colorRed .. GetString(SCHOLAR_COMMANDS_NONE))
			end
		end
	end
end

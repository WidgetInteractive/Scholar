Scholar_Fonts = {}

local NodeFonts = {
	[1] = {name = GetString(SCHOLAR_OPTION_BOLD), font = "BOLD_FONT"},
	[2] = {name = GetString(SCHOLAR_OPTION_MEDIUM), font = "MEDIUM_FONT"},
	[3] = {name = GetString(SCHOLAR_OPTION_CHAT), font = "CHAT_FONT"},
	[4] = {name = GetString(SCHOLAR_OPTION_ANTIQUE), font = "ANTIQUE_FONT"},
	[5] = {name = GetString(SCHOLAR_OPTION_HANDWRITTEN), font = "HANDWRITTEN_FONT"},
	[6] = {name = GetString(SCHOLAR_OPTION_STONE_TABLET), font = "STONE_TABLET_FONT"},
	[7] = {name = GetString(SCHOLAR_OPTION_GAMEPAD_BOLD), font = "GAMEPAD_BOLD_FONT"},
	[8] = {name = GetString(SCHOLAR_OPTION_GAMEPAD_MEDIUM), font = "GAMEPAD_MEDIUM_FONT"},
	[9] = {name = GetString(SCHOLAR_OPTION_ARIAL_NARROW), font = "univers55"},
}

function Scholar_Fonts:GetFontChoices()
	local choices = {}

	for k,v in ipairs(NodeFonts) do
		choices[#choices+1] = v.name
	end
	return choices
end

function Scholar_Fonts:GetFontByName(name)
	for k,v in ipairs(NodeFonts) do
		if v.name == name then
			return v.font
		end
	end
	return "ZoFontHeader"
end

-- Font outlines
local NodeOutlines = {
	[1] = {name = GetString(SCHOLAR_OPTION_NONE)},
	[2] = {name = GetString(SCHOLAR_OPTION_SOFT_THICK_SHADOW), outline = "soft-shadow-thick"},
	[3] = {name = GetString(SCHOLAR_OPTION_SOFT_THIN_SHADOW), outline = "soft-shadow-thin"},
	[4] = {name = GetString(SCHOLAR_OPTION_SHADOW), outline = "shadow"},
	[5] = {name = GetString(SCHOLAR_OPTION_THICK_OUTLINE), outline = "thick-outline"},
	[6] = {name = GetString(SCHOLAR_OPTION_THIN_OUTLINE), outline = "thin-outline"},
	[7] = {name = GetString(SCHOLAR_OPTION_OUTLINE), outline = "outline"}
}

function Scholar_Fonts:GetOutlineChoices()
	local choices = {}

	for k,v in ipairs(NodeOutlines) do
		choices[#choices+1] = v.name
	end
	return choices
end

function Scholar_Fonts:GetOutlineByName(outlineName)
	for k,v in ipairs(NodeOutlines) do
		if v.name == outlineName then
			return v.outline
		end
	end
end

-- Font string layout example: "$(BOLD_FONT)|30|soft-shadow-thick"
function Scholar_Fonts:Build(font, size, outline)
	local fontString = zo_strformat("$(<<1>>)|<<2>>", font, size)

	if outline then
		fontString = zo_strformat("<<1>>|<<2>>", fontString, outline)
	end

	return fontString
end

function Scholar_Fonts:GetTimerLabelFontString(parent)
	local font        = Scholar_Fonts:GetFontByName(parent.savedVariables.timers.labelFont)
	local fontOutline = Scholar_Fonts:GetOutlineByName(parent.savedVariables.timers.labelOutline)
	local fontSize    = parent.savedVariables.timers.labelSize

	return Scholar_Fonts:Build(font, fontSize, fontOutline)
end

function Scholar_Fonts:GetTimerTimeFontString(parent)
	local font        = Scholar_Fonts:GetFontByName(parent.savedVariables.timers.timeFont)
	local fontOutline = Scholar_Fonts:GetOutlineByName(parent.savedVariables.timers.timeOutline)
	local fontSize    = parent.savedVariables.timers.timeSize

	return Scholar_Fonts:Build(font, fontSize, fontOutline)
end

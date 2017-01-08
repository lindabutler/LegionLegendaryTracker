

LegionLegendaryTracker = {}
if not LLT_settings then
	LLT_settings = {}
	LLT_settings.gui = "show"

end

function LegionLegendaryTracker:OnLoad(self)
	DEFAULT_CHAT_FRAME:AddMessage("Legion Legendary Tracker Loaded - /LLT for options")
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("UPDATE_SHAPESHIFT_FORM")
	self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	SLASH_LLT1 = "/LLT"
  	SlashCmdList["LLT"] = function(msg) LegionLegendaryTracker:tracker_SlashCommandHandler(msg) end
end


function LegionLegendaryTracker:OnEvent(self, event, ...)
	if (event == "PLAYER_ENTERING_WORLD") then
		LegionLegendaryTracker:frametoggle()
	end
end

function LegionLegendaryTracker:processname(unitname)
	if (string.find(unitname, "-") == nil) then
		return unitname
	else
		return strsplit("-", unitname)
	end
end

function LegionLegendaryTracker:frametoggle()
    local frame1 = _G["LLT_F1"]
	local frame2 = _G["LLT_F2"]
	local frame3 = _G["LLT_F3"]
    local frame4 = _G["LLT_F4"]
    local frame5 = _G["LLT_F5"]
    local frame6 = _G["LLT_F6"]
    local frame7 = _G["LLT_F7"]
    local frame8 = _G["LLT_F8"]
    local frame9 = _G["LLT_F9"]
    local frame10 = _G["LLT_F10"]
    local frame11 = _G["LLT_F11"]
    local frame12 = _G["LLT_F12"]
    local frame13 = _G["LLT_F13"]
    local frame14 = _G["LLT_F14"]
    local frame15 = _G["LLT_F15"]
    local frame16 = _G["LLT_F16"]
    local frame17 = _G["LLT_F17"]
    local frame18 = _G["LLT_F18"]
    local frame19 = _G["LLT_F19"]
    local frame20 = _G["LLT_F20"]
	if (LLT_settings.gui == "show") then
		frame1:Show()
		frame2:Show()
        frame3:Show()
        frame4:Show()
        frame5:Show()
        frame5:Show()
        frame6:Show()
        frame7:Show()
        frame8:Show()
        frame9:Show()
        frame10:Show()
        frame11:Show()
        frame12:Show()
        frame13:Show()
        frame14:Show()
        frame15:Show()
        frame16:Show()
        frame17:Show()
        frame18:Show()
        frame19:Show()
        frame20:Show()
	else
		frame1:Hide()
		frame2:Hide()
		frame3:Hide()
        frame4:Hide()
        frame5:Hide()
		frame6:Hide()
		frame7:Hide()
		frame8:Hide()
        frame9:Hide()
        frame10:Hide()
        frame11:Hide()
		frame12:Hide()
		frame13:Hide()
        frame14:Hide()
        frame15:Hide()
        frame16:Hide()
		frame17:Hide()
		frame18:Hide()
        frame19:Hide()
        frame20:Hide()
    end
end


function LegionLegendaryTracker:tracker_SlashCommandHandler(msg)
	local frame1 = _G["LLT_F1"]
	if (msg == "gui" or msg == nil) then
		DEFAULT_CHAT_FRAME:AddMessage("Options are '/LLT gui show' or '/LLT gui hide'")
	elseif (msg == "gui show") then
		if(  frame1:IsVisible() ) then
     		DEFAULT_CHAT_FRAME:AddMessage("LLT Frame was already being displayed")
		else
			LLT_settings.gui = "show"
			DEFAULT_CHAT_FRAME:AddMessage("LLT Frame is now being displayed.")
		end
	elseif (msg == "gui hide") then
 		if(  frame1:IsVisible() ) then
			LLT_settings.gui = "hide" 
     		DEFAULT_CHAT_FRAME:AddMessage("LLT Frame is now hidden.")
		else
     		DEFAULT_CHAT_FRAME:AddMessage("LLT Frame was already hidden.")
		end
	else
		DEFAULT_CHAT_FRAME:AddMessage("Type '/LLT gui' for gui options.")
	end
	LegionLegendaryTracker:frametoggle()
end

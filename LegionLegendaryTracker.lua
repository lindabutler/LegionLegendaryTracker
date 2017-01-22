--local dungeon variables
local dungeonWrath
local dungeonThicket
local dungeonNeth
local dungeonValor
local dungeonViolet1
local dungeonViolet2
local dungeonVault
local dungeonBlackRook
local dungeonMaw
local dungeonArc
local dungeonCourt
--local dungeonKara

--local LLTisMythicPlusRun = 0 --tracking if player is in a mythic plus run

--local raid variables
local raidNythendra
local raidElerethe
local raidIlgynoth
local raidUrsoc
local raidDragons
local raidCenarius
local raidXavius
local raidOdyn
local raidGuarm
local raidHelya
local raidSkorpyron
local raidChronomatic
local raidTrilliax
local raidSpellblade
local raidStarAugur
local raidHighBot
local raidTichon
local raidKrosus
local raidGrandMag
local raidGuldan

--local totals
local normalDungeonBossCurrent
local heroicDungeonBossCurrent
local mythicDungeonBossCurrent
local LFRRaidBossCurrent
local normalRaidBossCurrent
local heroicRaidBossCurrent
local mythicRaidBossCurrent



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
    if (event == "COMBAT_LOG_EVENT_UNFILTERED") then
         _G["LLT_F2_Text"]:SetText("   dungeon bosses (normal): "..normalDungeonBossCurrent)
         _G["LLT_F3_Text"]:SetText("   dungeon bosses (heroic): "..heroicDungeonBossCurrent)
         _G["LLT_F4_Text"]:SetText("   dungeon bosses (mythic): TO DO")--..mythicDungeonBossCurrent)
         _G["LLT_F5_Text"]:SetText("   raid bosses (LFR): "..LFRRaidBossCurrent)
         _G["LLT_F6_Text"]:SetText("   raid bosses (normal): "..normalRaidBossCurrent)
         _G["LLT_F7_Text"]:SetText("   raid bosses (heroic): "..heroicRaidBossCurrent)
         _G["LLT_F8_Text"]:SetText("   raid bosses (mythic): "..mythicRaidBossCurrent)
--         _G["LLT_F18_Text"]:SetText("   total chances: "..)
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

function LegionLegendaryTracker:startInitialCount()

    LegionLegendaryTracker:findDungeonBossStatistics()
    print ("breakpoint1")
    LegionLegendaryTracker:findRaidBossStatistics() 
    print ("breakpoint2")
    
    normalDungeonBoss_Initial = normalDungeonBossCurrent
    heroicDungeonBoss_Initial = heroicDungeonBossCurrent
    mythicDungeonBoss_Initial = mythicDungeonBossCurrent
    LFRRaidBoss_Initial = LFRRaidBossCurrent
    normalRaidBoss_Initial = normalRaidBossCurrent
    heroicRaidBoss_Initial = heroicRaidBossCurrent
    mythicRaidBoss_Initial = mythicRaidBossCurrent
    --print("normalDungeonBoss_Initial :", normalDungeonBoss_Initial)

end

function LegionLegendaryTracker:findRaidBossStatistics()
    --calculate LFR raid boss kills (retrieve data from Statistics panel)
    raidNythendra = LegionLegendaryTracker:GetStatisticId("Legion", "Nythendra kills (Raid Finder Emerald Nightmare)")
    raidNythendra = GetStatistic(raidNythendra)
    raidElerethe = LegionLegendaryTracker:GetStatisticId("Legion", "Elerethe Renferal kills (Raid Finder Emerald Nightmare)")
    raidElerethe = GetStatistic(raidElerethe)
    raidIlgynoth = LegionLegendaryTracker:GetStatisticId("Legion", "Il'gynoth kills (Raid Finder Emerald Nightmare)")
    raidIlgynoth = GetStatistic(raidIlgynoth)
    raidUrsoc = LegionLegendaryTracker:GetStatisticId("Legion", "Ursoc kills (Raid Finder Emerald Nightmare)")
    raidUrsoc = GetStatistic(raidUrsoc)
    raidDragons = LegionLegendaryTracker:GetStatisticId("Legion", "Dragons of Nightmare kills (Raid Finder Emerald Nightmare)")
    raidDragons = GetStatistic(raidDragons)
    raidCenarius = LegionLegendaryTracker:GetStatisticId("Legion", "Cenarius redemptions (Raid Finder Emerald Nightmare)")
    raidCenarius = GetStatistic(raidCenarius)
    raidXavius = LegionLegendaryTracker:GetStatisticId("Legion", "Xavius kills (Raid Finder Emerald Nightmare)")
    raidXavius = GetStatistic(raidXavius)
    raidOdyn = LegionLegendaryTracker:GetStatisticId("Legion", "Odyn defeats (Raid Finder Trial of Valor)")
    raidOdyn = GetStatistic(raidOdyn)
    raidGuarm = LegionLegendaryTracker:GetStatisticId("Legion", "Guarm kills (Raid Finder Trial of Valor)")
    raidGuarm = GetStatistic(raidGuarm)
    raidHelya = LegionLegendaryTracker:GetStatisticId("Legion", "Helya kills (Raid Finder Trial of Valor)")
    raidHelya = GetStatistic(raidHelya)
    raidSkorpyron = LegionLegendaryTracker:GetStatisticId("Legion", "Skorpyron kills (Raid Finder Nighthold)")
    raidSkorpyron = GetStatistic(raidSkorpyron)
    raidChronomatic = LegionLegendaryTracker:GetStatisticId("Legion", "Chronomatic Anomaly kills (Raid Finder Nighthold)")
    raidChronomatic = GetStatistic(raidChronomatic)
    raidTrilliax = LegionLegendaryTracker:GetStatisticId("Legion", "Trilliax kills (Raid Finder Nighthold)")
    raidTrilliax = GetStatistic(raidTrilliax)
    raidSpellblade = LegionLegendaryTracker:GetStatisticId("Legion", "Spellblade Aluriel kills (Raid Finder Nighthold)")
    raidSpellblade = GetStatistic(raidSpellblade)
    raidStarAugur = LegionLegendaryTracker:GetStatisticId("Legion", "Star Augur Etraeus kills (Raid Finder Nighthold)")
    raidStarAugur = GetStatistic(raidStarAugur)
    raidHighBot = LegionLegendaryTracker:GetStatisticId("Legion", "High Botanist Tel'arn kills (Raid Finder Nighthold)")
    raidHighBot = GetStatistic(raidHighBot)
    raidTichon = LegionLegendaryTracker:GetStatisticId("Legion", "Tichondrius kills (Raid Finder Nighthold)")
    raidTichon = GetStatistic(raidTichon)
    raidKrosus = LegionLegendaryTracker:GetStatisticId("Legion", "Krosus kills (Raid Finder Nighthold)")
    raidKrosus = GetStatistic(raidKrosus)
    raidGrandMag = LegionLegendaryTracker:GetStatisticId("Legion", "Grand Magistrix Elisande kills (Raid Finder Nighthold)")
    raidGrandMag = GetStatistic(raidGrandMag)
    raidGuldan = LegionLegendaryTracker:GetStatisticId("Legion", "Gul'dan kills (Raid Finder Nighthold)")
    raidGuldan = GetStatistic(raidGuldan)
    --if any kills are "--" (nil), set their value to zero
    if (raidNythendra == "--")      then raidNythendra = 0      end
    if (raidElerethe == "--")       then raidElerethe = 0       end
    if (raidIlgynoth == "--")       then raidIlgynoth = 0       end
    if (raidUrsoc == "--")          then raidUrsoc = 0          end
    if (raidDragons == "--")        then raidDragons = 0        end
    if (raidCenarius == "--")       then raidCenarius = 0       end
    if (raidXavius == "--")         then raidXavius = 0         end
    if (raidOdyn == "--")           then raidOdyn = 0           end
    if (raidGuarm == "--")          then raidGuarm = 0          end
    if (raidHelya == "--")          then raidHelya = 0          end
    if (raidSkorpyron == "--")      then raidSkorpyron = 0      end
    if (raidChronomatic == "--")    then raidChronomatic = 0    end
    if (raidTrilliax == "--")       then raidTrilliax = 0       end
    if (raidSpellblade == "--")     then raidSpellblade = 0     end
    if (raidStarAugur == "--")      then raidStarAugur = 0      end
    if (raidHighBot == "--")        then raidHighBot = 0        end
    if (raidTichon == "--")         then raidTichon = 0         end
    if (raidKrosus == "--")         then raidKrosus = 0         end
    if (raidGrandMag == "--")       then raidGrandMag = 0       end
    if (raidGuldan == "--")         then raidGuldan = 0         end
    --add up total LFR raidboss kills 
    LFRRaidBossCurrent = (raidNythendra + raidElerethe + raidIlgynoth + raidUrsoc + raidDragons + raidCenarius + raidXavius + raidOdyn + raidGuarm + raidHelya + raidSkorpyron + raidChronomatic + raidTrilliax + raidSpellblade + raidStarAugur + raidHighBot + raidTichon + raidKrosus + raidGrandMag + raidGuldan)

    --calculate normal raid boss kills (retrieve data from Statistics panel)
    raidNythendra = LegionLegendaryTracker:GetStatisticId("Legion", "Nythendra kills (Normal Emerald Nightmare)")
    raidNythendra = GetStatistic(raidNythendra)
    raidElerethe = LegionLegendaryTracker:GetStatisticId("Legion", "Elerethe Renferal kills (Normal Emerald Nightmare)")
    raidElerethe = GetStatistic(raidElerethe)
    raidIlgynoth = LegionLegendaryTracker:GetStatisticId("Legion", "Il'gynoth kills (Normal Emerald Nightmare)")
    raidIlgynoth = GetStatistic(raidIlgynoth)
    raidUrsoc = LegionLegendaryTracker:GetStatisticId("Legion", "Ursoc kills (Normal Emerald Nightmare)")
    raidUrsoc = GetStatistic(raidUrsoc)
    raidDragons = LegionLegendaryTracker:GetStatisticId("Legion", "Dragons of Nightmare kills (Normal Emerald Nightmare)")
    raidDragons = GetStatistic(raidDragons)
    raidCenarius = LegionLegendaryTracker:GetStatisticId("Legion", "Cenarius redemptions (Normal Emerald Nightmare)")
    raidCenarius = GetStatistic(raidCenarius)
    raidXavius = LegionLegendaryTracker:GetStatisticId("Legion", "Xavius kills (Normal Emerald Nightmare)")
    raidXavius = GetStatistic(raidXavius)
    raidOdyn = LegionLegendaryTracker:GetStatisticId("Legion", "Odyn defeats (Normal Trial of Valor)")
    raidOdyn = GetStatistic(raidOdyn)
    raidGuarm = LegionLegendaryTracker:GetStatisticId("Legion", "Guarm kills (Normal Trial of Valor)")
    raidGuarm = GetStatistic(raidGuarm)
    raidHelya = LegionLegendaryTracker:GetStatisticId("Legion", "Helya kills (Normal Trial of Valor)")
    raidHelya = GetStatistic(raidHelya)
    raidSkorpyron = LegionLegendaryTracker:GetStatisticId("Legion", "Skorpyron kills (Normal Nighthold)")
    raidSkorpyron = GetStatistic(raidSkorpyron)
    raidChronomatic = LegionLegendaryTracker:GetStatisticId("Legion", "Chronomatic Anomaly kills (Normal Nighthold)")
    raidChronomatic = GetStatistic(raidChronomatic)
    raidTrilliax = LegionLegendaryTracker:GetStatisticId("Legion", "Trilliax kills (Normal Nighthold)")
    raidTrilliax = GetStatistic(raidTrilliax)
    raidSpellblade = LegionLegendaryTracker:GetStatisticId("Legion", "Spellblade Aluriel kills (Normal Nighthold)")
    raidSpellblade = GetStatistic(raidSpellblade)
    raidStarAugur = LegionLegendaryTracker:GetStatisticId("Legion", "Star Augur Etraeus kills (Normal Nighthold)")
    raidStarAugur = GetStatistic(raidStarAugur)
    raidHighBot = LegionLegendaryTracker:GetStatisticId("Legion", "High Botanist Tel'arn kills (Normal Nighthold)")
    raidHighBot = GetStatistic(raidHighBot)
    raidTichon = LegionLegendaryTracker:GetStatisticId("Legion", "Tichondrius kills (Normal Nighthold)")
    raidTichon = GetStatistic(raidTichon)
    raidKrosus = LegionLegendaryTracker:GetStatisticId("Legion", "Krosus kills (Normal Nighthold)")
    raidKrosus = GetStatistic(raidKrosus)
    raidGrandMag = LegionLegendaryTracker:GetStatisticId("Legion", "Grand Magistrix Elisande kills (Normal Nighthold)")
    raidGrandMag = GetStatistic(raidGrandMag)
    raidGuldan = LegionLegendaryTracker:GetStatisticId("Legion", "Gul'dan kills (Normal Nighthold)")
    raidGuldan = GetStatistic(raidGuldan)
    --if any kills are "--" (nil), set their value to zero
    if (raidNythendra == "--")      then raidNythendra = 0      end
    if (raidElerethe == "--")       then raidElerethe = 0       end
    if (raidIlgynoth == "--")       then raidIlgynoth = 0       end
    if (raidUrsoc == "--")          then raidUrsoc = 0          end
    if (raidDragons == "--")        then raidDragons = 0        end
    if (raidCenarius == "--")       then raidCenarius = 0       end
    if (raidXavius == "--")         then raidXavius = 0         end
    if (raidOdyn == "--")           then raidOdyn = 0           end
    if (raidGuarm == "--")          then raidGuarm = 0          end
    if (raidHelya == "--")          then raidHelya = 0          end
    if (raidSkorpyron == "--")      then raidSkorpyron = 0      end
    if (raidChronomatic == "--")    then raidChronomatic = 0    end
    if (raidTrilliax == "--")       then raidTrilliax = 0       end
    if (raidSpellblade == "--")     then raidSpellblade = 0     end
    if (raidStarAugur == "--")      then raidStarAugur = 0      end
    if (raidHighBot == "--")        then raidHighBot = 0        end
    if (raidTichon == "--")         then raidTichon = 0         end
    if (raidKrosus == "--")         then raidKrosus = 0         end
    if (raidGrandMag == "--")       then raidGrandMag = 0       end
    if (raidGuldan == "--")         then raidGuldan = 0         end
    --add up total normal raidboss kills 
    normalRaidBossCurrent = (raidNythendra + raidElerethe + raidIlgynoth + raidUrsoc + raidDragons + raidCenarius + raidXavius + raidOdyn + raidGuarm + raidHelya + raidSkorpyron + raidChronomatic + raidTrilliax + raidSpellblade + raidStarAugur + raidHighBot + raidTichon + raidKrosus + raidGrandMag + raidGuldan)

    --calculate heroic raid boss kills (retrieve data from Statistics panel)
    raidNythendra = LegionLegendaryTracker:GetStatisticId("Legion", "Nythendra kills (Heroic Emerald Nightmare)")
    raidNythendra = GetStatistic(raidNythendra)
    raidElerethe = LegionLegendaryTracker:GetStatisticId("Legion", "Elerethe Renferal kills (Heroic Emerald Nightmare)")
    raidElerethe = GetStatistic(raidElerethe)
    raidIlgynoth = LegionLegendaryTracker:GetStatisticId("Legion", "Il'gynoth kills (Heroic Emerald Nightmare)")
    raidIlgynoth = GetStatistic(raidIlgynoth)
    raidUrsoc = LegionLegendaryTracker:GetStatisticId("Legion", "Ursoc kills (Heroic Emerald Nightmare)")
    raidUrsoc = GetStatistic(raidUrsoc)
    raidDragons = LegionLegendaryTracker:GetStatisticId("Legion", "Dragons of Nightmare kills (Heroic Emerald Nightmare)")
    raidDragons = GetStatistic(raidDragons)
    raidCenarius = LegionLegendaryTracker:GetStatisticId("Legion", "Cenarius redemptions (Heroic Emerald Nightmare)")
    raidCenarius = GetStatistic(raidCenarius)
    raidXavius = LegionLegendaryTracker:GetStatisticId("Legion", "Xavius kills (Heroic Emerald Nightmare)")
    raidXavius = GetStatistic(raidXavius)
    raidOdyn = LegionLegendaryTracker:GetStatisticId("Legion", "Odyn defeats (Heroic Trial of Valor)")
    raidOdyn = GetStatistic(raidOdyn)
    raidGuarm = LegionLegendaryTracker:GetStatisticId("Legion", "Guarm kills (Heroic Trial of Valor)")
    raidGuarm = GetStatistic(raidGuarm)
    raidHelya = LegionLegendaryTracker:GetStatisticId("Legion", "Helya kills (Heroic Trial of Valor)")
    raidHelya = GetStatistic(raidHelya)
    raidSkorpyron = LegionLegendaryTracker:GetStatisticId("Legion", "Skorpyron kills (Heroic Nighthold)")
    raidSkorpyron = GetStatistic(raidSkorpyron)
    raidChronomatic = LegionLegendaryTracker:GetStatisticId("Legion", "Chronomatic Anomaly kills (Heroic Nighthold)")
    raidChronomatic = GetStatistic(raidChronomatic)
    raidTrilliax = LegionLegendaryTracker:GetStatisticId("Legion", "Trilliax kills (Heroic Nighthold)")
    raidTrilliax = GetStatistic(raidTrilliax)
    raidSpellblade = LegionLegendaryTracker:GetStatisticId("Legion", "Spellblade Aluriel kills (Heroic Nighthold)")
    raidSpellblade = GetStatistic(raidSpellblade)
    raidStarAugur = LegionLegendaryTracker:GetStatisticId("Legion", "Star Augur Etraeus kills (Heroic Nighthold)")
    raidStarAugur = GetStatistic(raidStarAugur)
    raidHighBot = LegionLegendaryTracker:GetStatisticId("Legion", "High Botanist Tel'arn kills (Heroic Nighthold)")
    raidHighBot = GetStatistic(raidHighBot)
    raidTichon = LegionLegendaryTracker:GetStatisticId("Legion", "Tichondrius kills (Heroic Nighthold)")
    raidTichon = GetStatistic(raidTichon)
    raidKrosus = LegionLegendaryTracker:GetStatisticId("Legion", "Krosus kills (Heroic Nighthold)")
    raidKrosus = GetStatistic(raidKrosus)
    raidGrandMag = LegionLegendaryTracker:GetStatisticId("Legion", "Grand Magistrix Elisande kills (Heroic Nighthold)")
    raidGrandMag = GetStatistic(raidGrandMag)
    raidGuldan = LegionLegendaryTracker:GetStatisticId("Legion", "Gul'dan kills (Heroic Nighthold)")
    raidGuldan = GetStatistic(raidGuldan)
    --if any kills are "--" (nil), set their value to zero
    if (raidNythendra == "--")      then raidNythendra = 0      end
    if (raidElerethe == "--")       then raidElerethe = 0       end
    if (raidIlgynoth == "--")       then raidIlgynoth = 0       end
    if (raidUrsoc == "--")          then raidUrsoc = 0          end
    if (raidDragons == "--")        then raidDragons = 0        end
    if (raidCenarius == "--")       then raidCenarius = 0       end
    if (raidXavius == "--")         then raidXavius = 0         end
    if (raidOdyn == "--")           then raidOdyn = 0           end
    if (raidGuarm == "--")          then raidGuarm = 0          end
    if (raidHelya == "--")          then raidHelya = 0          end
    if (raidSkorpyron == "--")      then raidSkorpyron = 0      end
    if (raidChronomatic == "--")    then raidChronomatic = 0    end
    if (raidTrilliax == "--")       then raidTrilliax = 0       end
    if (raidSpellblade == "--")     then raidSpellblade = 0     end
    if (raidStarAugur == "--")      then raidStarAugur = 0      end
    if (raidHighBot == "--")        then raidHighBot = 0        end
    if (raidTichon == "--")         then raidTichon = 0         end
    if (raidKrosus == "--")         then raidKrosus = 0         end
    if (raidGrandMag == "--")       then raidGrandMag = 0       end
    if (raidGuldan == "--")         then raidGuldan = 0         end
    --add up total Heroic raidboss kills 
    heroicRaidBossCurrent = (raidNythendra + raidElerethe + raidIlgynoth + raidUrsoc + raidDragons + raidCenarius + raidXavius + raidOdyn + raidGuarm + raidHelya + raidSkorpyron + raidChronomatic + raidTrilliax + raidSpellblade + raidStarAugur + raidHighBot + raidTichon + raidKrosus + raidGrandMag + raidGuldan)

    --calculate mythic raid boss kills (retrieve data from Statistics panel)
    raidNythendra = LegionLegendaryTracker:GetStatisticId("Legion", "Nythendra kills (Mythic Emerald Nightmare)")
    raidNythendra = GetStatistic(raidNythendra)
    raidElerethe = LegionLegendaryTracker:GetStatisticId("Legion", "Elerethe Renferal kills (Mythic Emerald Nightmare)")
    raidElerethe = GetStatistic(raidElerethe)
    raidIlgynoth = LegionLegendaryTracker:GetStatisticId("Legion", "Il'gynoth kills (Mythic Emerald Nightmare)")
    raidIlgynoth = GetStatistic(raidIlgynoth)
    raidUrsoc = LegionLegendaryTracker:GetStatisticId("Legion", "Ursoc kills (Mythic Emerald Nightmare)")
    raidUrsoc = GetStatistic(raidUrsoc)
    raidDragons = LegionLegendaryTracker:GetStatisticId("Legion", "Dragons of Nightmare kills (Mythic Emerald Nightmare)")
    raidDragons = GetStatistic(raidDragons)
    raidCenarius = LegionLegendaryTracker:GetStatisticId("Legion", "Cenarius redemptions (Mythic Emerald Nightmare)")
    raidCenarius = GetStatistic(raidCenarius)
    raidXavius = LegionLegendaryTracker:GetStatisticId("Legion", "Xavius kills (Mythic Emerald Nightmare)")
    raidXavius = GetStatistic(raidXavius)
    raidOdyn = LegionLegendaryTracker:GetStatisticId("Legion", "Odyn defeats (Mythic Trial of Valor)")
    raidOdyn = GetStatistic(raidOdyn)
    raidGuarm = LegionLegendaryTracker:GetStatisticId("Legion", "Guarm kills (Mythic Trial of Valor)")
    raidGuarm = GetStatistic(raidGuarm)
    raidHelya = LegionLegendaryTracker:GetStatisticId("Legion", "Helya kills (Mythic Trial of Valor)")
    raidHelya = GetStatistic(raidHelya)
    raidSkorpyron = LegionLegendaryTracker:GetStatisticId("Legion", "Skorpyron kills (Mythic Nighthold)")
    raidSkorpyron = GetStatistic(raidSkorpyron)
    raidChronomatic = LegionLegendaryTracker:GetStatisticId("Legion", "Chronomatic Anomaly kills (Mythic Nighthold)")
    raidChronomatic = GetStatistic(raidChronomatic)
    raidTrilliax = LegionLegendaryTracker:GetStatisticId("Legion", "Trilliax kills (Mythic Nighthold)")
    raidTrilliax = GetStatistic(raidTrilliax)
    raidSpellblade = LegionLegendaryTracker:GetStatisticId("Legion", "Spellblade Aluriel kills (Mythic Nighthold)")
    raidSpellblade = GetStatistic(raidSpellblade)
    raidStarAugur = LegionLegendaryTracker:GetStatisticId("Legion", "Star Augur Etraeus kills (Mythic Nighthold)")
    raidStarAugur = GetStatistic(raidStarAugur)
    raidHighBot = LegionLegendaryTracker:GetStatisticId("Legion", "High Botanist Tel'arn kills (Mythic Nighthold)")
    raidHighBot = GetStatistic(raidHighBot)
    raidTichon = LegionLegendaryTracker:GetStatisticId("Legion", "Tichondrius kills (Mythic Nighthold)")
    raidTichon = GetStatistic(raidTichon)
    raidKrosus = LegionLegendaryTracker:GetStatisticId("Legion", "Krosus kills (Mythic Nighthold)")
    raidKrosus = GetStatistic(raidKrosus)
    raidGrandMag = LegionLegendaryTracker:GetStatisticId("Legion", "Grand Magistrix Elisande kills (Mythic Nighthold)")
    raidGrandMag = GetStatistic(raidGrandMag)
    raidGuldan = LegionLegendaryTracker:GetStatisticId("Legion", "Gul'dan kills (Mythic Nighthold)")
    raidGuldan = GetStatistic(raidGuldan)
    --if any kills are "--" (nil), set their value to zero
    if (raidNythendra == "--")      then raidNythendra = 0      end
    if (raidElerethe == "--")       then raidElerethe = 0       end
    if (raidIlgynoth == "--")       then raidIlgynoth = 0       end
    if (raidUrsoc == "--")          then raidUrsoc = 0          end
    if (raidDragons == "--")        then raidDragons = 0        end
    if (raidCenarius == "--")       then raidCenarius = 0       end
    if (raidXavius == "--")         then raidXavius = 0         end
    if (raidOdyn == "--")           then raidOdyn = 0           end
    if (raidGuarm == "--")          then raidGuarm = 0          end
    if (raidHelya == "--")          then raidHelya = 0          end
    if (raidSkorpyron == "--")      then raidSkorpyron = 0      end
    if (raidChronomatic == "--")    then raidChronomatic = 0    end
    if (raidTrilliax == "--")       then raidTrilliax = 0       end
    if (raidSpellblade == "--")     then raidSpellblade = 0     end
    if (raidStarAugur == "--")      then raidStarAugur = 0      end
    if (raidHighBot == "--")        then raidHighBot = 0        end
    if (raidTichon == "--")         then raidTichon = 0         end
    if (raidKrosus == "--")         then raidKrosus = 0         end
    if (raidGrandMag == "--")       then raidGrandMag = 0       end
    if (raidGuldan == "--")         then raidGuldan = 0         end
    --add up total mythic raidboss kills 
    mythicRaidBossCurrent = (raidNythendra + raidElerethe + raidIlgynoth + raidUrsoc + raidDragons + raidCenarius + raidXavius + raidOdyn + raidGuarm + raidHelya + raidSkorpyron + raidChronomatic + raidTrilliax + raidSpellblade + raidStarAugur + raidHighBot + raidTichon + raidKrosus + raidGrandMag + raidGuldan)
    
end


function LegionLegendaryTracker:findDungeonBossStatistics() 
    --calculate normal boss kills (retrieve data from Statistics panel)
    dungeonWrath = LegionLegendaryTracker:GetStatisticId("Legion", "Wrath of Azshara kills (Normal Eye of Azshara)")
    dungeonWrath = GetStatistic(dungeonWrath)
    dungeonThicket = LegionLegendaryTracker:GetStatisticId("Legion", "Shade of Xavius kills (Normal Darkheart Thicket)")
    dungeonThicket = GetStatistic(dungeonThicket)
    dungeonNeth = LegionLegendaryTracker:GetStatisticId("Legion", "Dargrul kills (Normal Neltharion's Lair)")
    dungeonNeth = GetStatistic(dungeonNeth)
    dungeonValor = LegionLegendaryTracker:GetStatisticId("Legion", "Odyn defeats (Normal Halls of Valor)")
    dungeonValor = GetStatistic(dungeonValor)
    dungeonViolet1 = LegionLegendaryTracker:GetStatisticId("Legion", "Fel Lord Betrug kills (Normal Assault on Violet Hold)")
    dungeonViolet1 = GetStatistic(dungeonViolet1)
    dungeonViolet2 = LegionLegendaryTracker:GetStatisticId("Legion", "Sael'orn kills (Normal Assault on Violet Hold)")
    dungeonViolet2 = GetStatistic(dungeonViolet2)
    dungeonVault = LegionLegendaryTracker:GetStatisticId("Legion", "Cordana Felsong kills (Normal Vault of the Wardens)")
    dungeonVault = GetStatistic(dungeonVault)
    dungeonBlackRook = LegionLegendaryTracker:GetStatisticId("Legion", "Kur'talos Ravencrest defeats (Normal Black Rook Hold)")
    dungeonBlackRook = GetStatistic(dungeonBlackRook)
    dungeonMaw  = LegionLegendaryTracker:GetStatisticId("Legion", "Helya defeats (Normal Maw of Souls)")
    dungeonMaw = GetStatistic(dungeonMaw)
    --if any kills are "--" or nil, set their value to zero
    if (dungeonWrath == "--")       then dungeonWrath = 0       end
    if (dungeonThicket == "--")     then dungeonThicket = 0     end
    if (dungeonNeth == "--")        then dungeonNeth = 0        end
    if (dungeonValor == "--")       then dungeonValor = 0       end
    if (dungeonViolet1 == "--")     then dungeonViolet1 = 0     end
    if (dungeonViolet2 == "--")     then dungeonViolet2 = 0     end
    if (dungeonVault == "--")       then dungeonVault = 0       end
    if (dungeonBlackRook == "--")   then dungeonBlackRook = 0   end
    if (dungeonMaw == "--")         then dungeonMaw = 0         end
    --add up total normal boss kills (number of times end boss is killed * number of bosses in instance)
    normalDungeonBossCurrent = (dungeonWrath*3 + dungeonThicket*4 + dungeonNeth*4 + dungeonValor*5 + dungeonViolet1*3 + dungeonViolet2*3 + dungeonVault*5 + dungeonBlackRook*4 + dungeonMaw*3)
    --print("normalDungeonBossCurrent :", normalDungeonBossCurrent)
    
    --calculate heroic boss kills (retrieve data from Statistics panel)
    dungeonWrath = LegionLegendaryTracker:GetStatisticId("Legion", "Wrath of Azshara kills (Heroic Eye of Azshara)")
    dungeonWrath = GetStatistic(dungeonWrath)
    dungeonThicket = LegionLegendaryTracker:GetStatisticId("Legion", "Shade of Xavius kills (Heroic Darkheart Thicket)")
    dungeonThicket = GetStatistic(dungeonThicket)
    dungeonNeth = LegionLegendaryTracker:GetStatisticId("Legion", "Dargrul kills (Heroic Neltharion's Lair)")
    dungeonNeth = GetStatistic(dungeonNeth)
    dungeonValor = LegionLegendaryTracker:GetStatisticId("Legion", "Odyn defeats (Heroic Halls of Valor)")
    dungeonValor = GetStatistic(dungeonValor)
    dungeonViolet1 = LegionLegendaryTracker:GetStatisticId("Legion", "Fel Lord Betrug kills (Heroic Assault on Violet Hold)")
    dungeonViolet1 = GetStatistic(dungeonViolet1)
    dungeonViolet2 = LegionLegendaryTracker:GetStatisticId("Legion", "Sael'orn kills (Heroic Assault on Violet Hold)")
    dungeonViolet2 = GetStatistic(dungeonViolet2)
    dungeonVault = LegionLegendaryTracker:GetStatisticId("Legion", "Cordana Felsong kills (Heroic Vault of the Wardens)")
    dungeonVault = GetStatistic(dungeonVault)
    dungeonBlackRook = LegionLegendaryTracker:GetStatisticId("Legion", "Kur'talos Ravencrest defeats (Heroic Black Rook Hold)")
    dungeonBlackRook = GetStatistic(dungeonBlackRook)
    dungeonMaw  = LegionLegendaryTracker:GetStatisticId("Legion", "Helya defeats (Heroic Maw of Souls)")
    dungeonMaw = GetStatistic(dungeonMaw)
    --if any kills are "--" or nil, set their value to zero
    if (dungeonWrath == "--")       then dungeonWrath = 0       end
    if (dungeonThicket == "--")     then dungeonThicket = 0     end
    if (dungeonNeth == "--")        then dungeonNeth = 0        end
    if (dungeonValor == "--")       then dungeonValor = 0       end
    if (dungeonViolet1 == "--")     then dungeonViolet1 = 0     end
    if (dungeonViolet2 == "--")     then dungeonViolet2 = 0     end
    if (dungeonVault == "--")       then dungeonVault = 0       end
    if (dungeonBlackRook == "--")   then dungeonBlackRook = 0   end
    if (dungeonMaw == "--")         then dungeonMaw = 0         end
    --add up total heroic boss kills (number of times end boss is killed * number of bosses in instance)
    heroicDungeonBossCurrent = (dungeonWrath*3 + dungeonThicket*4 + dungeonNeth*4 + dungeonValor*5 + dungeonViolet1*3 + dungeonViolet2*3 + dungeonVault*5 + dungeonBlackRook*4 + dungeonMaw*3)
    --print("heroicDungeonBossCurrent :", heroicDungeonBossCurrent)
    
    --calculate mythic boss kills (retrieve data from Statistics panel)
    dungeonWrath = LegionLegendaryTracker:GetStatisticId("Legion", "Wrath of Azshara kills (Mythic Eye of Azshara)")
    dungeonWrath = GetStatistic(dungeonWrath)
    dungeonThicket = LegionLegendaryTracker:GetStatisticId("Legion", "Shade of Xavius kills (Mythic Darkheart Thicket)")
    dungeonThicket = GetStatistic(dungeonThicket)
    dungeonNeth = LegionLegendaryTracker:GetStatisticId("Legion", "Dargrul kills (Mythic Neltharion's Lair)")
    dungeonNeth = GetStatistic(dungeonNeth)
    dungeonValor = LegionLegendaryTracker:GetStatisticId("Legion", "Odyn defeats (Mythic Halls of Valor)")
    dungeonValor = GetStatistic(dungeonValor)
    dungeonViolet1 = LegionLegendaryTracker:GetStatisticId("Legion", "Fel Lord Betrug kills (Mythic Assault on Violet Hold)")
    dungeonViolet1 = GetStatistic(dungeonViolet1)
    dungeonViolet2 = LegionLegendaryTracker:GetStatisticId("Legion", "Sael'orn kills (Mythic Assault on Violet Hold)")
    dungeonViolet2 = GetStatistic(dungeonViolet2)
    dungeonVault = LegionLegendaryTracker:GetStatisticId("Legion", "Cordana Felsong kills (Mythic Vault of the Wardens)")
    dungeonVault = GetStatistic(dungeonVault)
    dungeonBlackRook = LegionLegendaryTracker:GetStatisticId("Legion", "Kur'talos Ravencrest defeats (Mythic Black Rook Hold)")
    dungeonBlackRook = GetStatistic(dungeonBlackRook)
    dungeonMaw  = LegionLegendaryTracker:GetStatisticId("Legion", "Helya defeats (Mythic Maw of Souls)")
    dungeonMaw = GetStatistic(dungeonMaw)
    dungeonArc  = LegionLegendaryTracker:GetStatisticId("Legion", "Advisor Vandros kills (Mythic Arcway)")
    dungeonArc = GetStatistic(dungeonArc)
    dungeonCourt  = LegionLegendaryTracker:GetStatisticId("Legion", "Advisor Melandrus kills (Mythic Court of Stars)")
    dungeonCourt = GetStatistic(dungeonCourt)
    --if any kills are "--" or nil, set their value to zero
    if (dungeonWrath == "--")       then dungeonWrath = 0       end
    if (dungeonThicket == "--")     then dungeonThicket = 0     end
    if (dungeonNeth == "--")        then dungeonNeth = 0        end
    if (dungeonValor == "--")       then dungeonValor = 0       end
    if (dungeonViolet1 == "--")     then dungeonViolet1 = 0     end
    if (dungeonViolet2 == "--")     then dungeonViolet2 = 0     end
    if (dungeonVault == "--")       then dungeonVault = 0       end
    if (dungeonBlackRook == "--")   then dungeonBlackRook = 0   end
    if (dungeonMaw == "--")         then dungeonMaw = 0         end
    if (dungeonArc == "--")         then dungeonArc = 0         end
    if (dungeonCourt == "--")       then dungeonCourt = 0       end
    --add up total heroic boss kills (number of times end boss is killed * number of bosses in instance)
    mythicDungeonBossCurrent = (dungeonWrath*3 + dungeonThicket*4 + dungeonNeth*4 + dungeonValor*5 + dungeonViolet1*3 + dungeonViolet2*3 + dungeonVault*5 + dungeonBlackRook*4 + dungeonMaw*3 + dungeonArc*5 + dungeonCourt*3)
    --print("mythicDungeonBossCurrent :", mythicDungeonBossCurrent)
end

--local inChallengeMode = (scenarioType == LE_SCENARIO_TYPE_CHALLENGE_MODE);

--function checkIfMythicPlusRun()
--    if (event == "CHALLENGE_MODE_START") then
--        LLTisMythicPlusRun = 1
--    end
--    if (event == "CHALLENGE_MODE_COMPLETED") then
--        LLTisMythicPlusRun = 0
--        mythicPlusesCompletedCount = mythicPlusesCompletedCount + 1
--    end
--end
    

--Function to get statistic information from blizzard's statistic panel.
function LegionLegendaryTracker:GetStatisticId(CategoryTitle, StatisticTitle)
	local str = ""
	for _, CategoryId in pairs(GetStatisticsCategoryList()) do
		local Title, ParentCategoryId, Something
		Title, ParentCategoryId, Something = GetCategoryInfo(CategoryId)
		
		if Title == CategoryTitle then
			local i
			local statisticCount = GetCategoryNumAchievements(CategoryId)
			for i = 1, statisticCount do
				local IDNumber, Name, Points, Completed, Month, Day, Year, Description, Flags, Image, RewardText
				IDNumber, Name, Points, Completed, Month, Day, Year, Description, Flags, Image, RewardText = GetAchievementInfo(CategoryId, i)
				if Name == StatisticTitle then
					return IDNumber
				end
			end
		end
	end
	return -1
end

--Handles LLT terminal commands
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

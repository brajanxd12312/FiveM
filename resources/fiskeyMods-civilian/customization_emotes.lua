-- Fiskey111 Civilian RP Script
-- Version: 0.514.17.0
-- All rights reserved

-- Made with the help of the Kuffs Gaming Crew.  Check them out at www.KuffsGaming.com



-- PLACE ALL SCENARIOS BELOW USING THE TEMPLATE

-- TEMPLATE: table.insert(ScenarioList, {"QuickName", "ScenarioName")
-- You can find a list of all scenarios here: http://gtaforums.com/topic/796181-list-of-scenarios-for-peds/
-- Do note these will be sorted by QuickName in the menu upon rendering, so if you want things near each other, name them accordingly

-- If you plan on changing anything below, please keep a backup copy in case you screw something up (cause we all do that periodically)


ScenarioList = {}

table.insert(ScenarioList, {"Cheer", "WORLD_HUMAN_CHEERING"})
table.insert(ScenarioList, {"Drink", "WORLD_HUMAN_DRINKING"})
table.insert(ScenarioList, {"Smoke", "WORLD_HUMAN_SMOKING"})
table.insert(ScenarioList, {"Cell Phone Film", "WORLD_HUMAN_MOBILE_FILM_SHOCKING"})
table.insert(ScenarioList, {"Gardener Plant", "WORLD_HUMAN_GARDENER_PLANT"})
table.insert(ScenarioList, {"Stand Guard", "WORLD_HUMAN_GUARD_STAND"})
table.insert(ScenarioList, {"Hammering", "WORLD_HUMAN_HAMMERING"})
table.insert(ScenarioList, {"Hanging Out", "WORLD_HUMAN_HANG_OUT_STREET"})
table.insert(ScenarioList, {"Hiker Standing", "WORLD_HUMAN_HIKER_STANDING"})
table.insert(ScenarioList, {"Human Statue", "WORLD_HUMAN_HUMAN_STATUE"})
table.insert(ScenarioList, {"Jog Standing", "WORLD_HUMAN_JOG_STANDING"})
table.insert(ScenarioList, {"Leaning", "WORLD_HUMAN_LEANING"})
table.insert(ScenarioList, {"Muscle Flex", "WORLD_HUMAN_MUSCLE_FLEX"})
table.insert(ScenarioList, {"Paparazzi", "WORLD_HUMAN_PAPARAZZI"})
table.insert(ScenarioList, {"Picnic", "WORLD_HUMAN_PICNIC"})
table.insert(ScenarioList, {"Sitting in Chair", "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER"})
table.insert(ScenarioList, {"Prostitute 1", "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS"})
table.insert(ScenarioList, {"Prostitute 2", "WORLD_HUMAN_PROSTITUTE_LOW_CLASS"})
table.insert(ScenarioList, {"Push-ups", "WORLD_HUMAN_PUSH_UPS"})
table.insert(ScenarioList, {"Sit-ups", "WORLD_HUMAN_SIT_UPS"})
table.insert(ScenarioList, {"Fishing", "WORLD_HUMAN_STAND_FISHING"})
table.insert(ScenarioList, {"Impatient Standing", "WORLD_HUMAN_STAND_IMPATIENT"})
table.insert(ScenarioList, {"Cell Phone Standing", "WORLD_HUMAN_STAND_MOBILE"})
table.insert(ScenarioList, {"Strip Watch", "WORLD_HUMAN_STRIP_WATCH_STAND"})
table.insert(ScenarioList, {"Sunbathe (Back)", "WORLD_HUMAN_SUNBATHE_BACK"})
table.insert(ScenarioList, {"Sunbathe", "WORLD_HUMAN_SUNBATHE"})
table.insert(ScenarioList, {"Welding", "WORLD_HUMAN_WELDING"})
table.insert(ScenarioList, {"Yoga", "WORLD_HUMAN_YOGA"})
table.insert(ScenarioList, {"Cop Idle", "WORLD_HUMAN_COP_IDLES"})
table.insert(ScenarioList, {"Cop Kneel", "CODE_HUMAN_MEDIC_KNEEL"})
table.insert(ScenarioList, {"Cop Crowd Control", "CODE_HUMAN_POLICE_CROWD_CONTROL"})
table.insert(ScenarioList, {"Cop Investigate", "CODE_HUMAN_POLICE_INVESTIGATE"})
table.insert(ScenarioList, {"Cop Write Ticket", "CODE_HUMAN_MEDIC_TIME_OF_DEATH"})
table.insert(ScenarioList, {"EMS Tend to Dead", "CODE_HUMAN_MEDIC_TEND_TO_DEAD"})
table.insert(ScenarioList, {"Clipboard", "WORLD_HUMAN_CLIPBOARD"})
table.insert(ScenarioList, {"Construction Drill", "WORLD_HUMAN_CONST_DRILL"})
table.insert(ScenarioList, {"Janitor", "WORLD_HUMAN_JANITOR"})
table.insert(ScenarioList, {"Partying", "WORLD_HUMAN_PARTYING"})
table.insert(ScenarioList, {"Smoke Pot", "WORLD_HUMAN_SMOKING_POT"})





-- ***DO NOT EDIT BELOW***
-- ***DO NOT EDIT BELOW***
-- ***DO NOT EDIT BELOW***
-- ***DO NOT EDIT BELOW***
-- ***DO NOT EDIT BELOW***
-- ***DO NOT EDIT BELOW***
-- ***DO NOT EDIT BELOW***
-- ***DO NOT EDIT BELOW***
-- ***DO NOT EDIT BELOW***
-- ***DO NOT EDIT BELOW***
-- ***DO NOT EDIT BELOW***


RegisterServerEvent('SERVER_LoadAmbientScenarios')
AddEventHandler('SERVER_LoadAmbientScenarios', function(playerID)
	for value = 1, #ScenarioList do
		local a, b = table.unpack(ScenarioList[value])
		TriggerClientEvent('CLIENT_SendScenario', playerID, ""..a.."", ""..b.."")
	end
	print("Total ambient scenarios sent to client "..playerID..": "..#ScenarioList.."")
end)

AddEventHandler('chatMessage', function(source, n, message)
	local args = stringsplit(message, " ")

	if (args[1] == "/emote") then
		CancelEvent()

		local value = GetEmoteMessage(args)

		if (value ~= nil) then
			if (IsInTable(value) == true) then
				TriggerClientEvent('CLIENT_PlayEmote',  source, value, GetEmote(value))
			else
				TriggerClientEvent('chatMessage',  source, "SYSTEM", {0, 0, 0}, "Emote not found")
			end
		else
			TriggerClientEvent('chatMessage',  source, "SYSTEM", {0, 0, 0}, "Usage: /emote shortName")
		end
	end
end)

function GetEmoteMessage(list)
	local msg = nil
	for value = 2, #list do
		msg = msg.." "..list[value]
	end
	return msg
end

function IsInTable(name)
	for value = 1, #ScenarioList do
		local a, b = table.unpack(ScenarioList[value])
		a = string.gsub(a, "%s+", "")
		name = string.gsub(name, "%s+", "")
		if (a == name) then
			return true
		end
	end
end

function GetEmote(name)
	for value = 1, #ScenarioList do
		local a, b = table.unpack(ScenarioList[value])
		a = string.gsub(a, "%s+", "")
		name = string.gsub(name, "%s+", "")
		if (a == name) then
			return b
		end
	end
end


function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

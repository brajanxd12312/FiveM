-- These values allow you to change the colors of the compass and radar pieces

-- COMPASS
-- The format is as follows: {r, g, b}
local compassDirectionColor = {255, 255, 255}
local compassCurrentStreetColor = {51, 204, 76}
local compassCrossStreetColor = {244, 226, 66}


-- RADAR
-- The selection must be one of the following:
-- ~r~ (red); ~o~ (orange); ~y~ (yellow); ~g~ (green); ~b~ (blue); ~p~ (purple); ~w~ (white)
-- DEFAULTS: "~w~", "~w~", "~w~"

local radarTargetValueColor = "~p~"		-- Color of the model name text
local radarPlateTextColor = "~w~"		-- Color of the text "Plate: "
local radarPlateValueColor = "~b~"		-- Color of the plate numbers/characters
local radarSpeedTextColor = "~w~"		-- Color of the text "Speed: "
local radarSpeedValueColor = "~w~"		-- Color of the actual speed; Note: this will be overwritten if the speed is above the limit


-- DO NOT EDIT BELOW THIS LINE!!!!!! --
-- DO NOT EDIT BELOW THIS LINE!!!!!! --
-- DO NOT EDIT BELOW THIS LINE!!!!!! --
-- DO NOT EDIT BELOW THIS LINE!!!!!! --
-- DO NOT EDIT BELOW THIS LINE!!!!!! --
-- DO NOT EDIT BELOW THIS LINE!!!!!! --
-- DO NOT EDIT BELOW THIS LINE!!!!!! --
-- DO NOT EDIT BELOW THIS LINE!!!!!! --
-- DO NOT EDIT BELOW THIS LINE!!!!!! --
-- DO NOT EDIT BELOW THIS LINE!!!!!! --
-- DO NOT EDIT BELOW THIS LINE!!!!!! --



RegisterNetEvent('LEO:CLIENT_TriggerRadar')
AddEventHandler('LEO:CLIENT_TriggerRadar', function(toggle, frontFacing, limit)
	isEnabled = toggle
	isFrontFacing = frontFacing
	speedLimit = limit
end)

RegisterNetEvent('LEO:CLIENT_UpdateRadarSpeedLimit')
AddEventHandler('LEO:CLIENT_UpdateRadarSpeedLimit', function(limit)
	Citizen.Trace("Limit: "..tostring(limit))
	speedLimit = limit
end)

RegisterNetEvent('LEO:CLIENT_UpdateRadarDirection')
AddEventHandler('LEO:CLIENT_UpdateRadarDirection', function(isForward)
	Citizen.Trace("IsForward: "..tostring(isForward))
	isFrontFacing = isForward
end)

RegisterNetEvent('LEO:CLIENT_RadarAndCompassSettings')
AddEventHandler('LEO:CLIENT_RadarAndCompassSettings', function(compassEnabled, imperial)
	Citizen.Trace("Compass: "..tostring(compassEnabled).."; Imperial: "..tostring(imperial))
	CompassEnabled = compassEnabled
	isImperial = imperial
end)

isEnabled = false
CompassEnabled = 1
isImperial = 0
isFrontFacing = true
speedLimit = 60
text = ""
isLocked = false

Citizen.CreateThread(function()
	while true do
		Wait(0)

		if isEnabled and IsPedInAnyVehicle(GetPlayerPed(-1), false) then
			local radarOffset = 5.0
			local targetOffset = 75.0

			if not isFrontFacing then -- Set the radar offsets
				radarOffset = -5.0
				targetOffset = -75.0
			end

			if IsControlJustPressed(1, 209) then -- Check to see if we want to lock the radar
				isLocked = not isLocked
				if isLocked then
					text = "*"..text
					Citizen.Trace(text)
				end
			end

			local radarPos = GetOffsetFromEntityInWorldCoords(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0, radarOffset, 0.0) -- Get radar position
			local targetPos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, targetOffset, 0.0) 	-- Get target position offset

			local rayHandle = StartShapeTestCapsule(radarPos["x"], radarPos["y"], radarPos["z"], targetPos["x"], targetPos["y"], targetPos["z"], 1.0, 10, GetVehiclePedIsIn(GetPlayerPed(-1), false), 7)
			local result, rayHitSuccessful, rayTargetCoords, raySurfaceNormal, rayEntityHit, ent2 = GetShapeTestResult(rayHandle)

			if (isLocked == false) then
				if rayHitSuccessful then -- Ray hit something
					if (GetEntityType(rayEntityHit) ~= 2) then -- Check if the object is a vehicle
						text = "No target"
					else
						local targetVehicle = GetVehicleIndexFromEntityIndex(rayEntityHit) -- Get the target vehicle

						if not DoesEntityExist(targetVehicle) then -- Make sure it exists
							text = "No target"
						else
							-- Get model, plate, and speed
							local displayName = GetDisplayNameFromVehicleModel(GetEntityModel(targetVehicle))
							local plate = GetVehicleNumberPlateText(targetVehicle)
							local speed = GetEntitySpeed(targetVehicle)
							local unit = "KMH"

							if isImperial == 1 then
								speed = RoundNumber(speed * 2.23694, 0)
								unit = "MPH"
							else
								speed = RoundNumber(speed * 3.6, 0)
								unit = "KMH"
							end

							if (speed > speedLimit) then speed = "~r~"..speed.."~w~" end

							text = ""..radarTargetValueColor..""..displayName..""..radarPlateTextColor.."".." Plate: "..radarPlateValueColor..""..plate..""..radarSpeedTextColor.."  Speed: "..radarSpeedValueColor..""..speed.." "..unit
						end
					end
				else
					text = "No target"
				end
			end
			TextDrawer(0.25, 1.073, 0.5, 0.57, 0.25, text, 255, 255, 255) -- X Y W H S T
		end

		if CompassEnabled == 1 then
			if not DoesEntityExist(GetPlayerPed(-1)) then return end

			local playerPos = GetEntityCoords(GetPlayerPed(-1))
			local onStreet, crossStreet = GetStreetNameAtCoord(playerPos["x"], playerPos["y"], playerPos["z"])

			local playerStreet = GetStreetNameFromHashKey(onStreet)
			local crossRoad = GetStreetNameFromHashKey(crossStreet)
			local heading = GetEntityHeading(GetPlayerPed(-1))

			local direction = "N"

			if (337.5 < heading or heading < 22.5) then direction = "N"
			elseif (heading >= 22.5 and heading < 67.5) then direction = "NE"
			elseif (heading >= 67.5 and heading < 112.5) then direction = "E"
			elseif (heading >= 112.5 and heading < 157.5) then direction = "SE"
			elseif (heading >= 157.5 and heading < 202.5) then direction = "S"
			elseif (heading >= 202.5 and heading < 247.5) then direction = "SW"
			elseif (heading >= 247.5 and heading < 292.5) then direction = "W"
			elseif (heading >= 292.5 and heading < 337.5) then direction = "NW"
			end

			TextDrawer(0.25 + 0.1442, 0.245 + 0.952, 0.5, 0.5, 0.7, direction, compassDirectionColor[1], compassDirectionColor[2], compassDirectionColor[3]) -- Direction
			TextDrawer(0.277 + 0.1543, 0.248 + 0.952, 0.5, 0.5, 0.35, playerStreet, compassCurrentStreetColor[1], compassCurrentStreetColor[2], compassCurrentStreetColor[3]) -- Main street
			TextDrawer(0.277 + 0.1543, 0.262 + 0.953, 0.5, 0.5, 0.35, crossRoad, compassCrossStreetColor[1], compassCrossStreetColor[2], compassCrossStreetColor[3]) -- Cross street
		end
	end
end)

function RoundNumber(num, numDecimalPlaces)
  return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

function TextDrawer(x, y, width, height, scale, text, r, g, b)
    SetTextFont(0) -- Fonts: 0=Chalet London; 1=HouseScript; 2=Monospace; 3=ChaletComprimeCologne; 4=Pricedown
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, 255)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

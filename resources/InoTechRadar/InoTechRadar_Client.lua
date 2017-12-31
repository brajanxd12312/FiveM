--[[ TODO/Wishlist:
*) Angle based radar 
**) Animate radar sweep? Performance may be an issue for spam-updating html canvas
**) Bonus points if sweep can be matched with physically visible radar on Predator.
*) Client-side options
*) Implement radar types for different identification & showing directional vectors
*) Active & Passive SONAR
**) Active range sonar would greatly boost range, but also reveal your own position to other sonar from far away
**) Allow boats/subs without active SONAR to be invisible from passive SONAR while their engines are turned off (or going very slowly?)
***) Will need server-side code to propagate sonar status
***) Will need to ensure passengers in vehicles cannot change active sonar status, and get their own active sonar status from server.
***) There are currently no multi-person submarines, though.
*) Possibly add propagation delay to SONAR to simulate speed of sound
**) Investigate performance issues if this was to be implemented (10hz radius increase rate should be enough)
**) Save vehicle identifier?
**) Risks looking weird as fuck while turning
*) Add static ground radar
**) Add ground radar operation
**) Add radar distribution system
*) Add radar to certain dinghy variations (all seat variations)
*) Take target signature into account?
*) Would love some way to detect NPCs
*) Add knots as an option for velocity display
*) Comment code... for everyone's sake...
]]

--[[ Prerelease:
1) Remove vehicle & weapon spawning *
2) Remove prints from lua and js *
3) Remove .mp3 files *not yet needed
4) Rename from "shitty" *
5) Remove any debug functions *y doe
6) Comment on all options *
7) Remove this *you can stay
]]

--
--
--
-- OPTIONAL CONFIG START, the below options may be changed.
--
--
--

-- The following booleans control what will occlude a target from showing up on radar. 
-- For instance, the default value of "false" on "radarPenetrateMap" means that airplanes behind hills will not show up on the radar.
-- Effectively, these options allow you to tweak to what extent someone can fly "under the radar".
radarPenetrateMap = false -- Default: false
radarPenetrateVehicles = true -- Default: true. NOTE: Might not be working when on false, suggest leaving alone for now
radarPenetratePeds = true -- Default: true
radarPenetrateObjects = false -- Default: false
radarPenetrateFoliage = false -- Default: false

globalRangeModifier = 1.0 -- Allows you to globally tweak ranges on radar. All ranges will be multiplied by this number. (Higher is "better". Default: 1.0
globalFrequencyModifier = 1.0 -- Allows you to globally tweak refresh frequencies on radar. All refresh frequencies will be multiplied by this number (AKA higher is "better"). Please note that too high refresh frequencies may result in poor performance. Default: 1.0

useCallsign = true -- If false, use player name instead of vehicle's callsign (the latter being randomly assigned by the game)
useShortCallsign = true -- If true, uses only the last six letters of the callsign. Only has any effect if useCallsign is also enabled.

-- NOTE: If you change hotkeys, you must also change the name of the hotkeys for in-game notifications to appear correctly.
-- For hotkey IDs, see https://hastebin.com/seqedecayi.bash
openRadarHotkey = 19 -- Left ALT by default (character wheel button)
openRadarHotkeyName = "ALT"
openRadarHotkeyNameController = "down on D-pad"
-- NOTE: Active sonar is currently not yet implemented, changing these values does nothing.
activeSonarHotkey = 73 -- Z by default (vehicle duck button)
activeSonarHotkeyName = "Z"
activeSonarHotkeyNameController = "CONTROLLER_DUCK_TODO"

--
--
--
-- OPTIONAL CONFIG END
-- DON'T CHANGE ANYTHING BELOW THIS LINE UNLESS YOU KNOW WHAT YOU'RE DOING
--
--
--

local convertRadarTable = false

local testRayVehicle = nil
local radarIsOpen = false
local currentlyInFirstPerson = false
local canOpenRadar = false
local localRadarData = {} --TODO: Populate this
local _radarEnabledVehicles = {} -- Init only table
local lastRadarUpdate = 0
local quickRadarInfoUpdate = false

debugMode = false -- Bad things happen if you touch this.


--[[ 
Values: radarRange, radarType, radarUpdateFreq
radarTypes:
1 - Civilian Standard Radar
2 - Military Standard Radar
3 - SONAR
--]]

-- AIRPLANES
_radarEnabledVehicles["titan"] = {6000, 2, 1500}
_radarEnabledVehicles["lazer"] = {3500, 2, 250}
_radarEnabledVehicles["hydra"] = {4000, 2, 500}
_radarEnabledVehicles["besra"] = {3500, 2, 500}
_radarEnabledVehicles["jet"] = {3000, 1, 1000}
_radarEnabledVehicles["cargoplane"] = {3500, 1, 1000}
_radarEnabledVehicles["luxor"] = {2250, 1, 1000}
_radarEnabledVehicles["luxor2"] = {2250, 1, 1000}
_radarEnabledVehicles["shamal"] = {2250, 1, 1000}
_radarEnabledVehicles["nimbus"] = {2250, 1, 1000}
_radarEnabledVehicles["miljet"] = {3250, 2, 1000}

-- HELICOPTERS
_radarEnabledVehicles["polmav"] = {750, 1, 1000}
_radarEnabledVehicles["buzzard2"] = {750, 1, 1000}
_radarEnabledVehicles["savage"] = {3800, 2, 750}
_radarEnabledVehicles["buzzard"] = {2800, 2, 1000}
_radarEnabledVehicles["valkyrie"] = {2500, 2, 1000}
_radarEnabledVehicles["valkyrie2"] = {2500, 2, 1000}
_radarEnabledVehicles["annihilator"] = {3500, 2, 1000}
_radarEnabledVehicles["skylift"] = {2000, 1, 1000}
_radarEnabledVehicles["cargobob"] = {2500, 2, 1000}
_radarEnabledVehicles["cargobob2"] = {2000, 1, 1000}
_radarEnabledVehicles["cargobob3"] = {2500, 2, 1000}
_radarEnabledVehicles["cargobob4"] = {2500, 2, 1000}

-- BOATS
_radarEnabledVehicles["predator"] = {2500, 1, 4000}
_radarEnabledVehicles["tug"] = {2500, 1, 4000}

-- SUBS
_radarEnabledVehicles["submersible"] = {2000, 3, 3000}
_radarEnabledVehicles["submersible2"] = {2000, 3, 3000}

validRadarTargets = {}
validRadarTargets[1] = {14, 15, 16} -- Boats, helicopters, planes
validRadarTargets[2] = {14, 15, 16} -- Boats, helicopters, planes
validRadarTargets[3] = {14} -- Boats

radarNames = {}
radarNames[1] = "radar"
radarNames[2] = "radar"
radarNames[3] = "sonar"

staticRadarLocations = {}
staticRadarLocations[1] = {
	name="Los Santos International Airport", 
	range=8500, 
	frequency=3000, 
	x=1275, 
	y=-2450, 
	z=100,
}
staticRadarLocations[2] = {
	name="Fort Zancudo", 
	range=10000, 
	frequency=3000, 
	x=-2500, 
	y=-3300, 
	z=115,
}

radarEnabledVehicles = {} -- Real table, do not touch

if convertRadarTable then
	for k, v in pairs(_radarEnabledVehicles) do -- Convert our init table to our real table with hashes
		hashKey = GetHashKey(k, _r)
		radarEnabledVehicles[hashKey] = v
	end
else
	radarEnabledVehicles = _radarEnabledVehicles
end

function searchTable(t, searchValue)
	for k,v in pairs(t) do
		if v == searchValue then
			return k
		end
	end
	return nil
end

function contains(t, searchValue)
	if searchTable(t, searchValue) ~= nil then
		return true
	end
	return false
end

function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

function output(obj)
	obj = tostring(obj)
	TriggerEvent("chatMessage", "", { 0, 0, 0 }, "" .. obj)
end

function displayNotification(msg)
	SetNotificationTextEntry("STRING");
	AddTextComponentString(tostring(msg))
	DrawNotification(false, true);
end

function getRadarEntry(vehicle)
	for k, v in pairs(radarEnabledVehicles) do
		if IsVehicleModel(vehicle, GetHashKey(k, _r)) then
			return radarEnabledVehicles[k]
		end
	end
	return nil -- obv superfluous
end

function isRadarCapable(vehicle)
	local radarEntry = getRadarEntry(vehicle)
	if radarEntry ~= nil then
		--TriggerEvent("chatMessage", "", { 0, 0, 0 }, "Radar range: "..radarEntry[1])
		return true
	end
	return false
end

function getRadarRange(vehicle)
	local radarEntry = getRadarEntry(vehicle)
	if radarEntry ~= nil then
		return radarEntry[1] * globalRangeModifier
	end
	return 0
end

function getRadarType(vehicle)
	local radarEntry = getRadarEntry(vehicle)
	if radarEntry ~= nil then
		return radarEntry[2]
	end
	return 0
end

function getRadarName(vehicle)
	local radarType = getRadarType(vehicle)
	if radarType ~= 0 then
		return radarNames[radarType]
	end
	return "RADAR_NO_NAME"
end

function getRadarFrequency(vehicle)
	local radarEntry = getRadarEntry(vehicle)
	if radarEntry ~= nil then
		return radarEntry[3] / globalFrequencyModifier
	end
	return 99999999
end


function getRayTraceFlags(baseFlags)
	local rayTraceFlags = baseFlags or 0
	if not radarPenetrateMap then
		rayTraceFlags = rayTraceFlags + 1
	end
	if not radarPenetrateVehicles then
		rayTraceFlags = rayTraceFlags + 2
	end
	if not radarPenetratePeds then
		rayTraceFlags = rayTraceFlags + 4
	end
	if not radarPenetrateObjects then
		rayTraceFlags = rayTraceFlags + 16
	end
	if not radarPenetrateFoliage then
		rayTraceFlags = rayTraceFlags + 256
	end
	return rayTraceFlags
end
	

function positionTrace(pos1x, pos1y, pos1z, pos2x, pos2y, pos2z, ignoreEntity, expectedTarget)
	rayTraceFlags = getRayTraceFlags()
	rayHandle = CastRayPointToPoint(pos1x, pos1y, pos1z, pos2x, pos2y, pos2z, rayTraceFlags, ignoreEntity, 0)
	_,collisionFlag,_,_,_ = GetRaycastResult(rayHandle)
	collided = (collisionFlag ~= 0)
	--TriggerEvent("chatMessage", "", { 0, 0, 0 }, "a:" .. a .. " b:" .. b .. " c:" .. c .. " d:" .. d .. " e:" .. e)
	if collided then
		--output("Ray did not reach target")
		return false
	else
		--output("Ray reached target")
		return true
	end
end

function trace(entity1, entity2)
	local coords1 = GetEntityCoords(entity1, false)
	local coords2 = GetEntityCoords(entity2, false)
	return positionTrace(coords1.x, coords1.y, coords1.z, coords2.x, coords2.y, coords2.z, entity1, entity2)
end
	
function isEntityUnderwater(entity)
	--local coords1 = GetEntityCoords(entity1, false)
	submergedLevel = GetEntitySubmergedLevel(entity)
	return submergedLevel > 0.9
end

function isActiveSonar()
	return true --TODO
end

function isPedValidRadarTarget(ped, radarType)
	if IsPedSittingInAnyVehicle(ped) then -- TODO: May need to add !IsPedInAnySub?
		local vehicle = GetVehiclePedIsIn(ped, false)
		if DoesEntityExist(vehicle) and not IsEntityDead(vehicle) and isVehicleValidRadarTarget(vehicle, radarType) then
			if GetPedInVehicleSeat(vehicle, -1) == ped then -- TODO: incl passengers?
				local isSubmerged = isEntityUnderwater(vehicle)
				if radarType == 3 then -- if SONAR
					if IsEntityInWater(vehicle) then
						if isSubmerged then
							if isActiveSonar() or IsVehicleEngineOn(vehicle) then
								return vehicle
							end
						else
							return vehicle
						end
					end
				else
					if not isSubmerged then
						return vehicle
					end
				end
			end
		end
	end
end

function isVehicleValidRadarTarget(vehicle, radarType)
	local vClass = GetVehicleClass(vehicle)
	local classValid = contains(validRadarTargets[radarType], vClass)
	return classValid
end
	
function radarHasClearPath(sourcePed, targetPed)
	return true -- TODO: Add trace function here
end

function getDistance(x1, y1, z1, x2, y2, z2, onlyHorizontal)
	onlyHorizontal = onlyHorizontal or false
	if onlyHorizontal then
		z1 = z2
	end
	return Vdist(x1, y1, z1, x2, y2, z2)
end

function getVectorDistance(v1, v2, onlyHorizontal)
	x1, y1, z1 = table.unpack(v1)
	x2, y2, z2 = table.unpack(v2)
	return getDistance(x1, y1, z1, x2, y2, z2, onlyHorizontal)
end
	
function isEntityInCapsule(entity, range) --TODO: This.
	local targetCoords = GetEntityCoords(entity, false)
	local playerCoords = GetEntityCoords(GetPlayerPed(-1), false)
	if GetDistanceBetweenCoords(targetCoords.x, targetCoords.y, 0, playerCoords.x, playerCoords.y, 0, false) <= range then
		return true
	end
	return false
end

function getPedsInSession(includeSelf)
	includeSelf = includeSelf or false
	peds = {}
	for playerIndex=0,64 do
		if NetworkIsPlayerConnected(playerIndex) or NetworkIsPlayerActive(playerIndex) then
			datPed = GetPlayerPed(playerIndex)
			if includeSelf or (datPed ~= GetPlayerPed(-1)) then
				peds[playerIndex] = datPed
			end
		end
	end
	return peds
end

function isInFirstPerson()
	return (GetFollowPedCamViewMode() == 4) and (IsGameplayCamLookingBehind() ~= 1)
end

-- Safe to be spam called. Checks if your first person status has changed, and if so, tells js about it.
function updateCamera()
	local _fp = isInFirstPerson()
	if _fp ~= currentlyInFirstPerson then -- Check if our camera status changed. No need to send NUI message if not.
		SendNUIMessage({
			command = "updateCamera",
			isInFirstPerson = _fp,
		})
		currentlyInFirstPerson = _fp
		--output(_fp)
	end
end

-- Do not spam call.
function setRadarOpen(enable)
	if enable then
		updateCamera()
	end
	SendNUIMessage({
		command = "setRadarOpen",
		enable = enable,
	})
	radarIsOpen = enable
end

function getTime()
	return GetNetworkTime()
end

function getDeltaEntityCoords(entity1, entity2)
	local coords1 = GetEntityCoords(entity1, false)
	local coords2 = GetEntityCoords(entity2, false)
	return {coords2.x - coords1.x, coords2.y - coords1.y, coords2.z - coords1.z}
end

function getFakeVehicle(vehicle)
	local coords1 = GetEntityCoords(vehicle, false)
	return {vehX = firstSpawnCoords.x - coords1.x, vehY = firstSpawnCoords.y - coords1.y, vehZ = firstSpawnCoords.z - coords1.z, vehClass=14, vehSpeed=230, vehName="KTL915"}
end

function updateLocalRadarData(vehicle) -- Could use some tidying up tbh, split up into smaller functions.
	localRadarData = {}
	local range = getRadarRange(vehicle)
	local radarType = getRadarType(vehicle)
	local vehName = "UNKNOWN"
	for playerNum, ped in pairs(getPedsInSession(debugMode)) do
		local otherVehicle = isPedValidRadarTarget(ped, radarType)
		if otherVehicle ~= nil then
			if isEntityInCapsule(otherVehicle, range) then
				if trace(vehicle, otherVehicle) then
					local vehCoords = getDeltaEntityCoords(vehicle, otherVehicle)
					local vehClass = GetVehicleClass(otherVehicle)
					local vehSpeed = GetEntitySpeed(otherVehicle)
					if useCallsign then
						vehName = GetVehicleNumberPlateText(otherVehicle)
						if useShortCallsign then
							if string.len(vehName) >= 8 then --does this even work?
								vehName = vehName:sub(3)
							end
						end
					else
						vehName = GetPlayerName(playerNum)
					end
					table.insert(localRadarData, {vehX = vehCoords[1], vehY = vehCoords[2], vehZ = vehCoords[3], vehClass = vehClass, vehSpeed = vehSpeed, vehName = vehName})
				end
			end
		end
	end
	if debugMode then
		table.insert(localRadarData, getFakeVehicle(vehicle))
	end
	return localRadarData
end

function updateRadarInfo(vehicle)
	local range = getRadarRange(vehicle)
	local freq = getRadarFrequency(vehicle)
	local radarType = getRadarType(vehicle)
	local radarName = getRadarName(vehicle)
	local forwardX = GetEntityForwardX(vehicle)
	local forwardY = GetEntityForwardY(vehicle)
	local yaw = math.atan(forwardY, forwardX)
	SendNUIMessage({
		command = "updateRadarInfo",
		range = range,
		freq = freq,
		yaw = yaw,
		radarType = radarType,
		radarName = radarName,
	})
end
	
function updateRadarData(vehicle)
	updateCamera()
	local curTime = getTime()
	local vehFreq = getRadarFrequency(vehicle)
	if quickRadarInfoUpdate then
		updateRadarInfo(vehicle)
	end
	if curTime - lastRadarUpdate >= getRadarFrequency(vehicle) then
		jsTimerTestStart()
		lastRadarUpdate = curTime
		if not quickRadarInfoUpdate then
			updateRadarInfo(vehicle)
		end
		updateLocalRadarData(vehicle)
		SendNUIMessage({
			command = "updateRadarData",
			radarData = localRadarData,
		})
		--jsTimerTestEnd()
	end
end

function jsTimerTestStart()
	SendNUIMessage({
		command = "radarTimerStart"
	})
end

function jsTimerTestEnd()
	SendNUIMessage({
		command = "radarTimerEnd"
	})
end

function setActiveSonar(active)
	SendNUIMessage({
		command = "setActiveSonar",
		active = active,
	})
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(50)
		_canOpenRadar = false
		local vehicle = nil
		if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
			vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
			if DoesEntityExist(vehicle) and not IsEntityDead(vehicle) then
				if isRadarCapable(vehicle) then
					updateRadarData(vehicle)
					_canOpenRadar = true
				end
			end
		end
		if canOpenRadar == false and _canOpenRadar == true then -- Just entered radar capable vehicle
			displayNotification("Vehicle has " .. getRadarName(vehicle) .. " capabilities. Press ~p~".. openRadarHotkeyName.. "~s~ (or "..openRadarHotkeyNameController..") to toggle.")
		end
		canOpenRadar = _canOpenRadar
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		
		-- OPEN RADAR TOGGLE
		
		local hasPressed = IsControlJustPressed(0, openRadarHotkey)
		if radarIsOpen then
			if hasPressed or not canOpenRadar then
				setRadarOpen(false)
				--output("Closing radar.")
			end
		elseif hasPressed and canOpenRadar then
			setRadarOpen(true)
			--output("Opening radar.")
		end
		
		-- ACTIVE SONAR TOGGLE
		
		--local hasPressed = IsControlJustPressed(0, activeSonarHotkey)
    end
end)

function spawnDebugVehicle(vehicleName, xOffset)
	local xOffset = xOffset or 0
	local vehicleModel = GetHashKey(vehicleName)
	RequestModel(vehicleModel)
	while not HasModelLoaded(vehicleModel) do
		Wait(1)
	end
	firstSpawnCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), xOffset, 10.0, 0)
	testRayVehicle = CreateVehicle(vehicleModel, firstSpawnCoords, GetEntityHeading(myPed), true, false)
	SetVehicleOnGroundProperly(testRayVehicle)
	SetModelAsNoLongerNeeded(vehicle)
	--SetEntityAsNoLongerNeeded(testRayVehicle)
end

AddEventHandler("playerSpawned", function(spawn)
	setRadarOpen(false)
	if debugMode then
		TriggerEvent("chatMessage", "", { 0, 0, 0 }, "Hello world!")
		--SetEntityCoords(GetPlayerPed(-1), -587, 979, 242)
		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("weapon_rpg"), 100, false, true)
		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("weapon_knife"), 1, false, true)
		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("gadget_parachute"), 1, false, true)
		--GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("weapon_minigun"), 9999, false, true)
		--GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("weapon_airstrike_rocket"), 100, false, true)
		spawnDebugVehicle("hydra")
		--spawnDebugVehicle("submersible", 20)
	end
end)
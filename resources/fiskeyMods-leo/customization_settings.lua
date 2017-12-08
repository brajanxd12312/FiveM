-- LAW ENFORCEMENT FIVEM MODIFICATION BY FISKEY111 --
-- HUGE THANK YOU TO ALEXGUIRRE OF LCPDFR.COM FOR ALL HIS HELP! --
-- HUGE THANK YOU TO THE GUYS AT KUFFSGAMING.COM FOR ALL THEIR TESTING HELP! --

-- RELEASE V0.1105.2017.0 --

-- YOU CAN EDIT THIS FILE! --

-- A string is any number of values on the keyboard, surrounded by quotations.  E.g.:  "The dog runs fast"  or  "The cat goes moo"
-- There is a limit to the length strings, as the chat box and notifications can only handle so many characters.

-- A bool is either true or false.
--If you want it turned on, put true
--If you want it turned off, put false

-- SETTINGS

-- DEPARTMENTS
-- This value will change the list of departments your officers can join.
-- ****NOTE**** ~18 characters is the maximum the menu can fit nicely --> if you go over it'll automatically try to compensate, but don't go too far since it can't fix everything
-- DEFAULT:  {[1]="SA County Sheriff", [2]="Los Santos Police", [3]="SA State Police"}

local depts = {[1]="BCSO", [2]="LSPD", [3]="SAHP"}
local menuDescription = "LEO Menu"

-- FINES
-- DEFAULT:  true, 401, "$"

local isFineTurnedOn = true
local fineMax = 401					-- This value will edit the maximum fine allowed (**NOTE: It will go *UP TO AND NOT INCLUDING* this maximum at 25 increments. If you want to include this number, add 1 to it like the default**)
local fineMonetaryValue = "$"		-- This value will edit the value displayed before the fine (e.g. use your pound, euro, etc)


-- BAC/DRUG TESTER
-- DEFAULT:  true, 0.00, 0.15, "%", 0.05, 0.08

local isTestTurnedOn = true		-- This value will turn the tester on/off
local alcoholLower = 0.00			-- This value is the lower limit for the alcohol test (e.g. the result cannot be below this value) [set it to 0.2 and every result will be at or above 0.2]
local alcoholHigher = 0.65			-- This value is the upper limit for the alcohol test (e.g. the result cannot be above OR INCLUDE this value)
local alcoholDescription = "%"		-- This is the string that follows the BAC value (e.g. will read: [BAC: 0.26 {alcoholDescription}])
local alcoholWarning = 0.05			-- This is the warning level for the alcohol test (e.g. the level at which the result will be colored yellow) (includes this value)
local alcoholOver = 0.08			-- This is the threshold for the result being colored red (includes this value)
local drugChance = 10				-- This value will adjust the chance of drugs being found -- this is a 1 out of x value, so if you put 4 it'll be a 25% chance of one drug being found


-- RADAR/COMPASS
-- DEFAULT: true, true, true

local isCompassEnabled = true			-- This value toggles the availability of the compass
local isRadarEnabled = false		-- This value toggles the availability of the radar feature
local isRadarInImperial = true		-- This value toggles MPH/KMH for the radar system


-- K9
-- DEFAULT: true, "a_c_shepherd"

local isK9TurnedOn = true			-- This value toggles the availability of the K9 option
local K9DogModel = "Shepherd" 		-- This value adjusts the dog model.  You can find a model list here: https://wiki.gtanet.work/index.php?title=Peds


-- CUFF/GRAB/SEARCH/SPOTLIGHT/TOW/PANIC/TAXI/DISPATCH/VEHICLESPAWN/PROP/MODEL/STATUSES/SPEEDZONES
-- DEAFULT: true... and 20.0

local isCuffTurnedOn = true			-- This value toggles the availability of the cuff option
local isGrabTurnedOn = false			-- This value toggles the availability of the grab option (*****NOTE THIS REQUIRES THIS SCRIPT: https://forum.fivem.net/t/release-drag-command/22174/2)
local isSearchTurnedOn = true			-- This value toggles the availability of the search option
local isSpotlightTurnedOn = true		-- This value toggles the availability of the spotlight option [edit values in coordinates.lua]
local isTowTurnedOn = true				-- This value toggles the availability of the AI tow option
local isPanicTurnedOn = true			-- This value toggles the availability of the panic button (press F6 to activate)
local isTaxiTurnedOn = true			-- This value toggles the availability of the AI taxi feature
local isDispatchTurnedOn = true		-- This value toggles the "Dispatch" feature used for 911 calling (requires civilian menu)
local isPropEnabled = true				-- This value toggles the prop spawning feature (from customization_props.lua)
local isVehicleSpawnerTurnedOn = true	-- This value toggles the vehicle spawn option found in the menu for officers (displays vehicles from vehicles.xml)
local isModelSwitcherTurnedOn = true	-- This value toggles the ped model switcher option found in the menu for officers (displays peds from below)
local isSpikeStripTurnedOn = true		-- This value toggles the spikestrip portion of the modification
local isUnitStatusesTurnedOn = true	-- This value toggles the unit status updates that are synced with dispatch (requires dispatch to be turned on)
local isSpeedZoneTurnedOn = true		-- This value toggles the restricted speed zone functionality
local speedZoneRadius = 20.0			-- This value sets the range of the speed zone (in METERS) [Must be a float (e.g. 0.0 or 1.4)


-- the following is used with fiskeyMods-Whitelist
local GeneralOfficerLevel = 6			-- This level gives the availability for basic police functions (access to menu, fine, cuff, search)
local AdvancedOfficerLevel = 7			-- This level gives the availability for the advanced police functions (access to above + breathalyzer + prop menu)
local SeniorOfficerLevel = 8			-- This level gives the availability for the senior police functions (access to above + tow/taxi + K9 + spikestrip + speedzone)
local DispatchOfficerLevel = 9			-- This level gives the availability for the advanced police functions (access to above + dispatch feature)


local weaponTable = {} -- !!!!!!!!!!!!!!!!!!!!!DO NOT EDIT THIS LINE !!!!!!!!!!!!!!!!!!!!!


-- Your officer starting duty weapons can be edited below.
-- You can find the weapon hashes here: https://www.se7ensins.com/forums/threads/weapon-and-explosion-hashes-list.1045035/
-- Note: the flashlight will always be equipped.

-- Format (the fully uppercase words are the ones you edit):
-- table.insert(weaponTable, {WEAPON_HASH, AMMO_COUNT, FLASHLIGHT}

table.insert(weaponTable, {0x678B81B1, 1, false}) -- Nightstick
table.insert(weaponTable, {0x5EF9FEC4, 80, true}) -- Combat Pistol
table.insert(weaponTable, {0x83BF0278, 120, true}) -- Carbine Rifle
table.insert(weaponTable, {0x1D073A89, 20, true}) -- Pump Shotgun
table.insert(weaponTable, {0x3656C8C1, 1, false}) -- Taser
table.insert(weaponTable, {0x060EC506, 100, false}) -- Fire Extinguisher
table.insert(weaponTable, {0x497FACC3, 25, false}) -- Flare



local pedModels = {} -- !!!!!!!!!!!!!!!!!!!!!DO NOT EDIT THIS LINE !!!!!!!!!!!!!!!!!!!!!

-- The ped models to add to the LEO menu prior to going on duty.
-- The model must be a string
-- Note: The default models are NOT included in this list
-- Note: This can be empty (e.g. nothing added to the table) -- the script will just skip it

-- Format (the fully uppercase word/hash are the ones you edit):
-- table.insert(pedModels, {"DISPLAY_NAME", "YOUR_MODEL_STRING"})

table.insert(pedModels, {"LSPD Male", "S_M_Y_COP_01"})
table.insert(pedModels, {"SWAT Male", "S_M_Y_SWAT_01"})


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


RegisterServerEvent('SERVER:LEO_LoadSettings')
AddEventHandler('SERVER:LEO_LoadSettings', function(source)
	TriggerClientEvent('LEO:CLIENT_LoadSettings1', source, tonumber(fineMax), tostring(fineMonetaryValue), alcoholLower, alcoholHigher, tostring(alcoholDescription), alcoholWarning, alcoholOver, tonumber(drugChance), K9DogModel, menuDescription)

	-- fine, alc, k9, radar, imperial, compass, status, speedZone, radius
	TriggerClientEvent('LEO:CLIENT_LoadSettings2', source, isFineTurnedOn, isTestTurnedOn, isK9TurnedOn, isRadarEnabled, isRadarInImperial, isCompassEnabled, isUnitStatusesTurnedOn, isSpeedZoneTurnedOn, speedZoneRadius)

	-- cuff, grab, search, spot, tow, panic, taxi, dispatch, prop, spawner, model
	TriggerClientEvent('LEO:CLIENT_LoadSettings3', source, isCuffTurnedOn, isGrabTurnedOn, isSearchTurnedOn, isSpotlightTurnedOn, isTowTurnedOn, isPanicTurnedOn, isTaxiTurnedOn, isDispatchTurnedOn, isPropEnabled, isSpikeStripTurnedOn, isVehicleSpawnerTurnedOn, isModelSwitcherTurnedOn)

	SendDepartments(source)
	SendWeapons(source)
	SendPedModels(source)
end)


function SendDepartments(source)
	for k,v in pairs(depts) do TriggerClientEvent('LEO:CLIENT_AddDepartment', source, ""..v) end
end

function SendWeapons(source)
	if (#weaponTable == 0) then return end

	for value = 1, #weaponTable do
		local weapon, ammo, flashlight = table.unpack(weaponTable[value])
		TriggerClientEvent('LEO:CLIENT_AddWeapon', source, weapon, ammo, flashlight)
	end
end

function SendPedModels(source)
	if (#pedModels == 0) then return end

	for value = 1, #pedModels do
		local name, model = table.unpack(pedModels[value])
		TriggerClientEvent('LEO:CLIENT_AddPedModel', source, name, model)
	end
end

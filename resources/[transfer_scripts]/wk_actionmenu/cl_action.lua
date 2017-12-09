--[[------------------------------------------------------------------------

	ActionMenu 
	Created by WolfKnight
	Additional help from lowheartrate, TheStonedTurtle, and Briglair. 

------------------------------------------------------------------------]]--

-- Define the variable used to open/close the menu 
local menuEnabled = false 

--[[------------------------------------------------------------------------
	ActionMenu Toggle
	Calling this function will open or close the ActionMenu. 
------------------------------------------------------------------------]]--
function ToggleActionMenu()
	-- Make the menuEnabled variable not itself 
	-- e.g. not true = false, not false = true 
	menuEnabled = not menuEnabled

	if ( menuEnabled ) then 
		-- Focuses on the NUI, the second parameter toggles the 
		-- onscreen mouse cursor. 
		SetNuiFocus( true, true )

		-- Sends a message to the JavaScript side, telling it to 
		-- open the menu. 
		SendNUIMessage({
			showmenu = true 
		})
	else 
		-- Bring the focus back to the game
		SetNuiFocus( false )

		-- Sends a message to the JavaScript side, telling it to
		-- close the menu.
		SendNUIMessage({
			hidemenu = true 
		})
	end 
end 

--[[------------------------------------------------------------------------
	ActionMenu HTML Callbacks
	This will be called every single time the JavaScript side uses the
	sendData function. The name of the data-action is passed as the parameter
	variable data. 
------------------------------------------------------------------------]]--
RegisterNUICallback( "ButtonClick", function( data, cb ) 
	if ( data == "button1" ) then 
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "Button: ^2 1 ^0pressed.")
		TriggerEvent('wk:deleteVehicle', -1)

	elseif ( data == "button2" ) then 
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "Button: ^2 2 ^0pressed.")
		--TriggerEvent('wk:fixVehicle', -1)
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "^2 Button Disabled.")
		
        --TriggerEvent("es:removedMoney", 500)
		
		-- Display notification
		--SetNotificationTextEntry("STRING")
		--AddTextComponentString('~g~Your vehicle has been fixed.~w~ Please try to RP it out next time or visit a customs shop.')
    	--SetNotificationMessage number values: 0+4+5+6= none, 1= message bubble, 2= mail icon, 3= add_friend, 7= reply, 8= RP, 9+10+_= $
		
		--SetNotificationMessage("CHAR_MP_MORS_MUTUAL", "CHAR_MP_MORS_MUTUAL", true, 9, "Mors Mutual", "Vehicle Fixed!")
		--DrawNotification(false, true)
		-- BUTTON 3 OR CVPI LSPD

	elseif ( data == "button3" ) then 
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "Button: ^2 3 ^0pressed.")
		TriggerEvent('VehicleSpawn', playerID, 'police')
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "^2Vehicle Spawned Successfully ^0(^1POLICE^0).")
			
		-- Display notification
		SetNotificationTextEntry("STRING")
		AddTextComponentString('POOF! Your car has arrived!')
    	--SetNotificationMessage number values: 0+4+5+6= none, 1= message bubble, 2= mail icon, 3= add_friend, 7= reply, 8= RP, 9+10+_= $
		SetNotificationMessage("CHAR_LS_CUSTOMS", "CHAR_LS_CUSTOMS", true, 1, "LS Customs", "Vehicle Spawned!")
		DrawNotification(false, true)

		-- BUTTON 4 OR TAURUS LSPD
	elseif ( data == "button4" ) then 
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "Button: ^2 4 ^0pressed.")
		local hash = GetHashKey("police2")

		RequestModel(hash)

		while not HasModelLoaded(hash) do
			RequestModel(hash)
			Citizen.Wait(0)
		end

		local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 5.0, 0)
		local vehicle = CreateVehicle(hash, coords, GetEntityHeading(GetPlayerPed(-1)), true, false)
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "^2Vehicle Spawned Successfully ^0(^1POLICE2^0).")
		-- Display notification
		SetNotificationTextEntry("STRING")
		AddTextComponentString('POOF! Your car has arrived!')
    	--SetNotificationMessage number values: 0+4+5+6= none, 1= message bubble, 2= mail icon, 3= add_friend, 7= reply, 8= RP, 9+10+_= $
		SetNotificationMessage("CHAR_LS_CUSTOMS", "CHAR_LS_CUSTOMS", true, 1, "LS Customs", "Vehicle Spawned!")
		DrawNotification(false, true)

		-- BUTTON 5 OR explorer LSPD (police3)
	elseif ( data == "button5" ) then 
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "Button: ^2 5 ^0pressed.")
		local hash = GetHashKey("police3")

		RequestModel(hash)

		while not HasModelLoaded(hash) do
			RequestModel(hash)
			Citizen.Wait(0)
		end

		local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 5.0, 0)
		local vehicle = CreateVehicle(hash, coords, GetEntityHeading(GetPlayerPed(-1)), true, false)
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "^2Vehicle Spawned Successfully ^0(^1POLICE3^0).")
		-- Display notification
		SetNotificationTextEntry("STRING")
		AddTextComponentString('POOF! Your car has arrived!')
    	--SetNotificationMessage number values: 0+4+5+6= none, 1= message bubble, 2= mail icon, 3= add_friend, 7= reply, 8= RP, 9+10+_= $
		SetNotificationMessage("CHAR_LS_CUSTOMS", "CHAR_LS_CUSTOMS", true, 1, "LS Customs", "Vehicle Spawned!")
		DrawNotification(false, true)

	-- BUTTON 6 OR Unmarked Charger (fbi)
	elseif ( data == "button6" ) then 
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "Button: ^2 6 ^0pressed.")
		local hash = GetHashKey("fbi")

		RequestModel(hash)

		while not HasModelLoaded(hash) do
			RequestModel(hash)
			Citizen.Wait(0)
		end

		local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 5.0, 0)
		local vehicle = CreateVehicle(hash, coords, GetEntityHeading(GetPlayerPed(-1)), true, false)
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "^2Vehicle Spawned Successfully ^0(^1FBI^0).")
		-- Display notification
		SetNotificationTextEntry("STRING")
		AddTextComponentString('POOF! Your car has arrived!')
    	--SetNotificationMessage number values: 0+4+5+6= none, 1= message bubble, 2= mail icon, 3= add_friend, 7= reply, 8= RP, 9+10+_= $
		SetNotificationMessage("CHAR_LS_CUSTOMS", "CHAR_LS_CUSTOMS", true, 1, "LS Customs", "Vehicle Spawned!")
		DrawNotification(false, true)

	-- BUTTON 7 OR FBI2
	elseif ( data == "button7" ) then 
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "Button: ^2 7 ^0pressed.")
		local hash = GetHashKey("fbi2")

		RequestModel(hash)

		while not HasModelLoaded(hash) do
			RequestModel(hash)
			Citizen.Wait(0)
		end

		local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 5.0, 0)
		local vehicle = CreateVehicle(hash, coords, GetEntityHeading(GetPlayerPed(-1)), true, false)
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "^2Vehicle Spawned Successfully ^0(^1FBI2^0).")
		-- Display notification
		SetNotificationTextEntry("STRING")
		AddTextComponentString('POOF! Your car has arrived!')
    	--SetNotificationMessage number values: 0+4+5+6= none, 1= message bubble, 2= mail icon, 3= add_friend, 7= reply, 8= RP, 9+10+_= $
		SetNotificationMessage("CHAR_LS_CUSTOMS", "CHAR_LS_CUSTOMS", true, 1, "LS Customs", "Vehicle Spawned!")
		DrawNotification(false, true)

	-- BUTTON 8 OR SHERIFF
	elseif ( data == "button8" ) then 
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "Button: ^2 8 ^0pressed.")
		local hash = GetHashKey("SHERIFF")

		RequestModel(hash)

		while not HasModelLoaded(hash) do
			RequestModel(hash)
			Citizen.Wait(0)
		end

		local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 5.0, 0)
		local vehicle = CreateVehicle(hash, coords, GetEntityHeading(GetPlayerPed(-1)), true, false)
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "^2Vehicle Spawned Successfully ^0(^1SHERIFF^0).")
		-- Display notification
		SetNotificationTextEntry("STRING")
		AddTextComponentString('POOF! Your car has arrived!')
    	--SetNotificationMessage number values: 0+4+5+6= none, 1= message bubble, 2= mail icon, 3= add_friend, 7= reply, 8= RP, 9+10+_= $
		SetNotificationMessage("CHAR_LS_CUSTOMS", "CHAR_LS_CUSTOMS", true, 1, "LS Customs", "Vehicle Spawned!")
		DrawNotification(false, true)

	-- BUTTON 9 OR SHERIFF2
	elseif ( data == "button9" ) then 
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "Button: ^2 9 ^0pressed.")
		local hash = GetHashKey("SHERIFF2")

		RequestModel(hash)

		while not HasModelLoaded(hash) do
			RequestModel(hash)
			Citizen.Wait(0)
		end

		local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 5.0, 0)
		local vehicle = CreateVehicle(hash, coords, GetEntityHeading(GetPlayerPed(-1)), true, false)
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "^2Vehicle Spawned Successfully ^0(^1SHERIFF^0).")
		-- Display notification
		SetNotificationTextEntry("STRING")
		AddTextComponentString('POOF! Your car has arrived!')
    	--SetNotificationMessage number values: 0+4+5+6= none, 1= message bubble, 2= mail icon, 3= add_friend, 7= reply, 8= RP, 9+10+_= $
		SetNotificationMessage("CHAR_LS_CUSTOMS", "CHAR_LS_CUSTOMS", true, 1, "LS Customs", "Vehicle Spawned!")
		DrawNotification(false, true)

	-- BUTTON 10 OR POLICE LOADOUT
	elseif ( data == "button10" ) then 
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "Button: ^2 11 ^0pressed.")
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), 250, 0, false)
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), 250, 0, false)
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), 250, 0, false)
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_NIGHTSTICK"), 1, 0, false)
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN"), 1, 0, false)
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMOKEGRENADE"), 20, 0, false)
		-- Display notification
		SetNotificationTextEntry("STRING")
		AddTextComponentString('Thank you for supporting your local governments militarization contract!')
    	--SetNotificationMessage number values: 0+4+5+6= none, 1= message bubble, 2= mail icon, 3= add_friend, 7= reply, 8= RP, 9+10+_= $
		SetNotificationMessage("CHAR_AMMUNATION", "CHAR_AMMUNATION", true, 1, "Ammunation", "Loaded Weapons!", "text")
		DrawNotification(false, true)

	-- BUTTON 11 OR CIV LOADOUT
	elseif ( data == "button11" ) then 
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "Button: ^2 11 ^0pressed.")
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 250, 0, false)
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_KNIFE"), 1, 0, false)
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HAMMER"), 1, 0, false)
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BAT"), 1, 0, false)
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR"), 1, 0, false)
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_POOLCUE"), 1, 0, false)
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SWITCHBLADE"), 1, 0, false)
		-- Display notification
		SetNotificationTextEntry("STRING")
		AddTextComponentString('Thank you for your purchase!')
    	--SetNotificationMessage number values: 0+4+5+6= none, 1= message bubble, 2= mail icon, 3= add_friend, 7= reply, 8= RP, 9+10+_= $
		SetNotificationMessage("CHAR_AMMUNATION", "CHAR_AMMUNATION", true, 1, "Ammunation", "Loaded Weapons!", "text")
		DrawNotification(false, true)

	-- BUTTON 12 OR HWAYCAR
	elseif ( data == "button12" ) then 
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "Button: ^2 12 ^0pressed.")
		local hash = GetHashKey("HWAYCAR")

		RequestModel(hash)

		while not HasModelLoaded(hash) do
			RequestModel(hash)
			Citizen.Wait(0)
		end

		local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 5.0, 0)
		local vehicle = CreateVehicle(hash, coords, GetEntityHeading(GetPlayerPed(-1)), true, false)
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "^2Vehicle Spawned Successfully ^0(^1HWAYCAR^0).")
		-- Display notification
		SetNotificationTextEntry("STRING")
		AddTextComponentString('POOF! Your car has arrived!')
    	--SetNotificationMessage number values: 0+4+5+6= none, 1= message bubble, 2= mail icon, 3= add_friend, 7= reply, 8= RP, 9+10+_= $
		SetNotificationMessage("CHAR_LS_CUSTOMS", "CHAR_LS_CUSTOMS", true, 1, "LS Customs", "Vehicle Spawned!")
		DrawNotification(false, true)

	-- BUTTON 13 OR HWAYCAR2
	elseif ( data == "button13" ) then 
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "Button: ^2 13 ^0pressed.")
		local hash = GetHashKey("HWAYCAR2")

		RequestModel(hash)

		while not HasModelLoaded(hash) do
			RequestModel(hash)
			Citizen.Wait(0)
		end

		local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 5.0, 0)
		local vehicle = CreateVehicle(hash, coords, GetEntityHeading(GetPlayerPed(-1)), true, false)
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "^2Vehicle Spawned Successfully ^0(^1HWAYCAR2^0).")
		-- Display notification
		SetNotificationTextEntry("STRING")
		AddTextComponentString('POOF! Your car has arrived!')
    	--SetNotificationMessage number values: 0+4+5+6= none, 1= message bubble, 2= mail icon, 3= add_friend, 7= reply, 8= RP, 9+10+_= $
		SetNotificationMessage("CHAR_LS_CUSTOMS", "CHAR_LS_CUSTOMS", true, 1, "LS Customs", "Vehicle Spawned!")
		DrawNotification(false, true)

	-- BUTTON 14 OR HWAYCAR3
	elseif ( data == "button14" ) then 
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "Button: ^2 14 ^0pressed.")
		local hash = GetHashKey("HWAYCAR3")

		RequestModel(hash)

		while not HasModelLoaded(hash) do
			RequestModel(hash)
			Citizen.Wait(0)
		end

		local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 5.0, 0)
		local vehicle = CreateVehicle(hash, coords, GetEntityHeading(GetPlayerPed(-1)), true, false)
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "^2Vehicle Spawned Successfully ^0(^1HWAYCAR3^0).")
		-- Display notification
		SetNotificationTextEntry("STRING")
		AddTextComponentString('POOF! Your car has arrived!')
    	--SetNotificationMessage number values: 0+4+5+6= none, 1= message bubble, 2= mail icon, 3= add_friend, 7= reply, 8= RP, 9+10+_= $
		SetNotificationMessage("CHAR_LS_CUSTOMS", "CHAR_LS_CUSTOMS", true, 1, "LS Customs", "Vehicle Spawned!")
		DrawNotification(false, true)

	-- BUTTON 15 OR HWAYCAR4
	elseif ( data == "button15" ) then 
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "Button: ^2 15 ^0pressed.")
		local hash = GetHashKey("HWAYCAR4")

		RequestModel(hash)

		while not HasModelLoaded(hash) do
			RequestModel(hash)
			Citizen.Wait(0)
		end

		local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 5.0, 0)
		local vehicle = CreateVehicle(hash, coords, GetEntityHeading(GetPlayerPed(-1)), true, false)
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "^2Vehicle Spawned Successfully ^0(^1HWAYCAR4^0).")
		-- Display notification
		SetNotificationTextEntry("STRING")
		AddTextComponentString('POOF! Your car has arrived!')
    	--SetNotificationMessage number values: 0+4+5+6= none, 1= message bubble, 2= mail icon, 3= add_friend, 7= reply, 8= RP, 9+10+_= $
		SetNotificationMessage("CHAR_LS_CUSTOMS", "CHAR_LS_CUSTOMS", true, 1, "LS Customs", "Vehicle Spawned!")
		DrawNotification(false, true)

	-- BUTTON 16 OR HWAYCAR5
	elseif ( data == "button16" ) then 
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "Button: ^2 16 ^0pressed.")
		local hash = GetHashKey("HWAYCAR5")

		RequestModel(hash)

		while not HasModelLoaded(hash) do
			RequestModel(hash)
			Citizen.Wait(0)
		end

		local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 5.0, 0)
		local vehicle = CreateVehicle(hash, coords, GetEntityHeading(GetPlayerPed(-1)), true, false)
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "^2Vehicle Spawned Successfully ^0(^1HWAYCAR5^0).")
		-- Display notification
		SetNotificationTextEntry("STRING")
		AddTextComponentString('POOF! Your car has arrived!')
    	--SetNotificationMessage number values: 0+4+5+6= none, 1= message bubble, 2= mail icon, 3= add_friend, 7= reply, 8= RP, 9+10+_= $
		SetNotificationMessage("CHAR_LS_CUSTOMS", "CHAR_LS_CUSTOMS", true, 1, "LS Customs", "Vehicle Spawned!")
		DrawNotification(false, true)

	-- BUTTON 17 OR HWAYCAR6
	elseif ( data == "button17" ) then 
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "Button: ^2 17 ^0pressed.")
		local hash = GetHashKey("HWAYCAR6")

		RequestModel(hash)

		while not HasModelLoaded(hash) do
			RequestModel(hash)
			Citizen.Wait(0)
		end

		local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 5.0, 0)
		local vehicle = CreateVehicle(hash, coords, GetEntityHeading(GetPlayerPed(-1)), true, false)
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "^2Vehicle Spawned Successfully ^0(^1HWAYCAR6^0).")
		-- Display notification
		SetNotificationTextEntry("STRING")
		AddTextComponentString('POOF! Your car has arrived!')
    	--SetNotificationMessage number values: 0+4+5+6= none, 1= message bubble, 2= mail icon, 3= add_friend, 7= reply, 8= RP, 9+10+_= $
		SetNotificationMessage("CHAR_LS_CUSTOMS", "CHAR_LS_CUSTOMS", true, 1, "LS Customs", "Vehicle Spawned!")
		DrawNotification(false, true)

	-- BUTTON 18 OR HWAYCAR6
	elseif ( data == "button18" ) then 
		ClearPlayerWantedLevel(GetPlayerID())
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "Button: ^2 18 ^0pressed.")
		local hash = GetHashKey("HWAYCAR7")

		RequestModel(hash)

		while not HasModelLoaded(hash) do
			RequestModel(hash)
			Citizen.Wait(0)
		end

		local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 5.0, 0)
		local vehicle = CreateVehicle(hash, coords, GetEntityHeading(GetPlayerPed(-1)), true, false)
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, "^2Vehicle Spawned Successfully ^0(^1HWAYCAR7^0).")
		-- Display notification
		SetNotificationTextEntry("STRING")
		AddTextComponentString('POOF! Your car has arrived!')
    	--SetNotificationMessage number values: 0+4+5+6= none, 1= message bubble, 2= mail icon, 3= add_friend, 7= reply, 8= RP, 9+10+_= $
		SetNotificationMessage("CHAR_LS_CUSTOMS", "CHAR_LS_CUSTOMS", true, 1, "LS Customs", "Vehicle Spawned!")
		DrawNotification(false, true)

	-- BUTTON 19 DEV
	elseif ( data == "button19" ) then
		local chk1 = CreateCheckpoint(0, -1170.0, -126.0, 25.0, -1561.6961669922, -177.5802154541, 55.518112182617, 27.0, 255, 221, 5, 100, 0)
		local pos1 = AddBlipForRadius(159.81178283691, -1018.026550293, 1.0, 1000.0)
		SetBlipColour(pos1, 2)
		SetBlipAlpha(pos1, 100)
		local p = GetEntityCoords(GetPlayerPed(-1), true)
		TriggerEvent("chatMessage", "DEBUG", {244, 179, 66}, p.x .. "," .. p.y)

	elseif ( data == "exit" ) then 
		-- We toggle the ActionMenu and return here, otherwise the function 
		-- call below would be executed too, which would just open the menu again 
		ToggleActionMenu()
		return 
	end 

	-- This will only be called if any button other than the exit button is pressed
	ToggleActionMenu()
end )


--[[------------------------------------------------------------------------
	ActionMenu Control and Input Blocking 
	This is the main while loop that opens the ActionMenu on keypress. It 
	uses the input blocking found in the ES Banking resource, credits to 
	the authors.
------------------------------------------------------------------------]]--
Citizen.CreateThread( function()
	-- This is just in case the resources restarted whilst the NUI is focused. 
	SetNuiFocus( false )

	while true do 
		-- Control ID 20 is the 'Z' key by default 
		-- Use https://wiki.fivem.net/wiki/Controls to find a different key 
		if ( IsControlJustPressed( 1, 20 ) ) then 
			ToggleActionMenu()
		end 

	    if ( menuEnabled ) then
            local ped = GetPlayerPed( -1 )	

            DisableControlAction( 0, 1, true ) -- LookLeftRight
            DisableControlAction( 0, 2, true ) -- LookUpDown
            DisableControlAction( 0, 24, true ) -- Attack
            DisablePlayerFiring( ped, true ) -- Disable weapon firing
            DisableControlAction( 0, 142, true ) -- MeleeAttackAlternate
            DisableControlAction( 0, 106, true ) -- VehicleMouseControlOverride
        end

		Citizen.Wait( 0 )
	end 
end )

function chatPrint( msg )
	TriggerEvent( 'chatMessage', "ActionMenu", { 255, 255, 255 }, msg )
end 

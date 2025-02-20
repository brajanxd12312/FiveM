local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
  }

-- Set weapon to 'hands' after the player is given them. Prevents spawning in with weapon in hand.
SetCurrentPedWeapon(GetPlayerPed(-1), 'WEAPON_UNARMED', 1)

--[[------------------------------------------------------------------------
    Remove Reticle on weapons
------------------------------------------------------------------------]]--
Citizen.CreateThread(function()
	local isSniper = false
	while true do
		Citizen.Wait(0)

    	local ped = GetPlayerPed(-1)

		
		--print(GetHashKey("WEAPON_SNIPERRIFLE"))
		local currentWeaponHash = GetSelectedPedWeapon(ped)

		if currentWeaponHash == 100416529 then
			isSniper = true
		elseif currentWeaponHash == 205991906 then
			isSniper = true
		elseif currentWeaponHash == -952879014 then
			isSniper = true
		elseif currentWeaponHash == GetHashKey('WEAPON_HEAVYSNIPER_MK2') then
			isSniper = true
		else
			isSniper = false
		end

		if not isSniper then
			HideHudComponentThisFrame(14)
		end
	end
end)

function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

	local scale = (1/dist)*20
	local fov = (1/GetGameplayCamFov())*100
	local scale = scale*fov

	SetTextScale(scaleX*scale, scaleY*scale)
	SetTextFont(fontId)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 250)
	SetTextDropshadow(1, 1, 1, 1, 255)
	SetTextEdge(2, 0, 0, 0, 150)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(textInput)
	SetDrawOrigin(x,y,z+2, 0)
	DrawText(0.0, 0.0)
	ClearDrawOrigin()
   end

-- test vehspawn
--{vehspawnpoint, x: 530.68072509766, y: -169.94007873535, z: 54.908996582031, hdg: 180.43055725098},
--{djhbskjvd, x: 533.78875732422, y: -183.14451599121, z: 53.891761779785, hdg: 93.942649841309}
local vehicle = GetHashKey('12charger')
local imploc = {x = 530.68, y = -169.94, z = 54.90}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		DrawMarker(23, 530.68, -169.94, 54.0, 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 0.5001, 5, 196, 72, 100, 0, 0, 0, 0)

		if GetDistanceBetweenCoords( imploc.x, imploc.y, imploc.z, GetEntityCoords(GetPlayerPed(-1))) < 50.0 then
			Draw3DText( imploc.x, imploc.y, imploc.z, "Import Cars", 7, 0.3, 0.2)
		end
				
		--[[ if GetDistanceBetweenCoords(530.68, -169.94, 54.90, GetEntityCoords(GetPlayerPed(-1))) < 1 then
            SetTextComponentFormat('STRING')
			AddTextComponentString('Press ~INPUT_CELLPHONE_SELECT~ to interact with circle.')
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			if IsControlJustPressed(1, 176) then
                RequestModel(vehicle)
                while not HasModelLoaded(vehicle) do
                    Citizen.Wait(0)
                end
                CreateVehicle(vehicle,  533.78, -183.14,  53.89, 93.94, true, false)
			end
		end ]]
	end
end)


--[[ RegisterNetEvent('farmg:c_classic')
AddEventHandler('farmg:c_classic', function()
	Citizen.Wait(0)
	local myPed = GetPlayerPed(-1)
	local player = PlayerId()
	local vehicle = GetHashKey('lspd1')
	RequestModel(vehicle)
	while not HasModelLoaded(vehicle) do
		Wait(1)
	end
	local plate = math.random(100, 900)
	local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 15.0, 0)
	local spawned_car = CreateVehicle(vehicle, coords, 2407.10864257813, 4958.5146484375, 44.6461868286133, true, false)
	SetVehicleOnGroundProperly(spawned_car)
	--SetPedIntoVehicle(myPed, spawned_car, - 1)
	SetModelAsNoLongerNeeded(vehicle)
	Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(spawned_car))
end) ]]
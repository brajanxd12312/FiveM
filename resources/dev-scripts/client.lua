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

-- test vehspawn
--{vehspawnpoint, x: 530.68072509766, y: -169.94007873535, z: 54.908996582031, hdg: 180.43055725098},

ESX.Game.SpawnVehicle('police', {
    x = '530.68',
    y = '-169.94',
    z = '54.90'
}, '180.43', 'null')
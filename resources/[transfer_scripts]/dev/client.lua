--[[ if not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") then
	RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK")
	while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do
		Citizen.Wait(0)
	end
end
SetPedIsDrunk(GetPlayerPed(-1), true)
ShakeGameplayCam("DRUNK_SHAKE", 2.0)
SetPedConfigFlag(GetPlayerPed(-1), 100, true)
SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@VERYDRUNK", 2.0) ]]

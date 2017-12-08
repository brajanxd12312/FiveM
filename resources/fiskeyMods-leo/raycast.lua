RegisterNetEvent("LEO:CLIENT_RaycastFront")
AddEventHandler("LEO:CLIENT_RaycastFront", function(source)
	Citizen.Trace("Attempting raycast")
	if (DoesEntityExist(GetPlayerPed(-1))) then
		local startPos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 0.3, 0.0) -- Get start position
		local targetPos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 1.5, 0.0) 	-- Get target position offset

		local rayHandle = StartShapeTestCapsule(startPos["x"], startPos["y"], startPos["z"], targetPos["x"], targetPos["y"], targetPos["z"], 1.0, 10, GetPlayerPed(-1), 7)
		local result, rayHitSuccessful, rayTargetCoords, raySurfaceNormal, rayEntityHit, ent2 = GetShapeTestResult(rayHandle)

		if rayHitSuccessful then -- Ray hit something
			Citizen.Trace("rayHitSuccessful; Ent type = "..GetEntityType(rayEntityHit))
			if (GetEntityType(rayEntityHit) == 1) then -- Check if the object is a ped
				local targetPed = GetPedIndexFromEntityIndex(rayEntityHit) -- Convert to ped
				Citizen.Trace("Ent exists: "..DoesEntityExist(targetPed))
				if (DoesEntityExist(targetPed) == 1) then
					Citizen.Trace("Does ent belong to script: "..tostring(DoesEntityBelongToThisScript(targetPed, 1)))
					SetEntityAsMissionEntity(targetPed, 1, 1)
					Citizen.Trace("Does ent belong to script: "..tostring(DoesEntityBelongToThisScript(targetPed, 1)))
					Citizen.Trace("Ped is player: "..tostring(IsPedAPlayer(targetPed)))
					if (IsPedAPlayer(targetPed) == 1) then
						Citizen.Trace("Is a player")
						if (NetworkIsPlayerConnected(NetworkGetPlayerIndexFromPed(targetPed))) then
							Citizen.Trace("Player is connected")
							TriggerServerEvent("LEO:SERVER_PlayerAcquired", source, NetworkGetPlayerIndexFromPed(targetPed))
						end
					else
						Citizen.Trace("Is ent local: "..NetworkGetEntityIsLocal(targetPed).."; Is ent network: "..NetworkGetEntityIsNetworked(targetPed))
						NetworkRequestControlOfEntity(targetPed)
						Citizen.Trace("Is ent local: "..NetworkGetEntityIsLocal(targetPed).."; Is ent network: "..NetworkGetEntityIsNetworked(targetPed))
						Citizen.Trace("Ambient ped acquired; NetIDFromEnt: "..NetworkGetNetworkIdFromEntity(targetPed).."; PedToNet: "..PedToNet(targetPed))
						TriggerServerEvent("LEO:SERVER_AmbientPedAcquired", source, NetworkGetNetworkIdFromEntity(targetPed))
					end
				end
			end
		end
	end
end)

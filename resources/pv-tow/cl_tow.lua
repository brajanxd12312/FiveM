local currentlyTowedVehicle = nil

RegisterNetEvent('pv:tow')
AddEventHandler('pv:tow', function()
	
	local playerped = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsIn(playerped, true)
	
	local towmodel = GetHashKey('flatbed')
	local isVehicleTow = IsVehicleModel(vehicle, towmodel)
			
	if isVehicleTow then
	
		local coordA = GetEntityCoords(playerped, 1)
		local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 5.0, 0.0)
		local targetVehicle = getVehicleInDirection(coordA, coordB)
		
		if currentlyTowedVehicle == nil then
			if targetVehicle ~= 0 then
				if not IsPedInAnyVehicle(playerped, true) then
					if vehicle ~= targetVehicle then
						AttachEntityToEntity(targetVehicle, vehicle, 20, -0.5, -5.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
						currentlyTowedVehicle = targetVehicle
						TriggerEvent("pNotify:SendNotification", {
							text = "<font size='3'>Vehicle successfully attached to towtruck!</font>",
							type = "success",
							timeout = 5000,
							layout = "centerRight",
							queue = "global",
							theme = "gta"
						})
					else
						TriggerEvent("pNotify:SendNotification", {
							text = "<font size='3'>Are you retarded? You cant tow your own towtruck with your own towtruck!</font>",
							type = "warning",
							timeout = 5000,
							layout = "centerRight",
							queue = "global",
							theme = "gta"
						})
					end
				end
			else
				TriggerEvent("pNotify:SendNotification", {
					text = "<font size='3'>Theres no vehicle to tow?</font>",
					type = "error",
					timeout = 5000,
					layout = "centerRight",
					queue = "global",
					theme = "gta"
				})
			end
		else
			AttachEntityToEntity(currentlyTowedVehicle, vehicle, 20, -0.5, -12.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
			DetachEntity(currentlyTowedVehicle, true, true)
			currentlyTowedVehicle = nil
			TriggerEvent("chatMessage", "[TowScript]", {255, 255, 0}, "The vehicle has been successfully detached!")
			TriggerEvent("pNotify:SendNotification", {
				text = "<font size='3'>The vehicle has been successfully detached!</font>",
				type = "success",
				timeout = 5000,
				layout = "centerRight",
				queue = "global",
				theme = "gta"
			})
		end
	end
end)

function getVehicleInDirection(coordFrom, coordTo)
	local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed(-1), 0)
	local a, b, c, d, vehicle = GetRaycastResult(rayHandle)
	return vehicle
end

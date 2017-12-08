RegisterNetEvent('VehicleSpawn')
AddEventHandler('VehicleSpawn', function(vehicleName)
  local myPed = GetPlayerPed(-1)
  local player = PlayerId()
  local vehicle = GetHashKey(vehicleName)
  RequestModel(vehicle)
  while not HasModelLoaded(vehicle) do
    Wait(1)
  end
  local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 5.0, 0)
  local spawned_car = CreateVehicle(vehicle, coords, GetEntityHeading(myPed), true, false)
  SetVehicleOnGroundProperly(spawned_car)
  SetModelAsNoLongerNeeded(vehicle)
  Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(spawned_car))
end)

Citizen.CreateThread(function()
  while true do
    Wait(1)
  end
end)

-- Display notification

--[[ 		SetNotificationTextEntry("STRING")
		AddTextComponentString('~s~Your Message has been sent to: ~w~')
    --SetNotificationMessage number values: 0+4+5+6= none, 1= message bubble, 2= mail icon, 3= add_friend, 7= reply, 8= RP, 9+10+_= $
		SetNotificationMessage("CHAR_LS_CUSTOMS", "CHAR_LS_CUSTOMS", true, 1, "sender", "Title", "text")
		DrawNotification(false, true) ]]

--TriggerClientEvent("tm:textsent", source, "CHAR_BANK_MAZE", 1, "Maze Bank", false, "debug message")

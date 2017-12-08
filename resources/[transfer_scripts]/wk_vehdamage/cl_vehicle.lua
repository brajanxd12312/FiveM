--[[------------------------------------------------------------------------
    Vehicle Damage Shit
------------------------------------------------------------------------]]--

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

local levelOfDamageToKillThisBitch = 975.0 

function IsValidVehicle( veh )
    local model = GetEntityModel( veh )

    if ( IsThisModelACar( model ) or IsThisModelABike( model ) or IsThisModelAQuadbike( model ) ) then  
        return true 
    else 
        return false 
    end 
end 

function ManageVehicleDamage()
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
        if ( IsPedSittingInAnyVehicle( ped ) ) then 
            local vehicle = GetVehiclePedIsIn( ped, false )

            if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) then 
                local damage = GetVehicleEngineHealth( vehicle )

                if ( damage < levelOfDamageToKillThisBitch and IsValidVehicle( vehicle ) ) then 
                    SetVehicleEngineHealth( vehicle, 300 )
                    SetVehicleEngineOn( vehicle, false, true )
                end 
            end  
        end 
    end 
end 

Citizen.CreateThread( function()
    while true do 
        ManageVehicleDamage()
        --HideHudComponentThisFrame(14)   --shamelessly take over script to disable crosshair

        Citizen.Wait( 0 )
    end 
end )


--[[------------------------------------------------------------------------
    Vehicle Fix
------------------------------------------------------------------------]]--
RegisterNetEvent( 'wk:fixVehicle' )
AddEventHandler( 'wk:fixVehicle', function() 
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
        if ( IsPedSittingInAnyVehicle( ped ) ) then 
            local vehicle = GetVehiclePedIsIn( ped, false )

            if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) then 
                SetVehicleEngineHealth( vehicle, 1000 )
                SetVehicleEngineOn( vehicle, true, true )
                SetVehicleFixed( vehicle )
            end  
        end 
    end 
end )
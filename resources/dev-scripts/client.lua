-- Set weapon to 'hands' after the player is given them. Prevents spawning in with weapon in hand.
SetCurrentPedWeapon(GetPlayerPed(-1), 'WEAPON_UNARMED', 1)

--[[------------------------------------------------------------------------
    Remove Reticle on ADS (Third Person)
------------------------------------------------------------------------]]--
local scopedWeapons = 
{
    100416529,  -- WEAPON_SNIPERRIFLE
    205991906,  -- WEAPON_HEAVYSNIPER
    3342088282  -- WEAPON_MARKSMANRIFLE
}

function HashInTable( hash )
    for k, v in pairs( scopedWeapons ) do 
        if ( hash == v ) then 
            return true 
        end 
    end 

    return false 
end 

function ManageReticle()
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
        local _, hash = GetCurrentPedWeapon( ped, true )

        if ( IsPlayerFreeAiming() and not HashInTable( hash ) ) then 
            HideHudComponentThisFrame( 14 )
        end 
    end 
end 

Citizen.CreateThread( function()
    while true do 
        ManageReticle()

        Citizen.Wait( 0 )
    end 
end )
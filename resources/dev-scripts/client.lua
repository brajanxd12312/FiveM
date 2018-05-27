-- Set weapon to 'hands' after the player is given them. Prevents spawning in with weapon in hand.
SetCurrentPedWeapon(GetPlayerPed(-1), 'WEAPON_UNARMED', 1)
--[[
---------------------------------------------------
LUXART VEHICLE CONTROL (FOR FIVEM)
---------------------------------------------------
Last revision: NOV 07 2016
Coded by Lt.Caine
---------------------------------------------------
NOTES
	
---------------------------------------------------
]]

-- REMOVED ANYTHING RELATED TO SIREN CONTROL // ONLY USED FOR INDICATORS

RegisterServerEvent("lvc_TogIndicState_s")
AddEventHandler("lvc_TogIndicState_s", function(newstate)
	TriggerClientEvent("lvc_TogIndicState_c", -1, source, newstate)
end)

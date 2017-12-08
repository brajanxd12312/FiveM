RegisterServerEvent('CIVILIAN:SERVER_PrivateMessage')
AddEventHandler('CIVILIAN:SERVER_PrivateMessage', function(target, source, msg)
	TriggerClientEvent('chatMessage', source, "PM", {0, 255, 0}, msg)
end)

RegisterServerEvent('SERVER:CIVILIAN_LEOResponse')
AddEventHandler('SERVER:CIVILIAN_LEOResponse', function(target, msg)
	print(""..target..""..msg)
	TriggerClientEvent('chatMessage', target, "^3[911 Dispatch Response]", {100, 150, 255}, ""..msg)
end)

RegisterServerEvent('SERVER:TriggerIDMessage')
AddEventHandler('SERVER:TriggerIDMessage', function(IDText, name, license)
	TriggerClientEvent('chatMessage', -1, ""..IDText, {24, 108, 219}, ""..name.."")

	if (license ~= "0") then
		TriggerClientEvent('chatMessage', -1, "^6License No.", {24, 108, 219}, ""..license.."")
	end
end)

local unpackTable = table.unpack or unpack
print("[FISKEY WHITELIST SERVER]: "..#players.." total players added")

-- Returns the access levels for the player (ignores index 1 bc that's the steam id)
function getvalues(index)
	local playervalues = players[index]
	local accessLevels = #playervalues - 1

	local returnValue
	for int = 2, #playervalues do
		if (returnValue == nil) then returnValue = ""..playervalues[int]
		else returnValue = returnValue..":"..playervalues[int] end
	end
	return returnValue
end


-- Loops through players and returns either the access levels if they are found or returns and spits an error 0
function GetPlayerFromID(id)
	for value = 1, #players do
		if (string.lower(id) == string.lower(players[value][1])) then return getvalues(value) end
	end
	print("[FISKEY WHITELIST SERVER]: **ERROR** Player with id {"..id.."} not found in list, check to make sure their steamID is correct")
	return 0
end

-- Starts the functions to get the player's ID
function TryGetPlayerValues(id)
	return GetPlayerFromID(id)
end


AddEventHandler('playerConnecting', function(playerName, setKickReason)
	if EnableKicking then
		local identifiers = GetPlayerIdentifiers(source)
		local isWhitelisted = false

		for _, v in ipairs(identifiers) do
			for value = 1, #players do
				if (string.lower(v) == string.lower(players[value][1])) then isWhitelisted = true end
			end
		end

		if not isWhitelisted then
			print("[FISKEY WHITELIST SERVER]: Auto-kicking player "..playerName)
			setKickReason(DeniedMessage)
			CancelEvent()
		end
	end
end)

RegisterServerEvent('SERVER:Whitelist_GetPlayerAccessLevels')
AddEventHandler('SERVER:Whitelist_GetPlayerAccessLevels', function(source, id, event)
	print("[FISKEY WHITELIST SERVER]: GetPlayerAccessLevels for player: "..source.." ID: "..id.." Returning event: "..event)
	local values = TryGetPlayerValues(id)
	if (values == nil) then
		print("[FISKEY WHITELIST SERVER]: Values returned: "..values)
		values = 0
	end
	TriggerClientEvent(event, source, ""..values)
end)

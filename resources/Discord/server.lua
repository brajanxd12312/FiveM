AddEventHandler('chatMessage', function(source, name, message)
  if message == nil or message == '' then return FALSE end
  PerformHttpRequest('https://discordapp.com/api/webhooks/384591963774517249/OhFiuBNmZ6DZTiMOyfnny1148eAUwm-ljVDXBrIYJEcNq9I4QBS62cxEGIWNe_YpfsOs', function(err, text, headers) end, 'POST', json.encode({content =  '📝 **' .. GetPlayerName(source) .. '** sent a message: `' .. message .. '`' }), { ['Content-Type'] = 'application/json' })
end)

function sendToDiscord(name, message)
  if message == nil or message == '' then return FALSE end
  PerformHttpRequest('https://discordapp.com/api/webhooks/384591963774517249/OhFiuBNmZ6DZTiMOyfnny1148eAUwm-ljVDXBrIYJEcNq9I4QBS62cxEGIWNe_YpfsOs', function(err, text, headers) end, 'POST', json.encode({content =  message }), { ['Content-Type'] = 'application/json' })
end

AddEventHandler('playerConnecting', function()
  sendToDiscord('SYSTEM', '✅ **' .. GetPlayerName(source) .. '** Joined.')
end)

AddEventHandler('playerDropped', function(reason)
  sendToDiscord('SYSTEM', '❌ **' .. GetPlayerName(source) .. '** Left. (`' .. reason .. '`)')
end)
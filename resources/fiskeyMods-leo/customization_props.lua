local props = {} -- !!!!!!!!!!!!!!!!!!DO NOT EDIT THIS LINE!!!!!!!!!!!!!!!!!!



-- The list of props to be added to the prop spawner.
-- You can find a list of props here: https://gist.github.com/leonardosnt/53faac01a38fc94505e9

-- Format (the fully uppercase words are the ones you edit):
-- table.insert(props, "PROP_NAME_HERE")


table.insert(props, "prop_barrier_work05")
table.insert(props, "prop_roadcone01a")
table.insert(props, "prop_roadcone01b")
table.insert(props, "prop_roadcone01c")
table.insert(props, "prop_roadcone02a")
table.insert(props, "prop_roadcone02b")
table.insert(props, "prop_roadcone02c")


-- DO NOT EDIT BELOW THIS LINE!!!!!! --
-- DO NOT EDIT BELOW THIS LINE!!!!!! --
-- DO NOT EDIT BELOW THIS LINE!!!!!! --
-- DO NOT EDIT BELOW THIS LINE!!!!!! --
-- DO NOT EDIT BELOW THIS LINE!!!!!! --
-- DO NOT EDIT BELOW THIS LINE!!!!!! --
-- DO NOT EDIT BELOW THIS LINE!!!!!! --
-- DO NOT EDIT BELOW THIS LINE!!!!!! --
-- DO NOT EDIT BELOW THIS LINE!!!!!! --
-- DO NOT EDIT BELOW THIS LINE!!!!!! --
-- DO NOT EDIT BELOW THIS LINE!!!!!! --



RegisterServerEvent('LEO:SERVER_LoadProps')
AddEventHandler('LEO:SERVER_LoadProps', function(source)
	SendProps(source)
end)

function SendProps(source)
	for k,v in pairs(props) do TriggerClientEvent('LEO:CLIENT_AddProp', source, v) end
end

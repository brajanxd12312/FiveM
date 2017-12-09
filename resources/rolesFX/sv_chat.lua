--- DO NOT REMOVE ME FROM THE CONFIG, ITS THERE TO GIVE ME CREDIT WHEN I JOIN SERVERS.
--- DO NOT REMOVE ME FROM THE CONFIG, ITS THERE TO GIVE ME CREDIT WHEN I JOIN SERVERS.
--- DO NOT REMOVE ME FROM THE CONFIG, ITS THERE TO GIVE ME CREDIT WHEN I JOIN SERVERS.
--- DO NOT REMOVE ME FROM THE CONFIG, ITS THERE TO GIVE ME CREDIT WHEN I JOIN SERVERS.
--- DO NOT REMOVE ME FROM THE CONFIG, ITS THERE TO GIVE ME CREDIT WHEN I JOIN SERVERS.



local Owner = {"steam:110000108527a21","ip:72.185.13.172",}
local HeadAdmin = {"steam:","ip:",}
local Admin = {"steam:1100001077941a6","ip:",}
local Moderator = {"steam:11000010719c575","ip:173.64.2.21 26","steam:110000106bc951f",}
local EMT = {"steam:","ip:",}
local Sheriff = {"steam:","ip:",}
local Moderator = {"steam:","ip:",}
local StateTroopers = {"steam:","ip:",}
local Test = {"steam:","ip:",}
local ScriptCreator = {"steam:","ip:",}


AddEventHandler('chatMessage', function(Source, Name, Msg)
    args = stringsplit(Msg, " ")
    CancelEvent()
    if string.find(args[1], "/") then
        local cmd = args[1]
        table.remove(args, 1)
    else     
        local player = GetPlayerIdentifiers(Source)[1]
        if has_value(Owner, player) then
            TriggerClientEvent('chatMessage', -1, "Owner | " .. Name, { 255, 0, 0 }, Msg)           
        elseif has_value(HeadAdmin, player) then
            TriggerClientEvent('chatMessage', -1, "Head Admin | " .. Name, { 255, 0, 0 }, Msg)
        elseif has_value(Admin, player) then
            TriggerClientEvent('chatMessage', -1, "Admin | " .. Name, { 255, 0, 0 }, Msg)
        elseif has_value(Moderator, player) then
            TriggerClientEvent('chatMessage', -1, "Moderator | " .. Name, { 0, 0, 255 }, Msg)
        elseif has_value(EMT, player) then
            TriggerClientEvent('chatMessage', -1, "EMT | " .. Name, { 0, 0, 255 }, Msg)
        elseif has_value(Sheriff, player) then
            TriggerClientEvent('chatMessage', -1, "Sheriff's Department | " .. Name, { 0, 0, 255 }, Msg)
	    elseif has_value(Moderator, player) then
            TriggerClientEvent('chatMessage', -1, "Moderator | " .. Name, { 0, 255, 247 }, Msg)
        elseif has_value(StateTroopers, player) then
            TriggerClientEvent('chatMessage', -1, "State Troopers | " .. Name, { 222, 0, 255 }, Msg)
		elseif has_value(Test, player) then
            TriggerClientEvent('chatMessage', -1, "State Troopers | HeadAdmin " .. Name, { 222, 0, 255 }, Msg)
		elseif has_value(ScriptCreator, player) then
            TriggerClientEvent('chatMessage', -1, "Chat Roles Creator | " .. Name, { 0, 255, 43 }, Msg)
        else
            TriggerClientEvent('chatMessage', -1, "User | " .. Name, { 235, 214, 51 }, Msg)
        end
            
    end
end)

function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

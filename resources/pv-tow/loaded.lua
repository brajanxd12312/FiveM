local value = pie

RegisterNetEvent('dv:test')
AddEventHandler('dv:test', function()
    if value == nil then
        TriggerEvent("pNotify:SendNotification", {
            text = "value = nil",
            type = "warning",
            timeout = 5000,
            layout = "centerRight",
            queue = "global",
            theme = "gta"
        })
    else
        TriggerEvent("pNotify:SendNotification", {
            text = "value =/= nil",
            type = "warning",
            timeout = 5000,
            layout = "centerRight",
            queue = "global",
            theme = "gta"
        })
    end
end)
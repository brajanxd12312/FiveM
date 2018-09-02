if cmd == "/notify2" then
    exports.pNotify:SetQueueMax("left", 4)

    for i = 0, 5 do
        exports.pNotify:SendNotification({
            text = "Testing Notification",
            type = "error",
            timeout = math.random(1000, 10000),
            layout = "centerLeft",
            queue = "left"
        })
    end
end
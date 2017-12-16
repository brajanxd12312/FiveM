-- Huge server file.

local interiors = {
	[1] = { ["xe"] = 1848.50, ["ye"] = 3689.97, ["ze"] = 34.26, ["he"] = 321.7075, ["xo"] = 1844.0, ["yo"] = 3660.034, ["zo"] = -116.789, ["ho"] = 300, ["name"] = 'SandyShores Interior'},
}

RegisterServerEvent("interiors:sendData_s")
AddEventHandler("interiors:sendData_s", function()
    TriggerClientEvent("interiors:f_sendData", source, interiors)
end)

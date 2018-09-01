ketchup = false
dish = "Banana"
quantity = 1
_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Import Cars", "~b~Import Vehicle Store")
_menuPool:Add(mainMenu)

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end


function AddMenuCook(menu)
    local newitem = NativeUI.CreateItem("Cook!", "Cook the dish with the appropriate ingredients and ketchup.")
    newitem:SetLeftBadge(BadgeStyle.Star)
    newitem:SetRightBadge(BadgeStyle.Tick)
    menu:AddItem(newitem)
    menu.OnItemSelect = function(sender, item, index)
        if item == newitem then
            local string = "You have ordered ~r~" .. quantity .. " ~b~"..dish.."(s)~w~ ~r~with~w~ ketchup."
            if not ketchup then
                string = "You have ordered ~r~" .. quantity .. " ~b~"..dish.."(s)~w~ ~r~without~w~ ketchup."
            end
            ShowNotification(string)
        end
    end
    menu.OnIndexChange = function(sender, index)
        if sender.Items[index] == newitem then
            newitem:SetLeftBadge(BadgeStyle.None)
        end
    end
end

function AddVehicle16Charger(menu)
    local newcar = NativeUI.CreateItem("Purcharse 2016 Dodge Charger", "$42,000")
    menu:AddItem(newcar)
    menu.OnItemSelect = function(sender, item, index)
        if item == newitem then
            local string = "You have ordered ~r~" .. quantity .. " ~b~"..dish.."(s)~w~ ~r~with~w~ ketchup."
            ShowNotification(string)
        end
    end
end

function AddMenuAnotherMenu(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Another Menu")
    for i = 1, 20, 1 do
        submenu:AddItem(NativeUI.CreateItem("PageFiller", "Sample description that takes more than one line. Moreso, it takes way more than two lines since it's so long. Wow, check out this length!"))
    end
end

AddVehicle16Charger(mainmenu)
AddMenuCook(mainMenu)
AddMenuAnotherMenu(mainMenu)
_menuPool:RefreshIndex()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        if GetDistanceBetweenCoords(530.68, -169.94, 54.90, GetEntityCoords(GetPlayerPed(-1))) < 1 then
            SetTextComponentFormat('STRING')
            AddTextComponentString('Press ~INPUT_CELLPHONE_SELECT~ to interact with circle.')
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            if IsControlJustPressed(1, 176) then
                mainMenu:Visible(not mainMenu:Visible())
            end
        end
    end
end)


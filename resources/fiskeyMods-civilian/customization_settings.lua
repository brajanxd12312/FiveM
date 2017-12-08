-- CIVILIAN FIVEM MODIFICATION BY FISKEY111 --
-- HUGE THANK YOU TO ALEXGUIRRE OF LCPDFR.COM FOR ALL HIS HELP! --

-- YOU CAN EDIT THIS FILE! --

-- A string is any number of values on the keyboard, surrounded by quotations.  E.g.:  "The dog runs fast"  or  "The cat goes moo"
-- There is a limit to the length strings, as the chat box can only handle so many.


-- PRIVATE MESSAGING: Send a PM over chat
local EnablePM = true			-- Private Message Toggle: Accepted values -> true/false [coming soon]


-- IDENTIFICATION: Display your ID in a notification
local EnableID = true									-- Identification: Accepted values -> true/false
local IDText = "^4San Andreas State Identification"		-- ID Text: Accepted values -> Any string (any normal characters inside quotations)
local EnableLicenseNumber = true						-- ID License Number: Accepted values -> true/false

-- 911 Calling Feature
local Enable911 = true -- This enables the 911 calling feature built into the menu (**requires my LEO script as well**)



-- STORES: Not supported yet
-- Store Enabler: Accepted values -> true/false
local EnableStore = false



-- DO NOT EDIT BELOW THIS LINE!!!!!! --


RegisterServerEvent('SERVER:Civilian_LoadSettings')
AddEventHandler('SERVER:Civilian_LoadSettings', function(source)
	print("Sending CI settings to player: "..source.."")
	TriggerClientEvent('CLIENT:Civilian_LoadSettings', source, EnableStore, EnableID, EnableLicenseNumber, IDText, Enable911)
end)

players ={}

--[[

Levels are determined in the settings for each of my mods
Anyone not on this list will not have access to my mods.




Examples [using default values]:

GeneralFireLevel = 3 	*Found in fiskeyMods-fire/customization_settings.lua
AdvancedFireLevel = 4	*^
AdminFireLevel = 5		*^

GeneralOfficerLevel = 6			*Found in fiskeyMods-leo/customization_settings.lua
AdvancedOfficerLevel = 7		*^
SeniorOfficerLevel = 8			*^
DispatchOfficerLevel = 9		*^

Example of a player with access to the general fire script but not police:
table.insert(players, {"steam:0938123712312803", 3})

Example of a player with access to both admin fire and general police script:
table.insert(players, {"steam:0938123712312803", 5, 6})

Example of a player with access to neither the fire nor police script:
table.insert(players, {"steam:0938123712312803"})


***INCORRECT EXAMPLE:***
table.insert(players, {"steam:0938123712312803", 3, 7, 8})
**YOU CANNOT PUT MORE THAN ONE LEVEL FROM EACH SCRIPT -- PUT THE LEVEL YOU WANT THE PERSON TO HAVE




In order to get a player's steam ID hexadecimal (used in checking) do the following:

1. Ask for the players steam ID (search google if you don't know how to find it)
2. Put that value into here: https://steamid.io/ and copy the "steamID64" result
3. Take that "steamID64" value and paste it in the "Decimal Value" box here: http://www.binaryhexconverter.com/decimal-to-hex-converter
4. The "Hexadecimal" value is the players steam hexadecmial value!


***********DON'T FORGET -- A TOOL WAS PACKAGED WITH THIS SCRIPT THAT WILL ALLOW EASY PLAYER ADDING -- USE THAT TOOL!!!**********


**NOTE: IPs *should* work, simply replace "steam:0000000000000000" with their IP (e.g. "12.34.567.8")
I cannot promise it does though, I recommend utilizing steam IDs.


]]--


-- Enable/Disable auto-kicking
-- Toggle this to false if you don't want to use this whitelist to kick people
EnableKicking = true

-- DeniedMessage -> The message sent to the player if they are denied access for not being whitelisted
DeniedMessage = "You are not whitelisted..."

-- ***PASTE ALL YOUR PLAYERS BELOW THIS LINE*** --

table.insert(players, {"steam:110000108527a21", 9, 5})
table.insert(players, {"steam:1100001077941a6", 8, 4})
table.insert(players, {"steam:110000106bc951f", 8, 4})
table.insert(players, {"steam:11000010719c575", 8, 4})
table.insert(players, {"steam:1100001119f573b", 7, 4})
table.insert(players, {"steam:11000010c3e98b8", 7, 4})
table.insert(players, {"steam:11000011d20b95c", 8, 4})
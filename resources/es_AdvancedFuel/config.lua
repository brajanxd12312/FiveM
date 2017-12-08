petrolCanPrice = 13.45

lang = "en"
-- lang = "fr"

settings = {}
settings["en"] = {
	openMenu = "Press ~g~E~w~ to open the menu.",
	electricError = "~r~You have an electric vehicle.",
	fuelError = "~r~You're not at a pump.",
	buyFuel = "Buy Fuel",
	liters = "Gallons",
	percent = "percent",
	confirm = "Confirm",
	fuelStation = "Gas Station",
	boatFuelStation = "Fuel Station | Boat",
	avionFuelStation = "Fuel Station | Plane ",
	heliFuelStation = "Fuel Station | Helicopter",
	getJerryCan = "Press ~g~E~w~ to buy a Petrol can for $"..petrolCanPrice..".",
	refeel = "Press ~g~E~w~ to refeel? the car.",
	YouHaveBought = "You have bought ",
	fuel = " gallons of fuel",
	price = "Price"
}

settings["fr"] = {
	openMenu = "Appuyez sur ~g~E~w~ pour ouvrir le menu.",
	electricError = "~r~Vous avez une voiture électrique.",
	fuelError = "~r~Vous n'êtes pas au bon endroit.",
	buyFuel = "acheter de l'essence",
	liters = "litres",
	percent = "pourcent",
	confirm = "Valider",
	fuelStation = "Station essence",
	boatFuelStation = "Station d'essence | Bateau",
	avionFuelStation = "Station d'essence | Avions",
	heliFuelStation = "Station d'essence | Hélicoptères",
	getJerryCan = "Appuyez sur ~g~E~w~ pour acheter un bidon d'essence ("..petrolCanPrice.."$)",
	refeel = "Appuyez sur ~g~E~w~ pour remplir votre voiture d'essence.",
	YouHaveBought = "Vous avez acheté ",
	fuel = " litres d'essence",
	price = "prix"
}


showBar = false
showText = true


hud_form = 1 -- 1 : Vertical | 2 = Horizontal
hud_x = 0.175 
hud_y = 0.885

text_x = 0.2575
text_y = 0.975


electricityPrice = 1 -- NOT RANOMED !!

randomPrice = false --Random the price of each stations
price = 2.69 --If random price is on False, set the price here for 1 liter
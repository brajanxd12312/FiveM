vcf_files = {
	'ambulance.xml',
	'corvan.xml',
	'fbi.xml',
	'fbi2.xml',
	'fbi3.xml',
	'fbi4.xml',
	'fbi5.xml',
	'fbi6.xml',
	'firetruk.xml',
	'flatbed.xml',
	'lspd1.xml',
	'lspd2.xml',
	'lspd3.xml',
	'lspd4.xml',
	'lspd5.xml',
	'lspd6.xml',
	'lspd7.xml',
	'police.xml',
	'police2.xml',
	'police3.xml',
	'police4.xml',
	'police5.xml',
	'policeb.xml',
	'policet.xml',
	'pranger.xml',
	'riot.xml',
	'sheriff.xml',
	'sheriff2.xml',
	'sheriff3.xml',
	'towtruck.xml',
}

pattern_files = {
	"COMPLEX.xml",
	"LEFTRIGHTDF.xml",
	"T_ADVIS_RIGHT_LEFT.xml",
	"T_ADVIS_LEFT_RIGHT.xml",
	"T_ADVIS_BACKFOURTH.xml"
}

modelsWithTrafficAdvisor = {
	"FBI2",
	'flatbed'
}

modelsWithFireSiren =
{
    "FIRETRUK"
}


modelsWithAmbWarnSiren =
{   
    "AMBULANCE",
    "FIRETRUK",
    "LGUARD"
}

stagethreewithsiren = false
playButtonPressSounds = true
vehicleStageThreeAdvisor = {
	"FBI3",
	'flatbed'
}


vehicleSyncDistance = 150
envirementLightBrightness = 0.025

build = "master"

shared = {
	horn = 86,
}

keyboard = {
	modifyKey = 132,
	stageChange = 85,
	guiKey = 243,
	takedown = 245,
	siren = {
		tone_one = 157,
		tone_two = 158,
		tone_three = 160,
		dual_toggle = 164,
		dual_one = 165,
		dual_two = 159,
		dual_three = 161,
	},
	pattern = {
		primary = 246,
		secondary = 303,
		advisor = 182,
	},
}

controller = {
	modifyKey = 73,
	stageChange = 80,
	takedown = 74,
	siren = {
		tone_one = 173,
		tone_two = 85,
		tone_three = 172,
	},
}
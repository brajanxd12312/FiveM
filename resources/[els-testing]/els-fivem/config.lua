vcf_files = {
	'ambulance.xml',
	'bcso1.xml',
	'bcso2.xml',
	'bcso3.xml',
	'bcso4.xml',
	'bcso5.xml',
	'bcso6.xml',
	'corvan.xml',
	'esu.xml',
	'fbi.xml',
	'fbi2.xml',
	'fbi3.xml',
	'fbi4.xml',
	'fbi5.xml',
	'fbi6.xml',
	'firetruk.xml',
	'flatbed.xml',
	'hwaycar1.xml',
	'hwaycar2.xml',
	'hwaycar3.xml',
	'hwaycar4.xml',
	'hwaycar5.xml',
	'hwaycar6.xml',
	'hwaycar7.xml',
	'hwaycar8.xml',
	'hwaycar9.xml',
	'hwaycar10.xml',
	'hwaycar11.xml',
	'hwaycar12.xml',
	'hwaycar13.xml',
	'hwaycar14.xml',
	'hwaycar15.xml',
	'hwaycar16.xml',
	'lsfd1.xml',
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
	"dv_custom.xml",
	"LEFTRIGHTDF.xml",
	'chp.xml',
	"COMPLEX.xml",
	"outsideburn.xml",
	"T_ADVIS_RIGHT_LEFT.xml",
	"T_ADVIS_LEFT_RIGHT.xml",
	"T_ADVIS_BACKFOURTH.xml",
	"T_ADVIS_FLASH.xml"
}

modelsWithTrafficAdvisor = {
	'flatbed',
	'hwaycar1',
	'hwaycar5',
	'police2'
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
	'flatbed',
	'hwaycar1',
	'police2'
}


vehicleSyncDistance = 150
envirementLightBrightness = 0.025

panelOffsetX = 0.0
panelOffsetY = 0.0

shared = {
	horn = 86,
}

keyboard = {
	modifyKey = 132,
	stageChange = 85,
	guiKey = 199,
	takedown = 83,
	siren = {
		tone_one = 157,
		tone_two = 158,
		tone_three = 160,
		dual_toggle = 79,
		dual_one = 164,
		dual_two = 165,
		dual_three = 159,
	},
	pattern = {
		primary = 163,
		secondary = 162,
		warning = 161,
	},
	warning = 246,
	secondary = 303,
	primary = 7,
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
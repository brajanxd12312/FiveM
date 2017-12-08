resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

-- Example custom radios
supersede_radio "RADIO_02_POP" { url = "http://stream.radioreklama.bg/city.ogg", volume = 0.2, name = "Radio City" }
supersede_radio "RADIO_07_DANCE_01" { url = "http://mp3.stream.tb-group.fm/tt.ogg", volume = 0.2, name = "24hr Dance" }
supersede_radio "RADIO_04_PUNK" { url = "http://relay-nyc.gameowls.com:8000/ocremix.ogg", volume = 0.2, name = "wut..." }

files {
	"index.html"
}

ui_page "index.html"

client_scripts {
	"data.js",
	"client.js"
}

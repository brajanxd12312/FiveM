resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

-- Example custom radios
supersede_radio "RADIO_02_POP" { url = "http://stream.radioreklama.bg/nrj.ogg", volume = 0.2, name = "Energy Radio" }
supersede_radio "RADIO_04_PUNK" { url = "http://stream.radioreklama.bg/nova_low.ogg", volume = 0.2, name = "NOVA Radio" }

files {
	"index.html"
}

ui_page "index.html"

client_scripts {
	"data.js",
	"client.js"
}

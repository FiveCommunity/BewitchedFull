fx_version "bodacious"
game "gta5"
lua54 "yes"

ui_page "web/index.html"

client_scripts {
    "@PolyZone/client.lua",
	"@vrp/config/Native.lua",
	"@vrp/lib/Utils.lua",
	"client/*"
}

server_scripts {
	"@vrp/config/License.lua",
	"@vrp/config/Item.lua",
	"@vrp/lib/Utils.lua",
	"server/*"
}

files {
	"web/*",
	"web/**/*"
}
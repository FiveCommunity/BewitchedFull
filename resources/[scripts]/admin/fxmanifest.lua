fx_version "bodacious"
game "gta5"
lua54 "yes"

client_scripts {
	"@vrp/config/Native.lua",
	"@PolyZone/client.lua",
	"@vrp/lib/Utils.lua",
	"client/*"
}

server_scripts {
	"@vrp/config/Global.lua",
	"@vrp/config/Groups.lua",
	"@vrp/config/Item.lua",
	"@vrp/lib/Utils.lua",
	"server/*"
}

shared_scripts {
	"@vrp/config/Item.lua",
	"@vrp/config/Vehicle.lua",
	"@vrp/config/Global.lua",
	"@vrp/config/Groups.lua",
	"@vrp/config/Drops.lua"
}
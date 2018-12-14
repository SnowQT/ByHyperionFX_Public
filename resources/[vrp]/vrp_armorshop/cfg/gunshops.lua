
local cfg = {}
-- list of weapons for sale
-- for the native name, see https://wiki.fivem.net/wiki/Weapons (not all of them will work, look at client/player_state.lua for the real weapon list)
-- create groups like for the garage config
-- [native_weapon_name] = {display_name,body_price,ammo_price,description}
-- ammo_price can be < 1, total price will be rounded

-- _config: blipid, blipcolor, permissions (optional, only users with the permission will have access to the shop)

cfg.gunshop_types = {
	["Våbenbutik"] = {
		_config = {blipid=110,blipcolor=1},
		["ARMOR1"] = {"Skudsikker vest",75000,0,""},
		["WEAPON_FLASHLIGHT"] = {"Lommelygte",5000,0,""},
		["WEAPON_KNIFE"] = {"Kniv",20000,0,""},
		["WEAPON_BAT"] = {"Baseballbat",25000,0,""},
		["WEAPON_CROWBAR"] = {"Brækjern",20000,0,""},
		["WEAPON_KNUCKLE"] = {"Knojern",20000,0,""},
		["WEAPON_WRENCH"] = {"Svensknøgle",20000,0,""},
		["WEAPON_SWITCHBLADE"] = {"Foldekniv",20000,0,""},
		["WEAPON_BATTLEAXE"] = {"Kampøkse",20000,0,""},
		["WEAPON_BALL"] = {"Baseball bold",2000,0,""},
		["WEAPON_GOLFCLUB"] = {"Golfkølle",20000,0,""},
		["WEAPON_HAMMER"] = {"Hammer",20000,0,""}
	},
	["Politi"] = {
		_config = {blipid=175,blipcolor=38, permissions = {"police.bodyarmor"}},
		["ARMOR"] = {"Skudsikker vest",0,0,""},
		["WEAPON_CARBINERIFLE"] = {"[AKS] Karbin-riffel",0,0,""},
		["WEAPON_SNIPERRIFLE"] = {"[AKS] Finskytte-riffel",0,0,""},
		["WEAPON_SMOKEGRENADE"] = {"Tåregas",0,0,""}
	},
	["FBI Information"] = {
		_config = {blipid=175,blipcolor=38, permissions = {"pet.whitelisted"}},
		["ARMOR"] = {"Skudsikker vest",0,0,""},
		["WEAPON_COMBATPISTOL"] = {"Håndpistol",0,0,""}
	}
}
-- list of gunshops positions

cfg.gunshops = {
	{"Våbenbutik", 1692.41, 3758.22, 34.7053,false},
	{"Våbenbutik", 252.696, -48.2487, 69.941,false},
	{"Våbenbutik", 844.299, -1033.26, 28.1949,false},
	{"Våbenbutik", -331.624, 6082.46, 31.4548,false},
	{"Våbenbutik", -664.147, -935.119, 21.8292,false},
	{"Våbenbutik", -1305.4624, -392.4640, 36.6957,false},
	{"Våbenbutik", -1119.4880,2697.0866,18.554,false},
	{"Våbenbutik", 2569.62, 294.453, 108.735,false},
	{"Våbenbutik", -3172.6037,1085.7481,20.8387,false},
	{"Våbenbutik", 21.70, -1107.41, 29.79,false},
	{"Våbenbutik", 810.15, -2156.88, 29.61,false},
	{"Politi", 460.597,-981.05,30.68,true}
}

return cfg
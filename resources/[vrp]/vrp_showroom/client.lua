
vRP = Proxy.getInterface("vRP")
vRPg = Proxy.getInterface("vRP_garages")

function deleteVehiclePedIsIn()
	local v = GetVehiclePedIsIn(GetPlayerPed(-1),false)
	SetVehicleHasBeenOwnedByPlayer(v,false)
	SetEntityAsMissionEntity(v, false, true) -- set not as mission entity
	SetVehicleAsNoLongerNeeded(Citizen.PointerValueIntInitialized(v))
	DeleteEntity(v)
end

local vehshop = {
	opened = false,
	title = "Bilforhandler",
	currentmenu = "Bilforhandler",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 0, g = 155, b = 255, a = 200, type = 1 },
	menu = {
		x = 0.2,
		y = 0.08,
		width = 0.25,
		height = 0.04,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.4,
		font = 0,
		["Bilforhandler"] = {
			title = "Bilforhandler",
			name = "Bilforhandler",
			buttons = {
				{name = "Biler", description = ""},
				{name = "Motorcykler", description = ""},
				{name = "Cykler", description = ""},
				{name = "Tilbuds biler", description = ""},
				{name = "Tilbuds motorcykler", description = ""}
			}
		},
		["Biler"] = {
			title = "Biler",
			name = "Biler",
			buttons = {
				{name = "Coupéer", description = ''},
				{name = "Kompakte", description = ''},
				{name = "Muskelbiler", description = ''},
				{name = "Offroad", description = ''},
				{name = "Sedaner", description = ''},
				{name = "Sportsklassikere", description = ''},
				{name = "Sportsvogne", description = ''},
				{name = "Superbiler", description = ''},
				{name = "SUV", description = ''},
				{name = "Varevogne", description = ''},
			}
		},
		["Tilbuds biler"] = {
			title = "Tilbuds biler",
			name = "Tilbuds biler",
			buttons = {
				{name = "Baller LE LWB", costs = 1850000, description = {}, model = "baller4"},
				{name = "Dominator GTX", costs = 2500000, description = {}, model = "dominator3"},
				{name = "Maserati Ghibli S", costs = 7500000, description = {}, model = "ghibli"}
			}
		},
		["Tilbuds motorcykler"] = {
			title = "Tilbuds motorcykler",
			name = "Tilbuds motorcykler",
			buttons = {
				{name = "Randers knallert", costs = 100000, description = {}, model = "faggio"}
			}
		},
		["Kompakte"] = {
			title = "Kompakte",
			name = "Kompakte",
			buttons = {
				{name = "Blista", costs = 97500, description = {}, model = "blista"},
				{name = "Brioso R/A", costs = 120000, description = {}, model = "brioso"},
				{name = "Dilettante", costs = 52500, description = {}, model = "dilettante"},
				{name = "Futo", costs = 112500, description = {}, model = "futo"},
				{name = "Issi", costs = 412500, description = {}, model = "issi2"},
				{name = "Panto", costs = 24000, description = {}, model = "panto"},
				{name = "Peugeot 308", costs = 385000, description = {}, model = "peug308"},
				{name = "Prairie", costs = 56000, description = {}, model = "prairie"},
				{name = "Rhapsody", costs = 25000, description = {}, model = "rhapsody"},
				{name = "VW Golf 6", costs = 685000, description = {}, model = "vwmk6"},
			}
		},
		["Coupéer"] = {
			title = "Coupéer",
			name = "Coupéer",
			buttons = {
  				{name = "Cognoscenti Cabrio", costs = 300000, description = {}, model = "cogcabrio"},
				{name = "Exemplar", costs = 615000, description = {}, model = "exemplar"},
				{name = "F620", costs = 375000, description = {}, model = "f620"},
				{name = "Felon", costs = 675000, description = {}, model = "felon"},
				{name = "Felon GT", costs = 480000, description = {}, model = "felon2"},
				{name = "Jackal", costs = 630000, description = {}, model = "jackal"},
				{name = "Oracle", costs = 210000, description = {}, model = "oracle"},
				{name = "Oracle XS", costs = 180000, description = {}, model = "oracle2"},
				{name = "Sentinel", costs = 360000, description = {}, model = "sentinel"},
				{name = "Sentinel XS", costs = 330000, description = {}, model = "sentinel2"},
				{name = "Windsor", costs = 1275000, description = {}, model = "windsor"},
				{name = "Windsor Drop", costs = 1750000, description = {}, model = "windsor2"},
				{name = "Zion", costs = 187500, description = {}, model = "zion"},
				{name = "Zion Cabrio", costs = 225000, description = {}, model = "zion2"}
			}
		},
		["Sportsvogne"] = {
			title = "Sportsvogne",
			name = "Sportsvogne",
			buttons = {
				{name = "9F", costs = 2700000, description = {}, model = "ninef"},
				{name = "9F Cabrio", costs = 3600000, description = {}, model = "ninef2"},
				{name = "Alpha", costs = 1200000, description = {}, model = "alpha"},
				{name = "Audi TTS", costs = 2250000, description = {}, model = "tts"},
				{name = "Banshee", costs = 570000, description = {}, model = "banshee"},
				{name = "Bestia GTS", costs = 1065000, description = {}, model = "bestiagts"},
				{name = "Blista Compact", costs = 180000, description = {}, model = "blista"},
				{name = "BMW M2", costs = 1875000, description = {}, model = "m2"},
				{name = "BMW M3 E92", costs = 2625000, description = {}, model = "bmwm3"},
				{name = "BMW M3 F80", costs = 2775000, description = {}, model = "m3f80"},
				{name = "BMW M4 F82", costs = 3000000, description = {}, model = "f82"},
				{name = "Buffalo", costs = 420000, description = {}, model = "buffalo"},
				{name = "Buffalo S", costs = 480000, description = {}, model = "buffalo2"},
				{name = "Carbonizzare", costs = 506250, description = {}, model = "carbonizzare"},
				{name = "Chevrolet Corvette C1", costs = 2900000, description = {}, model = "cc1"},
				{name = "Comet", costs = 270000, description = {}, model = "comet2"},
				{name = "Coquette", costs = 420000, description = {}, model = "coquette"},
				{name = "Drift Tampa", costs = 1875000, description = {}, model = "tampa2"},
				{name = "Elegy RH8", costs = 270000, description = {}, model = "elegy"},
				{name = "Fiat 124 Spider", costs = 680000, description = {}, model = "124spider"},
				{name = "Ford Focus RS", costs = 1275000, description = {}, model = "focusrs"},
				{name = "Furore GT", costs = 420000, description = {}, model = "furoregt"},
				{name = "Fusilade", costs = 112500, description = {}, model = "fusilade"},
				{name = "Hijak Ruston", costs = 1355000, description = {}, model = "ruston"},
				{name = "Itali GTB", costs = 945000, description = {}, model = "italigtb"},
				{name = "Jester", costs = 570000, description = {}, model = "jester"},
				{name = "Kuruma", costs = 375000, description = {}, model = "kuruma"},
				{name = "Lynx", costs = 250500, description = {}, model = "lynx"},
				{name = "Massacro", costs = 1950000, description = {}, model = "massacro"},
				{name = "Nissan GT-R35", costs = 4800000, description = {}, model = "r35"},
				{name = "Omnis", costs = 390000, description = {}, model = "omnis"},
				{name = "Penumbra", costs = 54000, description = {}, model = "penumbra"},
				{name = "Rapid GT", costs = 180000, description = {}, model = "rapidgt"},
				{name = "Rapid GT Convertible", costs = 192000, description = {}, model = "rapidgt2"},
				{name = "Schafter V12", costs = 750000, description = {}, model = "schafter3"},
				{name = "Specter Custom", costs = 1110000, description = {}, model = "specter2"},
				{name = "Sultan", costs = 42000, description = {}, model = "sultan"},
				{name = "Sultan RS", costs = 660000, description = {}, model = "sultanrs"},
				{name = "Surano", costs = 6525000, description = {}, model = "surano"},
				{name = "Tropos", costs = 337000, description = {}, model = "tropos"},
				{name = "Verkierer", costs = 270000, description = {}, model = "verlierer2"},
			}
		},
		["Sportsklassikere"] = {
			title = "Sportsklassikere",
			name = "Sportsklassikere",
			buttons = {
				{name = "Casco", costs = 660000, description = {}, model = "casco"},
				{name = "Coquette Classic", costs = 1775000, description = {}, model = "coquette2"},
				{name = "Ferrari 308 Quattrovalvole", costs = 2500000, description = {}, model = "308"},
				{name = "JB 700", costs = 960000, description = {}, model = "jb700"},
				{name = "Pigalle", costs = 375000, description = {}, model = "pigalle"},
				{name = "Stinger", costs = 885000, description = {}, model = "stinger"},
				{name = "Stinger GT", costs = 1155000, description = {}, model = "stingergt"},
				{name = "Stirling GT", costs = 1650000, description = {}, model = "feltzer3"},
				{name = "Z-Type", costs = 2250000, description = {}, model = "ztype"},
			}
		},
		["Superbiler"] = {
			title = "Superbiler",
			name = "Superbiler",
			buttons = {
				{name = "Aston Martin Vanquish", costs = 13875000, description = {}, model = "ast"},
				{name = "Ford GT", costs = 13350000, description = {}, model = "gt17"},
				{name = "Porsche Panamera", costs = 15750000, description = {}, model = "panamera17turbo"},
			}
		},
		["Muskelbiler"] = {
			title = "Muskelvogne",
			name = "Muskelvogne",
			buttons = {
				{name = "Albany Hermes", costs = 1525000, description = {}, model = "hermes"},
				{name = "Blade", costs = 495000, description = {}, model = "blade"},
				{name = "Buccaneer", costs =123000, description = {}, model = "buccaneer"},
				{name = "Chino", costs = 93750, description = {}, model = "chino"},
				{name = "Coquette BlackFin", costs = 186000, description = {}, model = "coquette3"},
				{name = "Dominator", costs = 465000, description = {}, model = "dominator"},
				{name = "Dukes", costs = 172000, description = {}, model = "dukes"},
				{name = "Faction", costs = 168000, description = {}, model = "faction"},
				{name = "Gauntlet", costs = 363000, description = {}, model = "gauntlet"},
				{name = "Hotknife", costs = 365000, description = {}, model = "hotknife"},
				{name = "Mustang GT", costs = 1605000, description = {}, model = "mgt"},
				{name = "Nightshade", costs = 487500, description = {}, model = "nightshade"},
				{name = "Picador", costs = 44900, description = {}, model = "picador"},
				{name = "Sabre Turbo", costs = 187500, description = {}, model = "sabregt"},
				{name = "Tampa", costs = 356000, description = {}, model = "tampa"},
				{name = "Tornado Convertible", costs = 630000, description = {}, model = "tornado2"},
				{name = "Tornado Rat Rod", costs = 495000, description = {}, model = "tornado6"},
				{name = "Vigero", costs = 91500, description = {}, model = "vigero"},
				{name = "Virgo", costs = 375000, description = {}, model = "virgo"},
				{name = "Declasse Voodoo Custom", costs = 715000, description = {}, model = "voodoo"},
			}
		},
		["Offroad"] = {
			title = "Offroad",
			name = "offroad",
			buttons = {
				{name = "Bifta", costs =96000, description = {}, model = "bifta"},
				{name = "Brawler", costs = 525000, description = {}, model = "brawler"},
				{name = "Dubsta 6x6", costs = 935000, description = {}, model = "dubsta3"},
				{name = "Dune Buggy", costs = 40000, description = {}, model = "dune"},
				{name = "Ford Raptor", costs = 3200000, description = {}, model = "f150"},
				{name = "Jeep Wrangler", costs = 735000, description = {}, model = "wrangler86"},
				{name = "Nissan Titan", costs = 2900000, description = {}, model = "nissantitan17"},
				{name = "Rebel", costs = 50000, description = {}, model = "rebel2"},
				{name = "Sandking", costs = 36000, description = {}, model = "sandking"},
				{name = "Trophy Truck", costs = 1225000, description = {}, model = "trophytruck"},
			}
		},
		["SUV"] = {
			title = "SUV",
			name = "SUV",
			buttons = {
				{name = "Baller", costs = 735000, description = {}, model = "baller"},
				{name = "BMW X5 E53", costs = 1275000, description = {}, model = "x5e53"},
				{name = "Cavalcade", costs = 330000, description = {}, model = "cavalcade"},
				{name = "Granger", costs = 665000, description = {}, model = "granger"},
				{name = "Huntley S", costs = 465000, description = {}, model = "huntley"},
				{name = "Landstalker", costs = 83000, description = {}, model = "landstalker"},
				{name = "Radius", costs = 62000, description = {}, model = "radi"},
				{name = "Rocoto", costs = 780000, description = {}, model = "rocoto"},
				{name = "Seminole", costs = 165000, description = {}, model = "seminole"},
				{name = "XLS", costs = 465000, description = {}, model = "xls"},
			}
		},
		["Varevogne"] = {
			title = "Varevogne",
			name = "Varevogne",
			buttons = {
				{name = "Bison", costs = 90000, description = {}, model = "bison"},
				{name = "Bobcat XL", costs = 67000, description = {}, model = "bobcatxl"},
				{name = "Gang Burrito", costs = 88500, description = {}, model = "gburrito"},
				{name = "Journey", costs = 65000, description = {}, model = "journey"},
				{name = "Mercedes V250", costs = 1850000, description = {}, model = "v250"},
				{name = "Minivan", costs = 65000, description = {}, model = "minivan"},
				{name = "Paradise", costs = 55000, description = {}, model = "paradise"},
				{name = "Rumpo", costs = 230000, description = {}, model = "rumpo"},
				{name = "Surfer", costs = 29000, description = {}, model = "surfer"},
				{name = "Youga", costs = 104000, description = {}, model = "youga"},
			}
		},
		["Sedaner"] = {
			title = "Sedaner",
			name = "Sedaner",
			buttons = {
				{name = "Asea", costs = 450000, description = {}, model = "asea"},
				{name = "Asterope", costs = 195000, description = {}, model = "asterope"},
				{name = "Audi A3", costs = 1200000, description = {}, model = "2015a3"},
				{name = "Audi A8", costs = 3375000, description = {}, model = "a8fsi"},
				{name = "Audi RS7", costs = 3750000, description = {}, model = "rs7"},
				{name = "Audi S4 Avant", costs = 2100000, description = {}, model = "s4avant"},
				{name = "Audi S4 B5", costs = 1000000, description = {}, model = "b5s4"},
				{name = "BMW M3 E30", costs = 675000, description = {}, model = "m3e30"},
				{name = "Ford Mondeo", costs = 580000, description = {}, model = "mondeo"},
				{name = "Fugitive", costs = 385000, description = {}, model = "fugitive"},
				{name = "Glendale", costs = 65000, description = {}, model = "glendale"},
				{name = "Ingot", costs = 22000, description = {}, model = "ingot"},
				{name = "Intruder", costs = 65000, description = {}, model = "intruder"},
				{name = "Mercedes CLA45", costs = 1920000, description = {}, model = "cla45sb"},
				{name = "Premier", costs = 20000, description = {}, model = "premier"},
				{name = "Primo", costs = 80000, description = {}, model = "primo"},
				{name = "Primo Custom", costs = 195000, description = {}, model = "primo2"},
				{name = "Regina", costs = 22000, description = {}, model = "regina"},
				{name = "Schafter", costs = 645000, description = {}, model = "schafter2"},
				{name = "Stanier", costs = 38000, description = {}, model = "stanier"},
				{name = "Stratum", costs = 39000, description = {}, model = "stratum"},
				{name = "Stretch", costs = 475000, description = {}, model = "stretch"},
				{name = "Super Diamond", costs = 685000, description = {}, model = "superd"},
				{name = "Surge", costs = 228000, description = {}, model = "surge"},
				{name = "Tailgater", costs = 165000, description = {}, model = "tailgater"},
				{name = "Tesla Model S", costs = 2175000, description = {}, model = "models"},
				{name = "Volkswagen Passat B8", costs = 955000, description = {}, model = "vwstance"},
				{name = "Volvo 850R", costs = 600000, description = {}, model = "v850r"},
				{name = "Warrener", costs = 88000, description = {}, model = "warrener"},
				{name = "Washington", costs = 85000, description = {}, model = "washington"},
			}
		},
		["Motorcykler"] = {
			title = "Motorcykler",
			name = "Motorcykler",
			buttons = {
				{name = "Akuma", costs = 88000, description = {}, model = "akuma"},
				{name = "Bagger", costs = 100000, description = {}, model = "bagger"},
				{name = "Bati 801", costs = 35000, description = {}, model = "bati"},
				{name = "Bati 801RR", costs = 35000, description = {}, model = "bati2"},
				{name = "BF400", costs = 385000, description = {}, model = "bf400"},
				{name = "Blazer", costs = 22000, description = {}, model = "blazer"},
				{name = "Carbon RS", costs = 80000, description = {}, model = "carbonrs"},
				{name = "Cliffhanger", costs = 325000, description = {}, model = "cliffhanger"},
				{name = "Daemon", costs = 88000, description = {}, model = "daemon"},
				{name = "Double T", costs = 22000, description = {}, model = "double"},
				{name = "Enduro", costs = 88000, description = {}, model = "enduro"},
				{name = "Faggio", costs = 34000, description = {}, model = "faggio3"},
				{name = "Faggio", costs = 36000, description = {}, model = "faggio2"},
				{name = "Gargoyle", costs = 240000, description = {}, model = "gargoyle"},
				{name = "Hakuchou", costs = 160000, description = {}, model = "hakuchou"},
				{name = "Hexer", costs = 35000, description = {}, model = "hexer"},
				{name = "Innovation", costs = 160000, description = {}, model = "innovation"},
				{name = "Lectro", costs = 120000, description = {}, model = "lectro"},
				{name = "Nemesis", costs = 22000, description = {}, model = "nemesis"},
				{name = "PCJ-600", costs = 19000, description = {}, model = "pcj"},
				{name = "Ruffian", costs = 19000, description = {}, model = "ruffian"},
				{name = "Sanchez", costs = 17000, description = {}, model = "sanchez"},
				{name = "Sovereign", costs = 140000, description = {}, model = "sovereign"},
				{name = "Thrust", costs = 135000, description = {}, model = "thrust"},
				{name = "Vader", costs = 64000, description = {}, model = "vader"},
				{name = "Vindicator", costs = 340000, description = {}, model = "vindicator"},
			}
		},
		["Cykler"] = {
			title = "Cykler",
			name = "Cykler",
			buttons = {
				{name = "BMX", costs = 6000, description = {}, model = "bmx"},
				{name = "Cruiser", costs = 9500, description = {}, model = "cruiser"},
				{name = "Fixter", costs = 6000, description = {}, model = "fixter"},
				{name = "Scorcher", costs = 9000, description = {}, model = "scorcher"},
				{name = "Tribike 1", costs = 14500, description = {}, model = "tribike"},
				{name = "Tribike 2", costs = 14500, description = {}, model = "tribike2"},
				{name = "Tribike 3", costs = 14500, description = {}, model = "tribike3"},
			}
		}
	}
}
local fakecar = {model = '', car = nil}
local vehshop_locations = {
	{entering = {-1157.4163,-1719.02640,4.9049}, inside = {-1152.6375,-1710.9248,4.9749,167.7278}, outside = {-1174.3033,-1729.2147,4.3295,214.1832}},
}

local vehshop_blips ={}
local inrangeofvehshop = false
local currentlocation = nil
local boughtcar = false

function vehSR_drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end

function vehSR_IsPlayerInRangeOfVehshop()
	return inrangeofvehshop
end

local firstspawn = 0
AddEventHandler('playerSpawned', function(spawn)
	if firstspawn == 0 then
		vehSR_ShowVehshopText(true)
		firstspawn = 1
	end
end)

function vehSR_ShowVehshopText(bool)
	if bool and #vehshop_blips == 0 then
		for station,pos in pairs(vehshop_locations) do
			local loc = pos
			pos = pos.entering
			table.insert(vehshop_blips, {blip = blip, pos = loc})
		end
		Citizen.CreateThread(function()
			while #vehshop_blips > 0 do
				Citizen.Wait(0)
				local inrange = false
				for i,b in ipairs(vehshop_blips) do
					if vehshop.opened == false and IsPedInAnyVehicle(vehSR_LocalPed(), true) == false and GetDistanceBetweenCoords(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],GetEntityCoords(vehSR_LocalPed())) < 1 then
						vehSR_drawTxt("[~g~E~s~] for at gennemse køretøjer",0,1,0.5,0.8,0.6,255,255,255,255)
						currentlocation = b
						inrange = true
					end
				end
				inrangeofvehshop = inrange
			end
		end)
	elseif bool == false and #vehshop_blips > 0 then
		vehshop_blips = {}
	end
end

function vehSR_f(n)
	return n + 0.0001
end

function vehSR_LocalPed()
	return GetPlayerPed(-1)
end

function vehSR_try(f, catch_f)
	local status, exception = pcall(f)
	if not status then
		catch_f(exception)
	end
end
function vehSR_firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end
--local veh = nil
function vehSR_OpenCreator()
	boughtcar = false
	local ped = vehSR_LocalPed()
	local pos = currentlocation.pos.inside
	FreezeEntityPosition(ped,true)
	SetEntityVisible(ped,false)
	SetEntityCoords(ped,pos[1],pos[2],pos[3])
	SetEntityHeading(ped,pos[4])
	vehshop.currentmenu = "Bilforhandler"
	vehshop.opened = true
	vehshop.selectedbutton = 0
end
local vehicle_price = 0
function vehSR_CloseCreator(vehicle,veh_type)
	Citizen.CreateThread(function()
		local ped = vehSR_LocalPed()
		if not boughtcar then
			local pos = currentlocation.pos.entering
			SetEntityCoords(ped,pos[1],pos[2],pos[3])
			FreezeEntityPosition(ped,false)
			SetEntityVisible(ped,true)
		else
			deleteVehiclePedIsIn()
			vRP.teleport({-1174.3033,-1729.2147,4.3295,214.1832})
			vRPg.spawnBoughtVehicle({veh_type, vehicle})
			SetEntityVisible(ped,true)
			FreezeEntityPosition(ped,false)
		end
		vehshop.opened = false
		vehshop.menu.from = 1
		vehshop.menu.to = 10
	end)
end

function vehSR_drawMenuButton(button,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(button.name)
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function vehSR_drawMenuTitle(txt,x,y)
local menu = vehshop.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end
function vehSR_tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end
function vehSR_Notify(text)
SetNotificationTextEntry('STRING')
AddTextComponentString(text)
DrawNotification(false, false)
end

function vehSR_drawMenuRight(txt,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawText(x + menu.width/2 - 0.06, y - menu.height/2 + 0.0028)
end
local backlock = false
Citizen.CreateThread(function()
	local last_dir
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1,51) and vehSR_IsPlayerInRangeOfVehshop() then
			if vehshop.opened then
				vehSR_CloseCreator("","")
			else
				vehSR_OpenCreator()
			end
		end
		if vehshop.opened then
			local ped = vehSR_LocalPed()
			local menu = vehshop.menu[vehshop.currentmenu]
			vehSR_drawTxt(vehshop.title,1,1,vehshop.menu.x,vehshop.menu.y,1.0, 255,255,255,255)
			vehSR_drawMenuTitle(menu.title, vehshop.menu.x,vehshop.menu.y + 0.08)
			vehSR_drawTxt(vehshop.selectedbutton.."/"..vehSR_tablelength(menu.buttons),0,0,vehshop.menu.x + vehshop.menu.width/2 - 0.0385,vehshop.menu.y + 0.067,0.4, 255,255,255,255)
			local y = vehshop.menu.y + 0.12
			buttoncount = vehSR_tablelength(menu.buttons)
			local selected = false

			for i,button in pairs(menu.buttons) do
				if i >= vehshop.menu.from and i <= vehshop.menu.to then

					if i == vehshop.selectedbutton then
						selected = true
					else
						selected = false
					end
					vehSR_drawMenuButton(button,vehshop.menu.x,y,selected)
					if button.costs ~= nil then
							vehSR_drawMenuRight(button.costs.." DKK",0.174,y,selected)
						if vehshop.currentmenu == "Tilbuds biler" or vehshop.currentmenu == "Tilbuds motorcykler" or vehshop.currentmenu == "Kompakte" or vehshop.currentmenu == "Coupéer" or vehshop.currentmenu == "Sedaner" or vehshop.currentmenu == "Sportsvogne" or vehshop.currentmenu == "Sportsklassikere" or vehshop.currentmenu == "Superbiler" or vehshop.currentmenu == "Muskelbiler" or vehshop.currentmenu == "Offroad" or vehshop.currentmenu == "SUV" or vehshop.currentmenu == "Varevogne" or vehshop.currentmenu == "industrial" or vehshop.currentmenu == "cycles" or vehshop.currentmenu == "Motorcykler" or vehshop.currentmenu == "Cykler" then
						else
							vehSR_drawMenuButton(button,vehshop.menu.x,y,selected)
						end
					end
					y = y + 0.04
						if vehshop.currentmenu == "Tilbuds biler" or vehshop.currentmenu == "Tilbuds motorcykler" or vehshop.currentmenu == "Kompakte" or vehshop.currentmenu == "Coupéer" or vehshop.currentmenu == "Sedaner" or vehshop.currentmenu == "Sportsvogne" or vehshop.currentmenu == "Sportsklassikere" or vehshop.currentmenu == "Superbiler" or vehshop.currentmenu == "Muskelbiler" or vehshop.currentmenu == "Offroad" or vehshop.currentmenu == "SUV" or vehshop.currentmenu == "Varevogne" or vehshop.currentmenu == "industrial" or vehshop.currentmenu == "cycles" or vehshop.currentmenu == "Motorcykler" or vehshop.currentmenu == "Cykler" then
						 if selected then
							if fakecar.model ~= button.model then
								if DoesEntityExist(fakecar.car) then
									DeleteEntity(fakecar.car)
								end
								local pos = currentlocation.pos.inside
								local hash = GetHashKey(button.model)
								RequestModel(hash)
								local timer = 0
								while not HasModelLoaded(hash) and timer < 255 do
									Citizen.Wait(1)
									vehSR_drawTxt("Indlæser...",0,1,0.5,0.5,1.5,255,255-timer,255-timer,255)
									RequestModel(hash)
									timer = timer + 1
								end
								if timer < 255 then
									local veh = CreateVehicle(hash,pos[1],pos[2],pos[3],pos[4],false,false)
									while not DoesEntityExist(veh) do
										Citizen.Wait(1)
										vehSR_drawTxt("Indlæser...",0,1,0.5,0.5,1.5,255,255-timer,255-timer,255)
									end
									FreezeEntityPosition(veh,true)
									SetEntityInvincible(veh,true)
									SetVehicleDoorsLocked(veh,4)
									TaskWarpPedIntoVehicle(vehSR_LocalPed(),veh,-1)
									for i = 0,24 do
										SetVehicleModKit(veh,0)
										RemoveVehicleMod(veh,i)
									end
									fakecar = { model = button.model, car = veh}
								else
									timer = 0
									while timer < 25 do
										Citizen.Wait(1)
										vehSR_drawTxt("Indlæsning mislykkedes...",0,1,0.5,0.5,1.5,255,0,0,255)
										timer = timer + 1
									end
									if last_dir then
										if vehshop.selectedbutton < buttoncount then
											vehshop.selectedbutton = vehshop.selectedbutton +1
											if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
												vehshop.menu.to = vehshop.menu.to + 1
												vehshop.menu.from = vehshop.menu.from + 1
											end
										else
											last_dir = false
											vehshop.selectedbutton = vehshop.selectedbutton -1
											if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
												vehshop.menu.from = vehshop.menu.from -1
												vehshop.menu.to = vehshop.menu.to - 1
											end
										end
									else
										if vehshop.selectedbutton > 1 then
											vehshop.selectedbutton = vehshop.selectedbutton -1
											if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
												vehshop.menu.from = vehshop.menu.from -1
												vehshop.menu.to = vehshop.menu.to - 1
											end
										else
											last_dir = true
											vehshop.selectedbutton = vehshop.selectedbutton +1
											if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
												vehshop.menu.to = vehshop.menu.to + 1
												vehshop.menu.from = vehshop.menu.from + 1
											end
										end
									end
								end
							end
						end
					end
					if selected and IsControlJustPressed(1,201) then
						vehSR_ButtonSelected(button)
					end
				end
			end
			if IsControlJustPressed(1,202) then
				vehSR_Back()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				last_dir = false
				if vehshop.selectedbutton > 1 then
					vehshop.selectedbutton = vehshop.selectedbutton -1
					if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
						vehshop.menu.from = vehshop.menu.from -1
						vehshop.menu.to = vehshop.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				last_dir = true
				if vehshop.selectedbutton < buttoncount then
					vehshop.selectedbutton = vehshop.selectedbutton +1
					if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
						vehshop.menu.to = vehshop.menu.to + 1
						vehshop.menu.from = vehshop.menu.from + 1
					end
				end
			end
		end

	end
end)


function vehSR_round(num, idp)
  if idp and idp>0 then
    local mult = 10^idp
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end
function vehSR_ButtonSelected(button)
	local ped = GetPlayerPed(-1)
	local this = vehshop.currentmenu
	local btn = button.name
	if this == "Bilforhandler" then
		if btn == "Biler" then
			vehSR_OpenMenu('Biler')
		elseif btn == "Motorcykler" then
			vehSR_OpenMenu('Motorcykler')
		elseif btn == "Cykler" then
			vehSR_OpenMenu('Cykler')
		elseif btn == "Tilbuds biler" then
			vehSR_OpenMenu('Tilbuds biler')
		elseif btn == "Tilbuds motorcykler" then
			vehSR_OpenMenu('Tilbuds motorcykler')
		end
	elseif this == "Biler" then
		if btn == "Sportsvogne" then
			vehSR_OpenMenu('Sportsvogne')
		elseif btn == "Sedaner" then
			vehSR_OpenMenu('Sedaner')
		elseif btn == "Kompakte" then
			vehSR_OpenMenu('Kompakte')
		elseif btn == "Coupéer" then
			vehSR_OpenMenu('Coupéer')
		elseif btn == "Sportsklassikere" then
			vehSR_OpenMenu("Sportsklassikere")
		elseif btn == "Superbiler" then
			vehSR_OpenMenu('Superbiler')
		elseif btn == "Muskelbiler" then
			vehSR_OpenMenu('Muskelbiler')
		elseif btn == "Offroad" then
			vehSR_OpenMenu('Offroad')
		elseif btn == "SUV" then
			vehSR_OpenMenu('SUV')
		elseif btn == "Varevogne" then
			vehSR_OpenMenu('Varevogne')
		end
	elseif this == "Tilbuds biler" or this == "Kompakte" or this == "Coupéer" or this == "Sedaner" or this == "Sportsvogne" or this == "Sportsklassikere" or this == "Superbiler" or this == "Muskelbiler" or this == "Offroad" or this == "SUV" or this == "Varevogne" or this == "industrial" then
		TriggerServerEvent('veh_SR:CheckMoneyForVeh',button.model,button.name,button.costs,"car")
    elseif this == "Motorcykler" or this == "Tilbuds motorcykler" then
		TriggerServerEvent('veh_SR:CheckMoneyForVeh',button.model,button.name,button.costs,"bike")
    elseif this == "Cykler" then
		TriggerServerEvent('veh_SR:CheckMoneyForVeh',button.model,button.name,button.costs,"citybike")
	end
end

RegisterNetEvent('veh_SR:CloseMenu')
AddEventHandler('veh_SR:CloseMenu', function(vehicle, veh_type)
	boughtcar = true
	vehSR_CloseCreator(vehicle,veh_type)
end)

function vehSR_OpenMenu(menu)
	fakecar = {model = '', car = nil}
	vehshop.lastmenu = vehshop.currentmenu
	if menu == "Biler" then
		vehshop.lastmenu = "Bilforhandler"
	elseif menu == "Motorcykler"  then
		vehshop.lastmenu = "Bilforhandler"
	elseif menu == 'Cykler' then
		vehshop.lastmenu = "Bilforhandler"
	elseif menu == "Tilbuds biler"  then
		vehshop.lastmenu = "Bilforhandler"
	elseif menu == "Tilbuds motorcykler" then
		vehshop.lastmenu = "Bilforhandler"
	end
	vehshop.menu.from = 1
	vehshop.menu.to = 10
	vehshop.selectedbutton = 0
	vehshop.currentmenu = menu
end

function vehSR_Back()
	if backlock then
		return
	end
	backlock = true
	if vehshop.currentmenu == "Bilforhandler" then
		vehSR_CloseCreator("","")
	elseif vehshop.currentmenu == "Tilbuds biler" or vehshop.currentmenu == "Kompakte" or vehshop.currentmenu == "Coupéer" or vehshop.currentmenu == "Sedaner" or vehshop.currentmenu == "Sportsvogne" or vehshop.currentmenu == "Sportsklassikere" or vehshop.currentmenu == "Superbiler" or vehshop.currentmenu == "Muskelbiler" or vehshop.currentmenu == "Offroad" or vehshop.currentmenu == "SUV" or vehshop.currentmenu == "Varevogne" or vehshop.currentmenu == "industrial" or vehshop.currentmenu == "cycles" or vehshop.currentmenu == "Motorcykler" or vehshop.currentmenu == "Tilbuds motorcykler" or vehshop.currentmenu == "Cykler" then
		if DoesEntityExist(fakecar.car) then
			DeleteEntity(fakecar.car)
		end
		fakecar = {model = '', car = nil}
		vehSR_OpenMenu(vehshop.lastmenu)
	else
		vehSR_OpenMenu(vehshop.lastmenu)
	end

end

function vehSR_stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end
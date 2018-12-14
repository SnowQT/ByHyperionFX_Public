
local cfg = {}

-- define each group with a set of permissions
-- _config property:
--- gtype (optional): used to have only one group with the same gtype per player (example: a job gtype to only have one job)
--- onspawn (optional): function(player) (called when the player spawn with the group)
--- onjoin (optional): function(player) (called when the player join the group)
--- onleave (optional): function(player) (called when the player leave the group)
--- (you have direct access to vRP and vRPclient, the tunnel to client, in the config callbacks)

cfg.groups = {
	["thanighthawk"] = {
		_config = {
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Ejer-rang tildelt.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onleave = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Ejer-rang frataget.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
		},
		"player.group.add.staff",
		"player.group.remove.staff",
		"player.givemoney",
		"player.unban",
		"player.giveitem",
		"player.tptowaypoint",
		"admin.announce",
		"player.list",
		"player.whitelist",
		"player.kick",
		"player.ban",
		"player.noclip",
		"player.display_custom",
		"player.tptome",
		"player.tpto",
		"player.tptowaypoint",
		"player.spawnvehicle",
		"player.deletevehicle",
		"player.revival",
		"player.coordsnoheading",
		"player.repairvehicle",
		"player.unlockvehicle",
		"player.freeze",
		"police.menu",
		"police.handcuff",
		"police.drag",
		"police.easy_jail",
		"police.carsearch",
		"police.seize.weapons",
		"police.seize.items",
		"repair.menu",
		"emergency.revive",
		"emergency.market",
		"trucker.perms",
		"nighthawk.chattitle",
		"-user.paycheck",
		"staff.seizable"
	},
	["uc"] = {
		_config = {
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "UC-rang tildelt.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onleave = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "UC-rang frataget.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
		},
		"player.group.add.staff",
		"player.group.remove.staff",
		"player.givemoney",
		"player.unban",
		"player.giveitem",
		"player.tptowaypoint",
		"admin.announce",
		"player.list",
		"player.whitelist",
		"player.kick",
		"player.ban",
		"player.noclip",
		"player.display_custom",
		"player.tptome",
		"player.tpto",
		"player.tptowaypoint",
		"player.spawnvehicle",
		"player.deletevehicle",
		"player.revival",
		"player.coordsnoheading",
		"player.repairvehicle",
		"player.unlockvehicle",
		"player.freeze",
		"police.menu",
		"police.easy_jail",
		"police.handcuff",
		"police.seize.weapons",
		"police.seize.items",
		"police.menu_interaction",
		"repair.menu",
		"emergency.menu",
		"emergency.putinveh",
		"emergency.getoutveh",
		"emergency.drag",
		"emergency.revive",
		"emergency.market",
		"staff.seizable"
	},
	["superadmin"] = {
		_config = {
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Ledelse-rang tildelt.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onleave = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Ledelse-rang frataget.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
		},
		"player.group.add.staff",
		"player.group.remove.staff",
		"player.givemoney",
		"player.unban",
		"player.giveitem",
		"player.tptowaypoint",
		"player.revival",
		"player.coordsnoheading",
		"player.repairvehicle",
		"player.unlockvehicle",
		"player.freeze",
		"repair.menu",
		"superadmin.chattitle",
		"staff.seizable"
	},
	["admin"] = {
		_config = {
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Admin-rang tildelt.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onleave = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Admin-rang frataget.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
		},
		"admin.tickets",
		"admin.announce",
		"player.list",
		"player.whitelist",
		"player.kick",
		"player.ban",
		"player.noclip",
		"player.display_custom",
		"player.tptome",
		"player.tpto",
		"player.tptowaypoint",
		"player.spawnvehicle",
		"player.deletevehicle",
		"player.revival",
		"player.coordsnoheading",
		"player.repairvehicle",
		"player.freeze",
		"police.menu",
		"police.easy_jail",
		"police.handcuff",
		"police.seize.weapons",
		"police.seize.items",
		"police.menu_interaction",
		"emergency.menu",
		"emergency.putinveh",
		"emergency.getoutveh",
		"emergency.drag",
		"emergency.revive",
		"emergency.market",
		"repair.menu",
		"vehicle.replace",
		"staff.seizable"
	},
	["moderator"] = {
		_config = {
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Hjælper-rang tildelt.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onleave = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Hjælper-rang frataget.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
		},
		"admin.tickets",
		"admin.announce",
		"player.list",
		"player.kick",
		"player.noclip",
		"player.tpto",
		"player.tptome",
		"player.tptowaypoint",
		"player.deletevehicle",
		"player.unlockvehicle",
		"player.revival",
		"player.coordsnoheading",
		"player.freeze",
		"police.menu",
		"police.easy_jail",
		"mod.chattitle",
		"staff.seizable"
	},
	["emschief"] = {
		_config = {
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu lægechef.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
		},
		"player.group.add",
		"player.group.remove",
		"emergencychief.paycheck",
		"-emergency.paycheck"
	},
	["mechchief"] = {
		_config = {
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu mekanikerchef.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
		},
		"player.group.add",
		"player.group.remove",
		"repairchief.paycheck",
		"-repair.paycheck"
	},
	["policechief"] = {
		_config = {
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu rigspolitichef.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
		},
		"player.group.add",
		"player.group.remove",
		"policechief.paycheck",
		"-police.paycheck"
	},
	["lawyerchief"] = {
		_config = {
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu højesteretsdommer.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
		},
		"player.group.add",
		"player.group.remove"
	},
	["god"] = {
		_config = {
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Godmode aktiveret.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onleave = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Godmode deaktiveret.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end
		},
		"admin.god", -- reset survivals/health periodically
		"god.chattitle"
	},
	["jailed"] = {
		"admin.god"
	},
	["user"] = {  -- the group user is auto added to all logged players
		"player.phone",
		"player.calladmin",
		"player.coords",
		"police.askid",
		"police.store_weapons",
		"user.askid",
		"police.seizable",  -- can be seized
		"user.firstaid"
	},
	["police"] = {
		_config = {
			onspawn = function(player) end
		},
		"cop.whitelisted"
	},
	["helikopter"] = {
		_config = {
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Helikopter-licens tildelt.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
		},
		"helikopter.whitelisted",
		"helikopter.vehicle"
	},
	["pet"] = {
		_config = {
			onspawn = function(player) end
		},
		"pet.whitelisted"
	},
	["ems"] = {
		_config = {
			onspawn = function(player) end
		},
		"ems.whitelisted"
	},
	["mech"] = {
		_config = {
			onspawn = function(player) end
		},
		"mechanic.whitelisted"
	},
	["lawyer"] = {
		_config = {
			onspawn = function(player) end
		},
		"lawyer.whitelisted"
	},
	["journal"] = {
		_config = {
			onspawn = function(player) end
		},
		"journalist.whitelisted"
	},
	["judge"] = {
		_config = {
			onspawn = function(player) end
		},
		"judge.whitelisted"
	},
	["psych"] = {
		_config = {
			onspawn = function(player) end
		},
		"psychologist.whitelisted"
	},
	["Køleskab"] = {
		_config = {
			onspawn = function(player) end
		},
		"fucking.koleskab"
	},
	["Skraldemand"] = {
		_config = { gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu skraldemand.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end,
			onleave = function(player) vRPclient.stopMission(player) end
		},
		"skraldemand.vehicle",
		"skraldemand.paycheck",
		"toggle.service",
		"skraldemand.market",
		"mission.skraldemand",
		"mission.skraldemand2"
	},
    ["Postbud"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu postbud.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
		},
		"delivery.gopostal",
		"postman.paycheck"
	},
    ["Lastbilchauffør"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu lastbilchauffør.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
		},
		"delivery.trucker",
		"trucker.vehicle",
		"trucker.paycheck"
	},
	["AKS"] = {
		_config = { 
			gtype = "job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu AKS.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				vRPclient.giveWeapons(player,{{WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_CARBINERIFLE = {ammo = 250}, WEAPON_SNIPERRIFLE = {ammo = 250}, WEAPON_SMOKEGRENADE = {ammo = 25}}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
				vRPclient.giveWeapons(player,{{WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_CARBINERIFLE = {ammo = 250}, WEAPON_SNIPERRIFLE = {ammo = 250}, WEAPON_SMOKEGRENADE = {ammo = 25}}})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
				vRPclient.removeWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 0}, WEAPON_STUNGUN = {ammo = 0}, WEAPON_PUMPSHOTGUN = {ammo = 0}, WEAPON_COMBATPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 0}, WEAPON_CARBINERIFLE = {ammo = 0}, WEAPON_SNIPERRIFLE = {ammo = 0}, WEAPON_SMOKEGRENADE = {ammo = 0}}})
			end
		},
		"police.menu",
		"police.carsearch",
		"police.cloakroom",
		"police.pc",
		"police.handcuff",
		"police.putinveh",
		"police.getoutveh",
		"police.check",
		"robbery.police",
		"police.service",
		"police.wanted",
		"police.seize.weapons",
		"police.seize.items",
		"police.license",
		"police.easy_jail",
		"police.fine",
		"police.announce",
		"-police.store_weapons",
		"-police.seizable", -- negative permission, police can't seize itself, even if another group add the permission
		"police.vehicle",
		"police.weapons",
		"police.paycheck",
		"police.drag",
		"police.bodyarmor",
		"police.robbery",
		"police.robbery1",
		"cop.keycard",
		"ems.keycard",
		"emergency.revive",
		"emergency.market",
		"police.menu_interaction"
	},
	["Betjent"] = {
		_config = { 
			gtype = "job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu betjent.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_VINTAGEPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 250}}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
				vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_VINTAGEPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 250}}})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
				vRPclient.removeWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 0}, WEAPON_STUNGUN = {ammo = 0}, WEAPON_PUMPSHOTGUN = {ammo = 0}, WEAPON_COMBATPISTOL = {ammo = 0}, WEAPON_VINTAGEPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 0}, WEAPON_CARBINERIFLE = {ammo = 0}, WEAPON_SNIPERRIFLE = {ammo = 0}, WEAPON_SMOKEGRENADE = {ammo = 0}}})
			end
		},
		"police.menu",
		"police.carsearch",
		"police.cloakroom",
		"police.pc",
		"police.handcuff",
		"police.putinveh",
		"police.getoutveh",
		"police.check",
		"robbery.police",
		"police.service",
		"police.wanted",
		"police.seize.weapons",
		"police.seize.items",
		"police.license",
		"police.easy_jail",
		"police.fine",
		"police.announce",
		"-police.store_weapons",
		"-police.seizable", -- negative permission, police can't seize itself, even if another group add the permission
		"police.vehicle",
		"police.weapons",
		"police.paycheck",
		"police.drag",
		"police.bodyarmor",
		"police.robbery",
		"police.robbery1",
		"cop.keycard",
		"ems.keycard",
		"emergency.revive",
		"emergency.market",
		"police.menu_interaction"
	},
	["Elev"] = {
		_config = { 
			gtype = "job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu politielev.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_VINTAGEPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 250}}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
				vRPclient.giveWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 1}, WEAPON_FLASHLIGHT = {ammo = 1}, WEAPON_STUNGUN = {ammo = 1}, WEAPON_COMBATPISTOL = {ammo = 250}, WEAPON_VINTAGEPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 250}}})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
				vRPclient.removeWeapons(player,{{WEAPON_NIGHTSTICK = {ammo = 0}, WEAPON_STUNGUN = {ammo = 0}, WEAPON_PUMPSHOTGUN = {ammo = 0}, WEAPON_COMBATPISTOL = {ammo = 0}, WEAPON_VINTAGEPISTOL = {ammo = 0}, WEAPON_SMG = {ammo = 0}, WEAPON_CARBINERIFLE = {ammo = 0}, WEAPON_SNIPERRIFLE = {ammo = 0}, WEAPON_SMOKEGRENADE = {ammo = 0}}})
			end
		},
		"police.menu",
		"police.carsearch",
		"police.cloakroom",
		"police.pc",
		"police.handcuff",
		"police.putinveh",
		"police.getoutveh",
		"police.check",
		"robbery.police",
		"police.service",
		"police.wanted",
		"police.seize.weapons",
		"police.seize.items",
		"police.license",
		"police.easy_jail",
		"police.fine",
		"police.announce",
		"-police.store_weapons",
		"-police.seizable", -- negative permission, police can't seize itself, even if another group add the permission
		"police.vehicle",
		"police.weapons",
		"policestudent.paycheck",
		"police.drag",
		"police.bodyarmor",
		"cop.keycard",
		"ems.keycard",
		"emergency.revive",
		"emergency.market",
		"police.menu_interaction"
	},
	["PET-agent"] = {
		_config = {
			gtype = "job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu PET-agent.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				vRPclient.giveWeapons(player,{{WEAPON_FLASHLIGHT = {ammo = 1},WEAPON_PISTOL = {ammo = 250}}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
				vRPclient.giveWeapons(player,{{WEAPON_FLASHLIGHT = {ammo = 1},WEAPON_PISTOL = {ammo = 250}}})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
				vRPclient.removeWeapons(player,{{WEAPON_FLASHLIGHT = {ammo = 0},WEAPON_PISTOL = {ammo = 0}}})
			end
		},
		"pet.whitelisted",
		"police.menu",
		"police.carsearch",
		"police.pc",
		"police.handcuff",
		"police.putinveh",
		"police.getoutveh",
		"police.check",
		"police.service",
		"police.wanted",
		"police.seize.weapons",
		"police.seize.items",
		"police.license",
		"police.vehicle",
		"police.easy_jail",
		"police.fine",
		"-police.store_weapons",
		"police.seizable", 
		"police.paycheck",
		"police.drag",
		"police.bodyarmor",
		"cop.keycard",
		"ems.keycard",
		"emergency.revive",
		"emergency.market",
		"police.menu_interaction"
	},
	["Læge"] = {
		_config = {
			gtype = "job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu læge.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
			end
		},
		"emergency.revive",
		"emergency.heal",
		"emergency.shop",
		"emergency.service",
		"emergency.cloakroom",
		"emergency.vehicle",
		"emergency.market",
		"emergency.medic",
		"emergency.announce",
		"emergency.menu",
		"emergency.putinveh",
		"emergency.getoutveh",
		"emergency.drag",
		"emergency.taser",
		"ems.keycard",
		"-police.store_weapons",
		"mission.emergency.transfer",
		"toggle.service",
		"emergency.paycheck",
		"police.menu_interaction"
	},
	["Lægeelev"] = {
		_config = {
			gtype = "job",
			onjoin = function(player)
				vRPclient.setCop(player,{true})
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu lægeelev.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player)
				vRPclient.setCop(player,{true})
			end,
			onleave = function(player)
				vRPclient.setCop(player,{false})
				vRPclient.stopMission(player)
			end
		},
		"emergency.revive",
		"emergency.heal",
		"emergency.shop",
		"emergency.service",
		"emergency.cloakroom",
		"emergency.vehicle",
		"emergency.market",
		"emergency.medic",
		"emergency.announce",
		"emergency.menu",
		"emergency.putinveh",
		"emergency.getoutveh",
		"emergency.drag",
		"emergency.taser",
		"ems.keycard",
		"-police.store_weapons",
		"mission.emergency.transfer",
		"toggle.service",
		"emergencystudent.paycheck",
		"police.menu_interaction"
	},
	["Mekaniker"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu mekaniker.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end,
			onleave = function(player) vRPclient.stopMission(player) end
		},
		"mechanic.whitelisted",
		"mechanic.emotes",
		"mech.announce",
		"vehicle.repair",
		"vehicle.replace",
		"repair.service",
		"mission.repair.satellite_dishes",
		"mission.repair.wind_turbines",
		"repair.vehicle",
		"repair.market",
		"repair.paycheck",
		"repair.scrap",
		"repair.menu",
		"toggle.service"
	}, 
	["Taxa"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu taxachauffør.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end,
			onleave = function(player) vRPclient.stopMission(player) end
		},
		"taxi.service",
		"taxi.vehicle",
		"taxi.announce",
		"mission.taxi.passenger",
		"toggle.service",
		"taxi.paycheck"
	},
	["Advokat"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu advokat.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end,
			onleave = function(player) vRPclient.stopMission(player) end
		},
		"lawyer.service",
		"lawyer.announce",
		"lawyer.paycheck",
		"toggle.service",
		"mission.advokat",
		"mission.advokat2",
		"advokat.vehicle"
	},
	["Dommer"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu dommer.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end,
			onleave = function(player) vRPclient.stopMission(player) end
		},
		"-lawyer.paycheck",
		"judge.paycheck",
		"lawyer.service",
		"lawyer.announce",
		"toggle.service",
		"mission.advokat",
		"mission.advokat2",
		"advokat.vehicle"
	},
	["Psykolog"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu psykolog.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end,
			onleave = function(player) vRPclient.stopMission(player) end
		},
		"psych.announce",
		"psych.service",
		"psych.paycheck",
		"psykolog.vehicle"
	},
	["Journalist"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu journalist.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end,
			onleave = function(player) vRPclient.stopMission(player) end
		},
		"journalist.announce",
		"journalist.service",
		"journalist.vehicle",
		"journalist.paycheck"
	},
	["Træhugger"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu træhugger.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end,
			onleave = function(player) vRPclient.stopMission(player) end
		},
		"tree.cutter",
		"tree.vehicle",
		"tree.paycheck"
	},
	["Civil"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu civil borger.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end
	},
		"user.paycheck",
		"drugseller.sell",
		"drugseller.market",
		"drugseller.harvest",
		"drugseller.process",
		"hacker.0day",
		"money.launder"
	},
	["Udbringer"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu udbringer.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end,
			onleave = function(player) vRPclient.stopMission(player) end
		},
		"mission.delivery.food",
		"delivery.vehicle",
		"delivery.paycheck",
		"pizza.market",
		"toggle.service"
	},
	["Pengetransport"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu pengetransporter.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end,
			onleave = function(player) vRPclient.stopMission(player) end
		},
		"mission.bankdriver.moneybank",
		"mission.bankdriver.moneybank2",
		"bankdriver.vehicle",
		"bankdriver.paycheck",
		"bankdriver.money",
		"toggle.service"
	},
	["Minearbejder"] = {
		_config = {
			gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu minearbejder.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end,
			onleave = function(player) vRPclient.stopMission(player) end
		},
		"mining.harvest",
		"mining.process",
		"mining.paycheck",
		"mining.sell",
		"mining.vehicle"
	},
	["Fisker"] = {
		_config = { gtype = "job",
			onjoin = function(player) 
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du er nu fisker.", type = "success", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end,
			onspawn = function(player) end,
			onleave = function(player) vRPclient.stopMission(player) end
		},
		"fisher.sell",
		"fisher.fish",
		"fisher.process",
		"fisher.vehicle",
		"fisher.paycheck"
	},
	["onservice"] = {}
}

-- groups are added dynamically using the API or the menu, but you can add group when an user join here
cfg.users = {
	[1] = { -- give superadmin and admin group to the first created user on the database
		"thanighthawk"
	}
}

-- group selectors
-- _config
--- x,y,z, blipid, blipcolor, permissions (optional)

cfg.selectors = {
	["Jobcenter"] = {
		_config = {x = -168.16870117188, y = -661.6884765625, z = 40.481990814209, blipid = 351, blipcolor = 47},
		"Taxa",
		"Udbringer",
		"Pengetransport",
		"Fisker",
		"Civil",
		"Minearbejder",
		"Skraldemand",
		"Lastbilchauffør",
		"Postbud",
		"Træhugger"
	},
	["Politi Los Santos"] = {
		_config = {x = 454.47848510742, y = -988.86291503906, z = 30.689605712891, blipid = 60, blipcolor = 17, permissions = {"cop.whitelisted"} },
		"Betjent",
		"AKS",
		"Elev",
		"Civil"
	},
	["PET agent"] = {
		_config = {x = 2476.4152832031, y = -384.03573608398, z = 93.06899261, blipid = 0, blipcolor = 0, permissions = {"cop.whitelisted"} },
		"PET-agent",
		"Civil"
	},
	["Politi Paleto Bay"] = {
		_config = {x =-442.57192993164, y = 6012.4140625, z = 31.716394424438, blipid = 60, blipcolor = 17, permissions = {"cop.whitelisted"} },
		"Betjent",
		"AKS",
		"Elev",
		"Civil"
	},
	["Politi Sandy Shores"] = {
		_config = {x = 1851.4848632813, y = 3683.5070800781, z = 34.26708984375, blipid = 60, blipcolor = 17, permissions = {"cop.whitelisted"} },
		"Betjent",
		"AKS",
		"Elev",
		"Civil"
	},
	["Advokat"] = {
		_config = {x = 126.38735198975, y = -752.14984130859, z =242.15205383301, blipid = 0, blipcolor = 0, permissions = {"lawyer.whitelisted"} },
		"Advokat",
		"Civil"
	},
	["Dommer"] = {
		_config = {x = 257.22860717773, y = -426.95440673828, z = -118.46514129639, blipid = 351, blipcolor = 16, permissions = {"judge.whitelisted"} },
		"Dommer",
		"Civil"
	},
	["Psykolog"] = {
		_config = {x = -1911.8001708984, y = -569.59149169922, z = 19.097211837769, blipid = 133, blipcolor = 23, permissions = {"psychologist.whitelisted"} },
		"Psykolog",
		"Civil"
	},
	["Hospital Los Santos"] = {
		_config = {x = 266.20809936523, y = -1364.8111572266, z = 24.537786483765, blipid = 0, blipcolor = 0, permissions = {"ems.whitelisted"} },
		"Læge",
		"Lægeelev",
		"Civil"
	},
	["Journalist"] = {
		_config = {x = 1160.3024902344, y = -3191.966796875, z = -39.007976531982, blipid = 0, blipcolor = 0, permissions = {"journalist.whitelisted"} },
		"Journalist",
		"Civil"
	},
	["Mekaniker"] = {
		_config = {x = 964.46337890625, y = -3003.4372558594, z = -39.639892578125, blipid = 351, blipcolor = 3, permissions = {"mechanic.whitelisted"} },
		"Mekaniker",
		"Civil"
	}
}

return cfg

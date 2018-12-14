vRPbj = {}
Tunnel.bindInterface("vrp_basejumping",vRPbj)
Proxy.addInterface("vrp_basejumping",vRPbj)
BJserver = Tunnel.getInterface("vrp_basejumping","vrp_basejumping")
vRPserver = Tunnel.getInterface("vRP","vrp_basejumping")
vRP = Proxy.getInterface("vRP")

local string1 = "| BaseJumping Notifikation |"
local string2 = "Du dækkede omkostningerne for faldskærmsudspringet på 150,- DKK. God tur ned!"
local string3 = "Du dækkede ikke omkostningerne for faldskærmsudspringet. <br/ ><br /> <font style='color:#FF0000'>Du blev nægtet en faldskærm.</font>"

local para = {
	["parachute1"] = {
		position = { ['x'] = 454.8185, ['y'] = 5584.343, ['z'] = 781.2034 },
		name = "Base Jump",
	},
	["parachute2"] = {
		position = { ['x'] = -128.143, ['y'] = -596.1727, ['z'] = 201.7354 },
		name = "Base Jump",
	},
	["parachute3"] = {
		position = { ['x'] = -1136.317, ['y'] = 4659.592, ['z'] = 243.9243 },
		name = "Base Jump",
	},
	["parachute4"] = {
		position = { ['x'] = 1665.401, ['y'] = -27.96845, ['z'] = 196.9363 },
		name = "Base Jump",
	},
	["parachute5"] = {
		position = { ['x'] = -546.6611, ['y'] = -2229.825, ['z'] = 122.3656 },
		name = "Base Jump",
	},
	["parachute6"] = {
		position = { ['x'] = -119.712, ['y'] = -976.443, ['z'] = 296.197 },
		name = "Base Jump",
	},
}

-- blips
Citizen.CreateThread(function()
	for k,v in pairs(para) do
		local bjump = v.position

		local blip = AddBlipForCoord(bjump.x, bjump.y, bjump.z)
		SetBlipSprite(blip, 94)
		SetBlipColour(blip, 15)
		SetBlipScale(blip, 0.8)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Basejump")
		EndTextCommandSetBlipName(blip)
	end
end)


function giveParachute()
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("GADGET_PARACHUTE"), 150, true, true)
end

function vRPbj.charged(player)
	giveParachute()
	TriggerEvent("pNotify:SendNotification",{text = "<center><strong><b style='color:#B2FF33'>"..string1.."</b><strong><br /> <br /> "..string2.."</center>",type = "success",timeout = (5000),layout = "centerRight",queue = "global"})
end

function vRPbj.failed(player)
	TriggerEvent("pNotify:SendNotification",{text = "<center><strong><b style='color:#B2FF33'>"..string1.."</b><strong><br /> <br /> "..string3.."</center>",type = "success",timeout = (5000),layout = "centerRight",queue = "global"})
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local pos = GetEntityCoords(GetPlayerPed(-1), true)

		for k,v in pairs(para)do
			local pos2 = v.position

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0)then
					DrawMarker(27, v.position.x, v.position.y, v.position.z-1.0, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)
					if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 1.0)then
                        ClearPrints()
                        SetTextEntry_2("STRING")
						AddTextEntry("BJ_Text",('Press ~INPUT_CONTEXT~ to take a Parachute. This will cost you $50.'))
					    DisplayHelpTextThisFrame("BJ_Text",false )
                        if IsControlJustPressed(0, 38) then
                        BJserver.charge()
                        end
					end
			end
		end
	end
end)
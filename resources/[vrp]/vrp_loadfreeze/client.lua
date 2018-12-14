vRfz = {}
Tunnel.bindInterface("vrp_loadfreeze",vRPfz)
Proxy.addInterface("vrp_loadfreeze",vRPfz)
FZserver = Tunnel.getInterface("vrp_loadfreeze","vrp_loadfreeze")
vRPserver = Tunnel.getInterface("vRP","vrp_loadfreeze")
vRP = Proxy.getInterface("vRP")

local frozen = true
local unfrozen = false

RegisterNetEvent('vRPlf:Unfreeze')
AddEventHandler('vRPlf:Unfreeze', function()
	unfrozen = true
end)

Citizen.CreateThread(function()
	while true do
		if frozen then
			if unfrozen then
				SetEntityInvincible(GetPlayerPed(-1),false)
				SetEntityVisible(GetPlayerPed(-1),true)
				FreezeEntityPosition(GetPlayerPed(-1),false)
				DisableControlAction(0,56,false) -- disable F9
				DisableControlAction(0,51,false) -- disable E
				frozen = false
			else
				SetEntityInvincible(GetPlayerPed(-1),true)
				SetEntityVisible(GetPlayerPed(-1),false)
				FreezeEntityPosition(GetPlayerPed(-1),true)
				DisableControlAction(0,56,true) -- disable F9
				DisableControlAction(0,51,true) -- disable E
			end
		end
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3000)
    	TriggerServerEvent('eye:color')	  
	end
end)

RegisterNetEvent('eyes')
AddEventHandler('eyes', function(eyes)
  Wait(1000)
  SetPedEyeColor(GetPlayerPed(-1), eyes)
end)
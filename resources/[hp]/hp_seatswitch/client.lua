vRPbsT = {}
Tunnel.bindInterface("hp_seatswitch",vRPbsT)
Proxy.addInterface("hp_seatswitch",vRPbsT)
vRPbsS = Tunnel.getInterface("hp_seatswitch","hp_seatswitch")
vRP = Proxy.getInterface("vRP")

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
			if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) == GetPlayerPed(-1) then
				if GetIsTaskActive(GetPlayerPed(-1), 165) then
					SetPedIntoVehicle(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
				end
			end
		end
	end
end)

RegisterNetEvent('hp:seatSwitch')
AddEventHandler('hp:seatSwitch', function(choice)
	local ped = PlayerPedId()
	if not vRP.isHandcuffed() then
		if IsPedInAnyVehicle(ped, true) then
			local veh = GetVehiclePedIsIn(ped, true)

			if IsVehicleSeatFree(veh,choice) then
				TaskWarpPedIntoVehicle(ped,veh,choice)
			else
				TriggerEvent("pNotify:SendNotification",{text = "Sædet er ikke ledigt.",type = "success",timeout = (2000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})  
			end
		end
	end
end)

--[[

					Made by
  _______       _   _ ______ _____ ______ _____  
 |__   __|/\   | \ | |___  // ____|  ____|  __ \ 
    | |  /  \  |  \| |  / /| |    | |__  | |__) |
    | | / /\ \ | . ` | / / | |    |  __| |  _  / 
    | |/ ____ \| |\  |/ /__| |____| |____| | \ \ 
    |_/_/    \_\_| \_/_____|\_____|______|_|  \_\
	
				For ByHyperion.net
--]]

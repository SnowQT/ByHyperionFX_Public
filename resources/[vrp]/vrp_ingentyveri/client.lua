vRPncj = {}
Tunnel.bindInterface("vrp_nocarjack",vRPncj)
Proxy.addInterface("vrp_nocarjack",vRPncj)
NCJserver = Tunnel.getInterface("vrp_nocarjack","vrp_nocarjack")
vRPserver = Tunnel.getInterface("vRP","vrp_nocarjack")
vRP = Proxy.getInterface("vRP")

Citizen.CreateThread(function()
    while true do
		-- gets if player is entering vehicle
        if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId())) then
			-- gets vehicle player is trying to enter and its lock status
            local veh = GetVehiclePedIsTryingToEnter(PlayerPedId())
            local lock = GetVehicleDoorLockStatus(veh)
	    
	    -- Get the conductor door angle, open if value > 0.0
            local doorAngle = GetVehicleDoorAngleRatio(veh, 0)
			
			-- normalizes chance
			if cfg.chance > 100 then
			  cfg.chance = 100
			elseif cfg.chance < 0 then
			  cfg.chance = 0
			end
			
			-- check if got lucky
			local lucky = (math.random(100) < cfg.chance)
			
			-- Set lucky if conductor door is open
			if doorAngle > 0.0 then
				lucky = true
			end
				
			-- check if vehicle is in blacklist
			local backlisted = false
			for k,v in pairs(cfg.blacklist) do
			  if IsVehicleModel(veh, GetHashKey(v)) then
			    blacklisted = true
			  end
			end

			-- gets ped that is driving the vehicle
            local pedd = GetPedInVehicleSeat(veh, -1)
			local plate = GetVehicleNumberPlateText(veh)
			-- lock doors if not lucky or blacklisted
            if (lock == 7 or pedd) then
				if not lucky or blacklisted then
					NCJserver.setVehicleDoorsForEveryone({veh, 2, plate})
				else
					NCJserver.setVehicleDoorsForEveryone({veh, 1, plate})
				end
            end
        end
        Citizen.Wait(0)	    							
    end
end)

function vRPncj.setVehicleDoors(veh, doors)
  SetVehicleDoorsLocked(veh, doors)
end

 function vRPncj.lockpickVehicle(wait,any)
    Citizen.CreateThread(function()
        local pos = GetEntityCoords(GetPlayerPed(-1))
        local entityWorld = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 20.0, 0.0)

        local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, GetPlayerPed(-1), 0)
        local _, _, _, _, vehicleHandle = GetRaycastResult(rayHandle)
        if DoesEntityExist(vehicleHandle) then
          if GetVehicleDoorsLockedForPlayer(vehicleHandle,PlayerId()) or any then
            local prevObj = GetClosestObjectOfType(pos.x, pos.y, pos.z, 10.0, GetHashKey("prop_weld_torch"), false, true, true)
            if(IsEntityAnObject(prevObj)) then
                SetEntityAsMissionEntity(prevObj)
                DeleteObject(prevObj)
            end
            StartVehicleAlarm(vehicleHandle)
            TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_WELDING", 0, true)
            Citizen.Wait(wait*1000)
            SetVehicleDoorsLocked(vehicleHandle, 1)

            for i = 1,64 do 
                SetVehicleDoorsLockedForPlayer(vehicleHandle, GetPlayerFromServerId(i), false)
            end 
            ClearPedTasksImmediately(GetPlayerPed(-1))
            
            TriggerEvent("pNotify:SendNotification",{text = "Du fik dirket køretøjet op.",type = "info",timeout = (2000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
            
            local plate = GetVehicleNumberPlateText(vehicleHandle)
            NCJserver.lockSystemUpdate({1, plate})
            NCJserver.playSoundWithinDistanceOfEntityForEveryone({vehicleHandle, 10, "unlock", 1.0}) else
            TriggerEvent("pNotify:SendNotification",{text = "Køretøjet er allerede åbnet.",type = "info",timeout = (2000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
            end
        else
            TriggerEvent("pNotify:SendNotification",{text = "Du er for langt væk fra køretøjet.",type = "info",timeout = (2000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
        end
    end)
end
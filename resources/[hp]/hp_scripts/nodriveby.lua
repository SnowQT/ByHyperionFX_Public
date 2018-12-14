local passengerDriveBy = true

Citizen.CreateThread(function()
	while true do
		Wait(1)
		
		local playerPed = GetPlayerPed(-1)
		local car = GetVehiclePedIsIn(playerPed, false)
		local inCar = GetPedInVehicleSeat(car,-1)
		local ped = GetPlayerPed(PlayerId())
		local fists = GetHashKey("WEAPON_UNARMED")
		local weapon = GetSelectedPedWeapon(ped)
		
		if weapon ~= fists then
			if car then
				if inCar == playerPed then
					SetPlayerCanDoDriveBy(PlayerId(),false)
				elseif passengerDriveBy then
					SetPlayerCanDoDriveBy(PlayerId(),true)
				else
					SetPlayerCanDoDriveBy(PlayerId(),false)
				end
			end
		else 
			if car then
				if inCar == playerPed then
					SetPlayerCanDoDriveBy(PlayerId(),true)
				end
			end
		end
	end
end)
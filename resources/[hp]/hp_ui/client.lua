function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
  AddTextEntry('FE_THDR_GTAO', 'ByHyperion.net - Dansk RP')
end)

local isRadarExtended = false

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function drawRct(x,y,width,height,r,g,b,a)
	DrawRect(x + width/2, y + height/2, width, height, r, g, b, a)
end

local beltOn = false

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        
        local get_ped = GetPlayerPed(-1) -- current ped
        local get_ped_veh = GetVehiclePedIsIn(GetPlayerPed(-1),false) -- Current Vehicle ped is in
		local isEngineOn = Citizen.InvokeNative(0xAE31E7DF9B5B132E, GetVehiclePedIsIn(GetPlayerPed(-1)))
        -- local veh_stop = IsVehicleStopped(get_ped_veh) -- Parked or not

		drawRct(0.0135, 0.968, 0.1440,0.030,32,32,34,250)

        if (IsPedInAnyVehicle(GetPlayerPed(-1), false)) and not isRadarExtended then
            local kmh = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6

			if isEngineOn then
				drawTxt(0.618, 1.4325, 1.0,1.0,0.42, "~w~" .. math.ceil(kmh), 255, 255, 255, 220)  -- INT: kmh
				drawTxt(0.630, 1.4325, 1.0,1.0,0.42, "~w~ km/t", 255, 255, 255, 220)    -- TXT: kmh    
			end
        end        
    end
end)

local frontwindowup = true
RegisterNetEvent("RollWindowFront")
AddEventHandler('RollWindowFront', function()
    local playerPed = GetPlayerPed(-1)
    if IsPedInAnyVehicle(playerPed,false) then
        local playerCar = GetVehiclePedIsIn(playerPed,false)
		if (GetPedInVehicleSeat( playerCar,-1) == playerPed) then 		
			if (frontwindowup) then
				RollDownWindow(playerCar,0)
				RollDownWindow(playerCar,1)
				frontwindowup = false
			else
				RollUpWindow(playerCar, 0)
				RollUpWindow(playerCar, 1)
				frontwindowup = true
			end
		end
	end
end)
local backwindowup = true
RegisterNetEvent("RollWindowBack")
AddEventHandler('RollWindowBack', function()
    local playerPed = GetPlayerPed(-1)
    if IsPedInAnyVehicle(playerPed,false) then
        local playerCar = GetVehiclePedIsIn(playerPed,false)
		if (GetPedInVehicleSeat(playerCar,-1) == playerPed) then 		
			if (backwindowup) then
				RollDownWindow(playerCar,2)
				RollDownWindow(playerCar,3)
				backwindowup = false
			else
				RollUpWindow(playerCar, 2)
				RollUpWindow(playerCar, 3)
				backwindowup = true
			end
		end
	end
end)
Citizen.CreateThread(function()
	while true do
        if IsControlJustPressed(0,10) then
            TriggerEvent('RollWindowFront')
        elseif IsControlJustPressed(0,11) then
            TriggerEvent('RollWindowBack')
        end
        Citizen.Wait(10)
    end
end)
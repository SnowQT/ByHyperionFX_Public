local WaitTime = 100 -- How often do you want to update the status (In MS)

Citizen.CreateThread(function()
	while true do
        --This is the Application ID (Replace this with you own)
		SetDiscordAppId(0000000000000000)

        --Here you will have to put the image name.
		SetDiscordRichPresenceAsset('SERVERLOGO')

        --It updates every one minute just in case.
		Citizen.Wait(60000)
	end
end)

Citizen.CreateThread(function()
	while true do
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(),true))
		local StreetHash = GetStreetNameAtCoord(x, y, z)

	    local onlinePlayers = 0
		for i = 0, 31 do
			if NetworkIsPlayerActive(i) then
				onlinePlayers = onlinePlayers+1
			end
		end

		Citizen.Wait(WaitTime)
		if StreetHash ~= nil then
			StreetName = GetStreetNameFromHashKey(StreetHash)
			if IsPedOnFoot(PlayerPedId()) and not IsEntityInWater(PlayerPedId()) then
				  if not IsEntityInArea(PlayerPedId(),2631.851,2572.982,45.096,-2449.445,711.613,264.987,false,false,0) then
           if IsPedSprinting(PlayerPedId()) then
					SetRichPresence(onlinePlayers.."/32 | Sprinter ned af "..StreetName)
				elseif IsPedRunning(PlayerPedId()) then
					SetRichPresence(onlinePlayers.."/32 | Løber ned af "..StreetName)
				elseif IsPedWalking(PlayerPedId()) then
					SetRichPresence(onlinePlayers.."/32 | Går ned af "..StreetName)
				elseif IsPedStill(PlayerPedId()) then
					SetRichPresence(onlinePlayers.."/32 | Står på "..StreetName)
				end
				else
				if IsPedRunning(PlayerPedId()) or GetEntitySpeed(PlayerPedId()) > 2.0 then
					SetRichPresence(onlinePlayers.."/32 | Løber bange rundt på "..StreetName)
				elseif not IsPedRunning(PlayerPedId()) and GetEntitySpeed(PlayerPedId()) > 1.0 and GetEntitySpeed(PlayerPedId()) < 2.0 then
					SetRichPresence(onlinePlayers.."/32 | Søger rundt alene på "..StreetName)
				else
					SetRichPresence(onlinePlayers.."/32 | Slapper af på "..StreetName)
				end
				end
			elseif IsPedInAnyVehicle(PlayerPedId(), false) and not IsPedInAnyHeli(PlayerPedId()) and not IsPedInAnyPlane(PlayerPedId()) and not IsPedOnFoot(PlayerPedId()) and not IsPedInAnySub(PlayerPedId()) and not IsPedInAnyBoat(PlayerPedId()) then
				local MPH = math.ceil(GetEntitySpeed(GetVehiclePedIsUsing(PlayerPedId())) * 2.23693629205)
				local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))))
				if MPH > 50 and not IsPedOnAnyBike(PlayerPedId()) then
					SetRichPresence(onlinePlayers.."/32 | Blæser ned "..StreetName)
				elseif MPH <= 50 and MPH > 0  then
					SetRichPresence(onlinePlayers.."/32 | Cruiser ned af "..StreetName)
				elseif MPH == 0 then
					SetRichPresence(onlinePlayers.."/32 | Holder parkeret på "..StreetName)
				elseif MPH > 50 and IsPedOnAnyBike(PlayerPedId()) then
					SetRichPresence(onlinePlayers.."/32 | Kører rundt i nærheden af "..StreetName)
				end
			elseif IsPedInAnyHeli(PlayerPedId()) or IsPedInAnyPlane(PlayerPedId()) then
				local KT = math.ceil(GetEntitySpeed(GetVehiclePedIsUsing(PlayerPedId())) * 1.9438444924406046)
				local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))))
				if IsEntityInAir(GetVehiclePedIsUsing(PlayerPedId())) and GetEntityHeightAboveGround(GetVehiclePedIsUsing(PlayerPedId())) > 25.0 and KT>90 then
					SetRichPresence(onlinePlayers.."/32 | Flyver over "..StreetName.." i en "..VehName)
				elseif IsEntityInAir(GetVehiclePedIsUsing(PlayerPedId())) and GetEntityHeightAboveGround(GetVehiclePedIsUsing(PlayerPedId())) <= 25.0 and KT < 90 and KT>40 and GetLandingGearState(GetVehiclePedIsIn(PlayerPedId(), false)) == 0 then
					SetRichPresence(onlinePlayers.."/32 | Lander ved "..StreetName.." i en "..VehName)
				elseif GetEntityHeightAboveGround(GetVehiclePedIsUsing(PlayerPedId())) <= 25.0 and KT >= 90 and KT < 120 and GetLandingGearState(GetVehiclePedIsIn(PlayerPedId())) == 0 then
					SetRichPresence(onlinePlayers.."/32 | Igang med take off ved "..StreetName.." i en "..VehName)
				else
					SetRichPresence(onlinePlayers.."/32 | Landede ved "..StreetName.." i en "..VehName)
				end
			elseif IsEntityInWater(PlayerPedId()) then
				SetRichPresence(onlinePlayers.."/32 | Svømmer rundt")
			elseif IsPedInAnyBoat(PlayerPedId()) and IsEntityInWater(GetVehiclePedIsUsing(PlayerPedId())) then
				local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))))
				SetRichPresence(onlinePlayers.."/32 | Sejler rundt med en "..VehName)
			elseif IsPedInAnySub(PlayerPedId()) and IsEntityInWater(GetVehiclePedIsUsing(PlayerPedId())) then
				SetRichPresence(onlinePlayers.."/32 | OCEAN MAN 🌊 😍 Take me by the hand ✋ lead me to the land that you understand 🙌 🌊")
			end
		end
	end
end)

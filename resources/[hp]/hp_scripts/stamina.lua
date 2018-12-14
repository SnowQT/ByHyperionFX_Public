--##STAMINA FOR DOLLY'S KØTER##--
Citizen.CreateThread( function()
 while true do
    Citizen.Wait(0)
        if IsPedModel(GetPlayerPed(-1),-1788665315) or IsPedModel(GetPlayerPed(-1),351016938) then
            RestorePlayerStamina(PlayerId(), 1.0)
        end
    end
end)
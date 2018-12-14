function InitialSetups()
	FreezeEntityPosition(GetPlayerPed(-1),true)
    SetEntityInvincible(GetPlayerPed(-1), true)
    SetEntityVisible(GetPlayerPed(-1), false, false)

    SwitchOutPlayer(PlayerPedId(), 0, 1)
    Wait(1000)
    MovePlayer()
end

function InitialSetup()
    FreezeEntityPosition(GetPlayerPed(-1),true)
    SetEntityInvincible(GetPlayerPed(-1), true)
    SetEntityVisible(GetPlayerPed(-1), false, false)

    SwitchOutPlayer(PlayerPedId(), 0, 1)
    Wait(5000)
    MovePlayerSpawn()
end

function MovePlayer()
	Wait(1000)
    SetEntityCoords(PlayerPedId(),384.882293701172,-583.485046386719,29.6579773712158, 1, 0, 0, 1)
    Wait(25000)
    SetEntityInvincible(GetPlayerPed(-1), false)
    SetEntityVisible(GetPlayerPed(-1), true, false)
    FreezeEntityPosition(GetPlayerPed(-1),false)
    SetPlayer()
end

function MovePlayerSpawn()
    SetEntityInvincible(GetPlayerPed(-1), false)
    SetEntityVisible(GetPlayerPed(-1), true, false)
    FreezeEntityPosition(GetPlayerPed(-1),false)
    SetPlayer()
end

function SetPlayer()
    SwitchInPlayer(PlayerPedId())
end

RegisterNetEvent("movebitch")
AddEventHandler("movebitch", function()
	InitialSetups()
end)

RegisterNetEvent("moveme")
AddEventHandler("moveme", function()
	Wait(20000)
    InitialSetup()
end)

-- Citizen.CreateThread(function()
    -- while true do
        -- Citizen.Wait(0)
        -- if IsControlJustPressed(0,38) then --E
            -- InitialSetups()
        -- end
    -- end
-- end)
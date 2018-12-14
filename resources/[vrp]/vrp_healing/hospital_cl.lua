local treatment = false
local timer = false

local blips = {
    {name="Lægetjek", id=489, x= 338.85, y= -1394.56, z= 31.51, color= 1},
    {name="Lægetjek", id=489, x= -449.67, y= -340.83, z= 33.50, color= 1},
    {name="Lægetjek", id=489, x= 1827.97, y= 3692.58, z= 33.22, color= 1},
    {name="Lægetjek", id=489, x= -239.89, y= 6323.59, z= 31.42, color= 1},

}


function ply_drawTxt(text,font,centre,x,y,scale,r,g,b,a)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x,y)
end

Citizen.CreateThread(function()
    for _, item in pairs(blips) do
        item.blip = AddBlipForCoord(item.x, item.y, item.z)
        SetBlipSprite(item.blip, item.id)
        SetBlipColour(item.blip, item.color)
        SetBlipAsShortRange(item.blip, true)
        SetBlipScale(item.blip, 0.8)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(item.name)
        EndTextCommandSetBlipName(item.blip)
    end
end)



DelayTime = 100

function StartDelay()
    DelayTime = DelayTime - 1
    if DelayTime == 0 then
        DelayOnThis = false
    else
        Wait(1000)
        StartDelay()
    end
end

function DelayTrue()
    ply_drawTxt('~r~Lægen har ikke tid til dig lige nu din lømmel! .', 0, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)



end

local DelayVehMsg = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        for _, item in pairs(blips) do

            if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), item.x, item.y, item.z, true) <= 20 then
                DrawMarker(27, item.x, item.y, item.z, 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 0.5001, 0, 155, 255, 50, 0, 0, 0, 0)
                if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), item.x,item.y,item.z, true) <= 2 then

                    if DelayOnThis then

                        DelayTrue()
                        TriggerEvent("pNotify:SendNotification",{text = "Delay besked.",type = "info",timeout = (15000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})

                    else
                        ply_drawTxt("[~b~E~w~] for at blive tilset.",0,1,0.5,0.8,0.6,255,255,255,255)
                        if (IsControlJustPressed(0,38)) and (GetEntityHealth(GetPlayerPed(-1)) < 200) and not (GetEntityHealth(GetPlayerPed(-1)) == 105) and (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), item.x, item.y, item.z, true) <= 2) then

                            if not DelayOnThis then
                                local ped = GetPlayerPed(-1)
                                local veh = GetVehiclePedIsUsing(ped)
                                if DoesEntityExist(veh) then
                                    if not DelayVehMsg then
                                        TriggerEvent("pNotify:SendNotification", {text = "Lægen kan ikke tilse dig når du sidder i et køretøj!", type = "error", timeout = 2000, layout = "centerLeft"})
                                        DelayVehMsg = true
                                        Citizen.Wait(2000)
                                        DelayVehMsg = false
                                    end
                                else
                                    TriggerEvent("pNotify:SendNotification",{text = "Du er ved at blive tilset af en læge.",type = "info",timeout = (15000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                                    treatment = true
                                end

                            else
                                TriggerEvent("pNotify:SendNotification",{text = "Delay besked.",type = "info",timeout = (15000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                                DelayTrue()
                            end
                        end

                    end
                end
                if (IsControlJustPressed(0,38)) and (GetEntityHealth(GetPlayerPed(-1)) == 200) and (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), item.x, item.y, item.z, true) <= 2) then
                    TriggerEvent("pNotify:SendNotification",{text = "Du er helt rask.",type = "info",timeout = (4000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})


                end
                if treatment then
                    Citizen.Wait(15000)
                    timer = true
                end
                if treatment == true and timer == true and (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), item.x, item.y, item.z, true) <= 2) then
                    TriggerServerEvent('hospital:price')
                    SetEntityHealth(GetPlayerPed(-1), 200)
                    TriggerEvent("pNotify:SendNotification",{text = "Du er så god som ny!",type = "info",timeout = (4000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                    treatment = false
                    timer = false
                    DelayOnThis = true
                    DelayTrue()
                    DelayTime = 10800
                    StartDelay()
                end
                if treatment == true and timer == true and (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), item.x, item.y, item.z, true) > 2) then
                    TriggerEvent("pNotify:SendNotification",{text = "Du gik væk fra lægen, og blev derfor ikke tilset færdigt.",type = "info",timeout = (4000),layout = "bottomCenter",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                    treatment = false
                    timer = false
                end
            end
        end
    end
end)

local npcs = {
    {Model="s_m_m_doctor_01", pedtype=4, hash=0xd47303ac, X=338.85, Y=-1394.56, Z=31.51, A=49.404},
    {Model="ig_casey", pedtype=4, hash=0xe0fa2554, X=1628.3411865234, Y=2543.0483398438, Z=44.564861297607, A=318.69863891602},
    {Model="cs_bankman", pedtype=4, hash=0x9760192e, X=-1159.9146728516, Y=-1718.5594482422, Z=3.9049320220947, A=303.36206054688},
    {Model="cs_dale", pedtype=4, hash=0x0ce81655, X=-1375.46484375, Y=-628.11016845703, Z=29.819562911987, A=34.907833099365},
    {Model="s_f_y_bartender_01", pedtype=4, hash=0x780c01bd, X=-1391.6208496094, Y=-605.7412109375, Z=29.319547653198, A=117.3715057373},
    {Model="s_m_y_barman_01", pedtype=4, hash=0xe5a11106, X=-561.75408935547, Y=286.58889770508, Z=81.176399230957, A=262.00085449219},
    {Model="u_f_y_bikerchic", pedtype=4, hash=0xfa389d4f, X=-564.27783203125, Y=279.2751159668, Z=81.976707458496, A=173.14450073242},
    {Model="a_m_m_tranvest_01", pedtype=4, hash=0xe0e69974, X=1984.2738037109, Y=3054.4206542969, Z=46.215156555176, A=236.25871276855},
    {Model="csb_chef", pedtype=4, hash=0xa347ca8a, X=468.34915161133, Y=-728.70190429688, Z=26.365694046021, A=139.04251098633},
    {Model="csb_chef", pedtype=4, hash=0xa347ca8a, X=-29.428693771362, Y=-1979.8030273438, Z=4.5072467803955, A=60.083408355713},
    {Model="csb_chef", pedtype=4, hash=0xa347ca8a, X=-837.93676757813, Y=-135.29945373535, Z=27.184965133667, A=33.264755249023},
    {Model="mp_m_g_vagfun_01", pedtype=4, hash=0xC4A617BD, X=-1890.3912353516, Y=2091.3488769531, Z=140.10940551758, A=277.64846801758},
    {Model="mp_m_g_vagfun_01", pedtype=4, hash=0xC4A617BD, X=568.56848144531, Y=-3116.3723144531, Z=17.768402099609, A=176.65357971191},
    {Model="ig_vagspeak", pedtype=4, hash=0xF9FD068C, X=-1887.8520507813, Y=2093.1613769531, Z=139.99267578125, A=163.65740966797},
    {Model="ig_vagspeak", pedtype=4, hash=0xF9FD068C, X=-1889.6057128906, Y=2089.7673339844, Z=139.9945526123, A=284.94931030273},
    {Model="ig_vagspeak", pedtype=4, hash=0xF9FD068C, X=566.17388916016, Y=-3117.7312011719, Z=17.768579483032, A=243.12469482422},
    {Model="ig_vagspeak", pedtype=4, hash=0xF9FD068C, X=586.64782714844, Y=-3119.2038574219, Z=17.711666107178, A=269.76547241211},
    {Model="a_c_rottweiler", pedtype=4, hash=0x9563221d, X=-1890.5649414063, Y=2092.2463378906, Z=139.99348449707, A=139.99348449707},
    {Model="a_c_rottweiler", pedtype=4, hash=0x9563221d, X=567.40246582031, Y=-3116.6899414063, Z=18.800747756958, A=204.8321685791},
    {Model="u_m_y_tattoo_01", pedtype=4, hash=0x94ae2b8c, X=-2186.9040527344, Y=4249.9233398438, Z=47.939937591553, A=34.756736755371},
    {Model="u_m_y_tattoo_01", pedtype=4, hash=0x94ae2b8c, X=-607.38500976563, Y=-1629.8386230469, Z=26.010812759399, A=263.42895507813},
    {Model="cs_omega", pedtype=4, hash=0x8b70b405, X=1126.1494140625, Y=-980.21728515625, Z=44.415744781494, A=185.19454956055},
    {Model="u_m_y_hippie_01", pedtype=4, hash=0xf041880b, X=1407.0301513672, Y=3666.0280761719, Z=33.064743041992, A=58.300922393799},
    {Model="s_f_y_migrant_01", pedtype=4, hash=0xd55b2bf5, X=657.76196289063, Y=-789.42834472656, Z=23.549493789673, A=179.82698059082},
    {Model="s_m_m_migrant_01", pedtype=4, hash=0xed0ce4c6, X=656.22442626953, Y=-789.25579833984, Z=23.549493789673, A=273.49267578125},
    {Model="cs_omega", pedtype=4, hash=0x8b70b405, X=-1171.0771484375, Y=-1571.0153808594, Z=3.6636214256287, A=123.35715484619},
    {Model="a_m_y_methhead_01", pedtype=4, hash=0x696be0a9, X=2434.1123046875, Y=4969.482421875, Z=41.347576141357, A=13.397799491882},
    {Model="a_f_y_rurmeth_01", pedtype=4, hash=0x3f789426, X=31.707141876221, Y=3669.8942871094, Z=39.440631866455, A=66.72925567627},
    {Model="s_f_y_baywatch_01", pedtype=4, hash=0x4a8e5536, X=-2021.5544433594, Y=-1044.8266601563, Z=1.4467449188232, A=198.69834899902},
    {Model="s_m_y_baywatch_01", pedtype=4, hash=0x0b4a6862, X=-2017.3350830078, Y=-1040.1569824219, Z=1.4472992420197, A=249.64794921875},
}

RegisterNetEvent("vrp_healing:place")
AddEventHandler("vrp_healing:place", function()
    for _, item in pairs(npcs) do
        RequestModel(GetHashKey(item.Model))
        while not HasModelLoaded(GetHashKey(item.Model)) do
            Wait(1)
        end
        local ped =  CreatePed(item.pedtype, item.hash, item.X, item.Y, item.Z, item.A, false, true)
        SetEntityHeading(ped, item.A)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        if _ == 2 then
            TaskStartScenarioInPlace(ped, "WORLD_HUMAN_COP_IDLES")
        elseif _ == 3 then
            RequestAnimDict("mp_safehousebeer@")
            TaskPlayAnim(ped, "mp_safehousebeer@", "base_drink", 8.0, 8.0, -1, 50, 0, false, false, false)
        elseif _ == 9 then
            TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SMOKING")
        elseif _ == 10 then
            TaskStartScenarioInPlace(ped, "WORLD_HUMAN_BUM_SLUMPED")
        elseif _ == 11 then
            TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT")
        elseif _ == 12 then
            TaskStartScenarioInPlace(ped, "WORLD_HUMAN_LEANING")
        elseif _ == 13 then
            TaskStartScenarioInPlace(ped, "WORLD_HUMAN_LEANING")
        elseif _ == 14 then
            TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SMOKING")
        elseif _ == 15 then
            TaskStartScenarioInPlace(ped, "PROP_HUMAN_BUM_SHOPPING_CART")
        elseif _ == 16 then
            RequestAnimDict("amb@world_human_hang_out_street@male_c@base")
            TaskPlayAnim(ped, "amb@world_human_hang_out_street@male_c@base", "base", 8.0, 8.0, -1, 50, 0, false, false, false)
        elseif _ == 17 then
            TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_MOBILE_UPRIGHT")
        elseif _ == 18 then
            TaskStartScenarioInPlace(ped, "WORLD_DOG_SITTING_RETRIEVER")
        elseif _ == 19 then
            TaskStartScenarioInPlace(ped, "WORLD_DOG_SITTING_RETRIEVER")
        elseif _ == 20 then
            TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD")
        elseif _ == 21 then
            RequestAnimDict("amb@world_human_drug_dealer_hard@male@idle_a")
            TaskPlayAnim(ped, "amb@world_human_drug_dealer_hard@male@idle_a", "idle_c", 8.0, 8.0, -1, 1, 0, false, false, false)
        elseif _ == 22 then
            TaskStartScenarioInPlace(ped, "WORLD_HUMAN_DRUG_DEALER")
        elseif _ == 23 then
            TaskStartScenarioInPlace(ped, "WORLD_HUMAN_DRUG_DEALER")
        elseif _ == 24 then
            TaskStartScenarioInPlace(ped, "PROP_HUMAN_PARKING_METER")
        elseif _ == 25 then
            TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD")
        elseif _ == 26 then
            TaskStartScenarioInPlace(ped, "WORLD_HUMAN_DRUG_DEALER")
        elseif _ == 27 then
            TaskStartScenarioInPlace(ped, "PROP_HUMAN_PARKING_METER")
        elseif _ == 28 then
            TaskStartScenarioInPlace(ped, "PROP_HUMAN_PARKING_METER")
        elseif _ == 29 then
            TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_FISHING")
        elseif _ == 30 then
            TaskStartScenarioInPlace(ped, "WORLD_HUMAN_BINOCULARS")
        end

    end
end)
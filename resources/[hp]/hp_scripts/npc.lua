Citizen.CreateThread(function()
    RequestModel(GetHashKey("ig_casey"))
    while not HasModelLoaded(GetHashKey("ig_casey")) do
      Wait(1)
    end
      local caseyped =  CreatePed(4, 0xe0fa2554, 1628.3411865234, 2543.0483398438, 44.564861297607, 318.69863891602, false, true)
      SetEntityHeading(caseyped, 318.69863891602)
      FreezeEntityPosition(caseyped, true)
      SetEntityInvincible(caseyped, true)
      SetBlockingOfNonTemporaryEvents(caseyped, true)
end)

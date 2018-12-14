local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vRP_heal")

RegisterServerEvent("hospital:price")
AddEventHandler("hospital:price", function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
	if vRP.tryFullPayment({user_id,500}) then
    end
end)

AddEventHandler("vRP:playerSpawn", function(user_id, source, first_spawn)
    if first_spawn then
        TriggerClientEvent("vrp_healing:place", source)
    end
end)


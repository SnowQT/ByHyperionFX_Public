--Settings--
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_detector")


RegisterServerEvent('checklige')
AddEventHandler('checklige', function()
	local source = source
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    local cop = vRP.hasGroup({user_id,"police"})
    local ems = vRP.hasGroup({user_id,"ems"})
    
	if cop or ems then
	--Nothing
	else
      TriggerClientEvent('isnotgovernment',player)
    end
end)

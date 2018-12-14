local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_fart")

RegisterServerEvent('betalFart')
AddEventHandler('betalFart', function(tax)
	local source = source
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})

    local cop = vRP.hasGroup({user_id,"police"})
    local ems = vRP.hasGroup({user_id,"ems"})

    if cop or ems then
    --nothing
	else
	vRP.tryFullPayment({user_id,tax})
	end
end)
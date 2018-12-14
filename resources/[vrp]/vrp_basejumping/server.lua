-- a basic gunshop implementation
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRPbj = {}
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_basejumping")
BJclient = Tunnel.getInterface("vrp_basejumping","vrp_basejumping")
Tunnel.bindInterface("vrp_basejumping",vRPbj)

local pris = 150

function vRPbj.charge()
	local source = source
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})

    if vRP.tryFullPayment({user_id,pris}) then
		BJclient.charged(player)
	else
		BJclient.failed(player)
	end
end
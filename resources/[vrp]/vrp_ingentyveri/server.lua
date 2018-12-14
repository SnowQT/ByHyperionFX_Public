local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRPncj = {}
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_nocarjack")
NCJclient = Tunnel.getInterface("vrp_nocarjack","vrp_nocarjack")
Tunnel.bindInterface("vrp_nocarjack",vRPncj)

local vehicles = {}
function vRPncj.setVehicleDoorsForEveryone(veh, doors, plate)
  if not vehicles[plate] then
    local user_id = vRP.getUserId({source})
    vRP.getUserIdentity({user_id, function(identity)
	  local user_plate = "P" .. identity.registration
	  if user_plate ~= plate then
	    local users = vRP.getUsers({})
	    for k,v in pairs(users) do
          NCJclient.setVehicleDoors(v,{veh, doors})
	    end
	  end
	end})
	vehicles[plate] = true
  end
end

--lua
--lockpick vehicle
local ch_lockpickveh = {function(player,choice) 
    NCJclient.lockpickVehicle(player,{10,true})
end,"Lirk den nærmeste bildør op."}


-- lockpicking item
vRP.defInventoryItem({"lockpicking_kit","Dirkesæt","Bruges til at åbne biler med sammen med en skruetrækker.", -- add it for sale to vrp/cfg/markets.lua if you want to use it
function(args)
  local choices = {}

  choices["Lockpick"] = {function(player,choice)
    local user_id = vRP.getUserId({player})
    if user_id ~= nil then
     if vRP.tryGetInventoryItem({user_id, "lockpicking_kit", 1, true}) and vRP.tryGetInventoryItem({user_id, "screwdriver", 1, true}) then
    	NCJclient.lockpickVehicle(player,{10,true})
        vRP.closeMenu({player})
     end
   end
  end,"Lirk nærmseste bil op."}

  return choices
end,
0.50})
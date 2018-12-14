local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","hp_seatswitch")

AddEventHandler('chatMessage', function(source, name, message)
	splitmessage = stringsplit(message, " ")
        
    if string.lower(splitmessage[1]) == "/forsæde" or string.lower(splitmessage[1]) == "/fører" then
        CancelEvent()
		local seat = -1
        TriggerClientEvent("hp:seatSwitch", source, seat)
    elseif string.lower(splitmessage[1]) == "/passager" then
        CancelEvent()
		local seat = 0
        TriggerClientEvent("hp:seatSwitch", source, seat)
    elseif string.lower(splitmessage[1]) == "/bagsædev" or string.lower(splitmessage[1]) == "/bagsæde1" then
        CancelEvent()
		local seat = 1
        TriggerClientEvent("hp:seatSwitch", source, seat)
    elseif string.lower(splitmessage[1]) == "/bagsædeh" or string.lower(splitmessage[1]) == "/bagsæde2" then
        CancelEvent()
		local seat = 2
        TriggerClientEvent("hp:seatSwitch", source, seat)
	end
end)

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

--[[

					Made by
  _______       _   _ ______ _____ ______ _____  
 |__   __|/\   | \ | |___  // ____|  ____|  __ \ 
    | |  /  \  |  \| |  / /| |    | |__  | |__) |
    | | / /\ \ | . ` | / / | |    |  __| |  _  / 
    | |/ ____ \| |\  |/ /__| |____| |____| | \ \ 
    |_/_/    \_\_| \_/_____|\_____|______|_|  \_\
	
				For ByHyperion.net
--]]

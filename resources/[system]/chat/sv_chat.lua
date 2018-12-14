local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_chatroles")

RegisterServerEvent('chat:init')
RegisterServerEvent('chat:addTemplate')
RegisterServerEvent('chat:addMessage')
RegisterServerEvent('chat:addSuggestion')
RegisterServerEvent('chat:removeSuggestion')
RegisterServerEvent('_chat:messageEntered')
RegisterServerEvent('chat:clear')
RegisterServerEvent('__cfx_internal:commandFallback')

AddEventHandler('_chat:messageEntered', function(author, color, message)
    if not message or not author then
        return
    end
	
	message = Emojit(message)
    TriggerEvent('chatMessage', source, author, message)
	
    if not WasEventCanceled() then
        local user_id = vRP.getUserId({source})
        local player = vRP.getUserSource({user_id})
        if vRP.hasPermission({user_id,"god.chattitle"}) then
            TriggerClientEvent('chatMessage', -1, "^5HYPERION ^0 | ^5*G* ^0| ^5" ..author.." ^0(^5"..user_id.."^0): " ..  message)
        elseif vRP.hasPermission({user_id,"nighthawk.chattitle"}) then
            TriggerClientEvent('chatMessage', -1, "^5HYPERION^0 | ^1EJER ^0| ^1" ..author.." ^0(^1"..user_id.."^0): " ..  message)
        elseif vRP.hasPermission({user_id,"superadmin.chattitle"}) then
            TriggerClientEvent('chatMessage', -1, "^5HYPERION ^0| ^1LEDELSE ^0| ^1" ..author.." ^0(^1"..user_id.."^0): " ..  message)
        elseif vRP.hasPermission({user_id,"mod.chattitle"}) then    
            TriggerClientEvent('chatMessage', -1, "^5HYPERION ^0| ^3HJÆLPER ^0| ^3" ..author.." ^0(^3"..user_id.."^0): " ..  message)
        end
    end
	
	CancelEvent()
    print(author .. ': ' .. message)
end)

AddEventHandler('__cfx_internal:commandFallback', function(command)
    if not command then
        return
    end
	
    local name = GetPlayerName(source)
	
	command = Emojit(command)
    TriggerEvent('chatMessage', source, name, '/' .. command)

    if not WasEventCanceled() then
        local user_id = vRP.getUserId({source})
        local player = vRP.getUserSource({user_id})
		if vRP.hasPermission({user_id,"god.chattitle"}) then
            TriggerClientEvent('chatMessage', source, "^5*G* ^0| ^5" .. name .. "^0: " .. '/' .. command)
        elseif vRP.hasPermission({user_id,"nighthawk.chattitle"}) then
            TriggerClientEvent('chatMessage', source, "^1EJER ^0|^1" .. name .. "^0: " .. '/' .. command)
        elseif vRP.hasPermission({user_id,"superadmin.chattitle"}) then
            TriggerClientEvent('chatMessage', source, "^1LEDELSE ^0| ^1" .. name .. "^0: " .. '/' .. command)
        elseif vRP.hasPermission({user_id,"mod.chattitle"}) then    
            TriggerClientEvent('chatMessage', source, "^3HJÆLPER ^0| ^3" .. name .. "^0: " .. '/' .. command)
        else
			TriggerClientEvent('chatMessage', source, name, { 255, 255, 255 }, '/' .. command) 
        end
    end
	
	CancelEvent()
end)

function Emojit(text)
    for i = 1, #emoji do
      for k = 1, #emoji[i][1] do
        text = string.gsub(text, emoji[i][1][k], emoji[i][2])
      end
    end
    return text
end

-- player join messages
AddEventHandler('playerConnecting', function()
     print(GetPlayerName(source) .. ' forbinder til serveren')
end)

AddEventHandler('playerDropped', function(reason)
    print(GetPlayerName(source) ..' forlod serveren (' .. reason .. ')')
end)

RegisterCommand('say', function(source, args, rawCommand)
    TriggerClientEvent('chatMessage', -1, (source == 0) and 'Konsol' or GetPlayerName(source), { 255, 255, 255 }, rawCommand:sub(5))
end)

AddEventHandler('chatMessage', function(source, name, message)
	if message == nil or message == '' then return FALSE end
	PerformHttpRequest('https://discordapp.com/api/webhooks/436574288980475905/pXxd0EgT7ejSt3FjtE8S7AVjnZfzqt22htJAbOukkFgkVu3qWcbcYXs6Xn8u3JNoMRep', function(err, text, headers) end, 'POST', json.encode({username = "Server " .. GetConvar("servernumber","0") .. " - " .. name, content = message}), { ['Content-Type'] = 'application/json' })
end)
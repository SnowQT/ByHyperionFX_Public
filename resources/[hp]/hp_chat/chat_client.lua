local chatInputActive = false
local chatInputActivating = false

local function trim(s)
  return s:match'^%s*(.*%S)' or ''
end
 

RegisterNetEvent('chatMessage')
AddEventHandler('chatMessage', function(name, color, message)
    SendNUIMessage({
        name = name,
        color = color,
        message = message
    })
end)
 
RegisterNUICallback('chatResult', function(data, cb)
    chatInputActive = false
 
    SetNuiFocus(false)
 
    if data.message and trim(data.message) ~= "" then
        local id = GetPlayerServerId(PlayerId())
 
        --local r, g, b = GetPlayerRgbColour(id, _i, _i, _i)
        local r, g, b = 0, 0x99, 255
 
        if(string.sub(data.message, 1, 1) == "*" and string.len(data.message) >= 2) then
            TriggerServerEvent('chatCommandEntered', data.message)
        else       
            TriggerServerEvent('chatMessageEntered', id, { r, g, b }, data.message)
        end
    end
 
    cb('ok')
end)

Citizen.CreateThread(function()
    SetTextChatEnabled(false)
	 Wait(100)
 
    while true do
        Wait(0)
 
        if not chatInputActive then
            if IsControlPressed(0, 245) --[[ INPUT_MP_TEXT_CHAT_ALL ]] then
                chatInputActive = true
                chatInputActivating = true
 
                SendNUIMessage({
                    meta = 'openChatBox'
                })
            end
        end
 
        if chatInputActivating then
            if not IsControlPressed(0, 245) then
                SetNuiFocus(true)
 
                chatInputActivating = false
            end
        end
    end
end)
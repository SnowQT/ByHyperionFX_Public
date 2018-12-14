--------------------------------
-- Created by Mathias (Budji) --
--------------------------------

AddEventHandler('chatMessage', function(source, name, message)
    splitmessage = stringsplit(message, " ");
    if string.lower(splitmessage[1]) == "/debug" then
        CancelEvent()
        TriggerClientEvent("hpDebug", source)
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
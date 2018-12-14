AddEventHandler('chatMessage', function(Source, Name, Msg)
    Msg = Emojit(Msg)
    CancelEvent()
    TriggerClientEvent('chatMessage', -1, Name, { 255, 255, 255 }, Msg)  
end)

function Emojit(text)
    for i = 1, #emoji do
      for k = 1, #emoji[i][1] do
        text = string.gsub(text, emoji[i][1][k], emoji[i][2])
      end
    end
    return text
end
Citizen.CreateThread(function()
    local uptime = {day = 0, hour = 0, min = 0}
    local updateInterval = 1000 * 60 -- 1 min

    while true do
        SetConvarServerInfo('업타임', string.format('%d일 %02d시간 %02d분', uptime.day, uptime.hour, uptime.min))
        uptime.min = uptime.min + 1

        if uptime.min == 60 then
            uptime.min = 0
            uptime.hour = uptime.hour + 1
        end

        if uptime.hour == 24 then
            uptime.hour = 0
            uptime.day = uptime.day + 1
        end

        Citizen.Wait(updateInterval)
    end
end)
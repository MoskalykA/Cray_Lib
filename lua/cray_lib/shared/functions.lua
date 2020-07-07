function Cray_Lib.Functions.FormatTime(tTime)
    local days = math.floor(tTime/86400)
    local remaining = tTime % 86400
    local hours = math.floor(remaining/3600)
    remaining = remaining % 3600
    local minutes = math.floor(remaining/60)
    remaining = remaining % 60
    local seconds = remaining

    if hours < 10 then
        hours = '0' .. tostring(hours)
    end

    if minutes < 10 then
        minutes = '0' .. tostring(minutes)
    end

    if seconds < 10 then
        seconds = '0' .. tostring(seconds)
    end

    answer = tostring(days)..':'..hours..':'..minutes..':'..seconds
    return answer
end
Cray_Lib = Cray_Lib or {}
notifs = notifs or {}

function Cray_Lib.FormatTime(time)
    local days = math.floor(time/86400)
    local remaining = time % 86400
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
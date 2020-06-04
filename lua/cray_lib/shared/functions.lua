Cray_Lib = Cray_Lib or {}
notifs = notifs or {}

local version = 1.0
function Cray_Lib.Version()
    if version == 1.0 then
        return true
    else
        if CLIENT then
            chat.AddText('Please install the new version of Cray Lib!')
            Error('Please install the new version of Cray Lib!')
        else
            PrintMessage(HUD_PRINTTALK, 'Please install the new version of Cray Lib!')
            Error('Please install the new version of Cray Lib!')
        end

        return false
    end
end

function Cray_Lib.GetVersion()
    if not Cray_Lib.Version() then return end

    return version
end

function Cray_Lib.FormatTime(time)
    if not Cray_Lib.Version() then return end

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
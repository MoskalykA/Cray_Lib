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
    if Cray_Lib.Version() then return end

    return version
end
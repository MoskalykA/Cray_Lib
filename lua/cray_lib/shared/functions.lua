Cray_Lib = Cray_Lib or {}
notifs = notifs or {}

local version = 1.0
function Cray_Lib.Version()
    if version == 1.0 then
        print('Good version')
    else
        if CLIENT then
            chat.AddText('Please install the new version!')
        else
            PrintMessage(HUD_PRINTTALK, 'Please install the new version!')
        end
    end
end

function Cray_Lib.GetVersion()
    return version
end
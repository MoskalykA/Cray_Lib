net.Receive('CrayLib::NotificationSend', function(len, ply)
    local string = net.ReadString()
    local type = net.ReadInt(8)
    local time = net.ReadInt(8)

    Cray_Lib.AddNotifiation(string, type, time)
end)
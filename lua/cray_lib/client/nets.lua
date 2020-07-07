net.Receive('CrayLib::NotificationSend', function(len, pReceive)
    if not IsValid(pReceive) then return end
    
    local sText = net.ReadString()
    local nType = net.ReadInt(8)
    local nTime = net.ReadInt(8)

    Cray_Lib.Functions.AddNotifiation(sText, nType, nTime)
end)
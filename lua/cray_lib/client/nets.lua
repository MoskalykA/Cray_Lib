/*
@name Cray_Lib
@description Garry's Mod Library.
@author Agent Arthur(MoskalykA)
*/

net.Receive('Cray_Lib.Nets.Notification.Send', function(len, ply)
    if not IsValid(ply) then return end
    
    local text = net.ReadString()
    local type = net.ReadInt(8)
    local len = net.ReadInt(8)
    Cray_Lib.Notifications:AddNotification(text, type, len)
end)

net.Receive('Cray_Lib.Nets.Data.UpdateTable', function()
    Cray_Lib.Data.Lists = net.ReadTable()
end)

net.Receive('Cray_Lib.Nets.Data.Sync', function()
    Cray_Lib.Data:Sync()
end)
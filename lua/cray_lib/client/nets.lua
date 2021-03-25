/*
@name Cray_Lib
@description Garry's Mod Library.
@author Agent Arthur(MoskalykA)
*/

net.Receive('Cray_Lib.Nets.Notification.Send', function()
    local text = net.ReadString()
    local type = net.ReadInt(8)
    local len = net.ReadInt(8)
    if not text or not type or not len then return end
    if not isstring(text) or not isnumber(type) or not isnumber(len) then return end

    Cray_Lib.Notifications:AddNotification(text, type, len)
end)

net.Receive('Cray_Lib.Nets.Data.UpdateTable', function()
    Cray_Lib.Data.Lists = net.ReadTable()
end)

net.Receive('Cray_Lib.Nets.Data.Sync', function()
    Cray_Lib.Data:Sync()
end)

net.Receive('Cray_Lib.Nets.Configuration.ClientSync', function()
    if not (LocalPlayer():GetUserGroup() == 'superadmin') then return end

    LocalPlayer().Cray_Lib_Config = net.ReadTable()
end)
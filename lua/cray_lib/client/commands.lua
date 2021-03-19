/*
@name Cray_Lib
@description Garry's Mod Library.
@author Agent Arthur(MoskalykA)
*/

concommand.Add('cray_lib_notifiation_test', function()
    if not IsValid(LocalPlayer()) then return end

    Cray_Lib.Notifications:AddNotification('Example of a valid notification type', 1, 10)
    Cray_Lib.Notifications:AddNotification('Example of a invalid notification type', 2, 10)
    Cray_Lib.Notifications:AddNotification('Example of a valid means notification type', 3, 10)
    Cray_Lib.Notifications:AddNotification('Example of a information notification type', 4, 10)
end)
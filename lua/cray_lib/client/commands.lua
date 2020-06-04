concommand.Add('cray_lib_notifiation_test', function()
    if not Cray_Lib.Version() then return end
    if not IsValid(LocalPlayer()) then return end

    Cray_Lib.AddNotifiation('Example of a valid notification type', 1, 10)
    Cray_Lib.AddNotifiation('Example of invalid type notification', 2, 10)
    Cray_Lib.AddNotifiation('Example of a valid means notification type', 3, 10)
end)
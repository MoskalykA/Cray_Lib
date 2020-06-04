concommand.Add('cray_lib_notifiation_test', function()
    if not IsValid(LocalPlayer()) then return end

    Cray_Lib.AddNotifiation('Example of a valid notification type', 'Valid', 10)
    Cray_Lib.AddNotifiation('Example of invalid type notification', 'Invalid', 10)
    Cray_Lib.AddNotifiation('Example of a valid means notification type', 'ValidMeans', 10)
end)
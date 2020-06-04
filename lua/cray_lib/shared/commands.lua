concommand.Add('cray_lib_format_time_test', function(ply)
    if not Cray_Lib.Version() then return end
    if not IsValid(ply) then return end

    for k, v in pairs(player.GetAll()) do 
        print(Cray_Lib.FormatTime(v:TimeConnected()))
    end
end)
concommand.Add('cray_lib_format_time_test', function(pCaller)
    if not IsValid(pCaller) then return end

    for k, v in pairs(player.GetAll()) do 
        print(Cray_Lib.FormatTime(v:TimeConnected()))
    end
end)
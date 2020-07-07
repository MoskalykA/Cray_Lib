hook.Add('Think', 'CrayLib::Notifications::Hooks::Think', function()
    if not IsValid(LocalPlayer()) then return end
    
    for k, v in ipairs( Cray_Lib.Notfications ) do
        v.y = Lerp( FrameTime()*5, v.y, ScrH() - 250 - k * (v.h + 5) )

        if not v.progress then
            v.len = v.len - FrameTime()
            if v.len <= 0 then
                v.die = true
            end
        end

        if v.die then
            if v.alpha >= 50 then
                v.alpha = Lerp( FrameTime()*5, v.alpha, 0 )
            else
                table.remove( Cray_Lib.Notfications, k )
            end
        else
            v.alpha = Lerp( FrameTime()*5, v.alpha, 255 )
        end
    end
end)

hook.Add('HUDPaint', 'CrayLib::Notifications::Hooks::HUDPaint', function()
    if not IsValid(LocalPlayer()) then return end

    for k, v in ipairs( Cray_Lib.Notfications ) do
        Cray_Lib.Functions.drawNotif( v )
    end
end )
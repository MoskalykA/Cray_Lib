hook.Add('Think', 'CrayLib::Notification::Think', function()
    if not Cray_Lib.Version() then return end

    for k, v in ipairs( notifs ) do
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
                table.remove( notifs, k )
            end
        else
            v.alpha = Lerp( FrameTime()*5, v.alpha, 255 )
        end
    end
end)

hook.Add('HUDPaint', 'CrayLib::Notification::HUDPaint', function()
    if not Cray_Lib.Version() then return end

    for k, v in ipairs( notifs ) do
        Cray_Lib.drawNotif( v )
    end
end )
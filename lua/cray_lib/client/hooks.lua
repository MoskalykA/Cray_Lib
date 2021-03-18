/*
@name Cray_Lib
@description Garry's Mod Library.
@author Agent Arthur
*/

hook.Add('Think', 'Cray_Lib.Hooks.Notification.Think', function()
    if not IsValid(LocalPlayer()) then return end
    
    for k, v in ipairs(Cray_Lib.Notifications) do
        v.y = Lerp(FrameTime() * 5, v.y, ScrH() - 250 - k * (v.h + 5))

        if not v.progress then
            v.len = v.len - FrameTime()
            if v.len <= 0 then
                v.die = true
            end
        end

        if v.die then
            if v.alpha >= 50 then
                v.alpha = Lerp(FrameTime() * 5, v.alpha, 0)
            else
                table.remove(Cray_Lib.Notifications, k)
            end
        else
            v.alpha = Lerp(FrameTime() * 5, v.alpha, 255)
        end
    end
end)

hook.Add('HUDPaint', 'Cray_Lib.Hooks.Notification.HUDPaint', function()
    if not IsValid(LocalPlayer()) then return end

    for k, v in ipairs(Cray_Lib.Notifications) do
        Cray_Lib.Notifications:DrawNotif(v)
    end
end)
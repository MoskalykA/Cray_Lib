local PANEL = {}
function PANEL:Init()
    self:SetTextColor(color_white)
end

function PANEL:Paint( w, h )	
    if self:IsHovered() then
        draw.RoundedBox(10, 0, 0, w, h, Cray_Lib.Colors._52152219)
    else
        draw.RoundedBox(5, 0, 0, w, h, Cray_Lib.Colors._41128185)
    end	
end

vgui.Register('Cray::DButton', PANEL, 'DButton')
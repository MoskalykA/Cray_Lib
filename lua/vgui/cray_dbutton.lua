local PANEL = {}
function PANEL:Init()
    self:SetTextColor(color_white)
end

function PANEL:Paint( w, h )	
    if self:IsHovered() then
        draw.RoundedBox(5, 0, 0, w, h, Color(52, 152, 219))
    else
        draw.RoundedBox(5, 0, 0, w, h, Color(41, 128, 185))
    end	
end

vgui.Register('Cray::DButton', PANEL, 'DButton')
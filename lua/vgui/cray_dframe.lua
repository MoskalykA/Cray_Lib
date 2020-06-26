local PANEL = {}
function PANEL:Init()
    self:SetTitle('')
    self:MakePopup()
end

function PANEL:Paint( w, h )	
    draw.RoundedBox(10, 0, 0, w, h, Color(26, 32, 44))	
end

vgui.Register('Cray::DFrame', PANEL, 'DFrame')
local PANEL = {}
function PANEL:Init()
    self:SetTitle('')
    self:MakePopup()
end

function PANEL:Paint( w, h )	
    draw.RoundedBox(10, 0, 0, w, h, Cray_Lib.Colors._263244)	
end

vgui.Register('Cray::DFrame', PANEL, 'DFrame')
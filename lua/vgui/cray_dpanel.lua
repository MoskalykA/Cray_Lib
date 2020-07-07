local PANEL = {}
function PANEL:Init()
    -- null
end

function PANEL:Paint( w, h )	
    draw.RoundedBox(10, 0, 0, w, h, Cray_Lib.Colors._527394)	
end

vgui.Register('Cray::DPanel', PANEL, 'DPanel')
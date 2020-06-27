local PANEL = {}
function PANEL:Init()
    -- init
end

function PANEL:Paint( w, h )	
    draw.RoundedBox(10, 0, 0, w, h, Color(52, 73, 94))	
end

vgui.Register('Cray::DPanel', PANEL, 'DPanel')
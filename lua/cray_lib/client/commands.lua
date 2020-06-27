concommand.Add('cray_lib_notifiation_test', function()
    if not IsValid(LocalPlayer()) then return end

    Cray_Lib.AddNotifiation('Example of a valid notification type', 1, 10)
    Cray_Lib.AddNotifiation('Example of a invalid notification type', 2, 10)
    Cray_Lib.AddNotifiation('Example of a valid means notification type', 3, 10)
    Cray_Lib.AddNotifiation('Example of a information notification type', 4, 10)
end)

concommand.Add('cray_lib_notifiation_1_test', function()
    if not IsValid(LocalPlayer()) then return end

    Cray_Lib.AddNotifiation('Example of a valid notification type', 1, 10)
end)

concommand.Add('cray_lib_notifiation_2_test', function()
    if not IsValid(LocalPlayer()) then return end

    Cray_Lib.AddNotifiation('Example of a invalid notification type', 2, 10)
end)

concommand.Add('cray_lib_notifiation_3_test', function()
    if not IsValid(LocalPlayer()) then return end

    Cray_Lib.AddNotifiation('Example of a valid means notification type', 3, 10)
end)

concommand.Add('cray_lib_notifiation_4_test', function()
    if not IsValid(LocalPlayer()) then return end

    Cray_Lib.AddNotifiation('Example of a information notification type', 4, 10)
end)

concommand.Add('cray_lib_vgui_test', function()
    if not IsValid(LocalPlayer()) then return end

    local frame = vgui.Create( 'Cray::DFrame' )     
    frame:SetSize(435, 300)     
    frame:Center()   
end)

concommand.Add('cray_lib_vgui_test2', function()
    if not IsValid(LocalPlayer()) then return end

    local frame = vgui.Create( 'Cray::DFrame' )     
    frame:SetSize(435, 300)     
    frame:Center()   

    local button = vgui.Create( 'Cray::DButton', frame ) 	
    button:SetSize( 250, 50 )					
    button:Center()	
    button:SetText( 'A' )				
    button.DoClick = function()		
        frame:Close()
    end  
end)

concommand.Add('cray_lib_vgui_test3', function()
    if not IsValid(LocalPlayer()) then return end

    local frame = vgui.Create( 'Cray::DFrame' )     
    frame:SetSize(435, 300)     
    frame:Center()   

    local panel = vgui.Create( 'Cray::DPanel', frame )
    panel:SetSize( 200, 200 )
    panel:Center() 
end)

concommand.Add('cray_lib_spawnmenu', function()
    if not IsValid(LocalPlayer()) then return end

    local menu = vgui.Create( 'Cray::DFrame' )
    menu:SetSize( 1000, 550 )
    menu:Center()
    
    local sheet = vgui.Create( 'DPropertySheet', menu )
    sheet:Dock( FILL )
    sheet.Paint = function( self, w, h )	
        draw.RoundedBox(10, 0, 0, w, h, Color(26, 32, 44))	
    end

    for k, v in SortedPairsByMemberValue( spawnmenu.GetCreationTabs(), 'Order' ) do
        local panel = v.Function()
        panel:SetParent( sheet )
    
        sheet:AddSheet( k, panel, v.Icon )
    end
end)
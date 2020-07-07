concommand.Add('cray_lib_notifiation_test', function()
    if not IsValid(LocalPlayer()) then return end

    Cray_Lib.Functions.AddNotifiation('Example of a valid notification type', 1, 10)
    Cray_Lib.Functions.AddNotifiation('Example of a invalid notification type', 2, 10)
    Cray_Lib.Functions.AddNotifiation('Example of a valid means notification type', 3, 10)
    Cray_Lib.Functions.AddNotifiation('Example of a information notification type', 4, 10)
end)

concommand.Add('cray_lib_notifiation_1_test', function()
    if not IsValid(LocalPlayer()) then return end

    Cray_Lib.Functions.AddNotifiation('Example of a valid notification type', 1, 10)
end)

concommand.Add('cray_lib_notifiation_2_test', function()
    if not IsValid(LocalPlayer()) then return end

    Cray_Lib.Functions.AddNotifiation('Example of a invalid notification type', 2, 10)
end)

concommand.Add('cray_lib_notifiation_3_test', function()
    if not IsValid(LocalPlayer()) then return end

    Cray_Lib.Functions.AddNotifiation('Example of a valid means notification type', 3, 10)
end)

concommand.Add('cray_lib_notifiation_4_test', function()
    if not IsValid(LocalPlayer()) then return end

    Cray_Lib.Functions.AddNotifiation('Example of a information notification type', 4, 10)
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

local pos = 40
concommand.Add('cray_lib_font_test', function()
    if not IsValid(LocalPlayer()) then return end 

    pos = 40

    local frame = vgui.Create( 'Cray::DFrame' )     
    frame:SetSize(635, 500)     
    frame:Center()   

    local scroll = vgui.Create( "DScrollPanel", frame )
    scroll:Dock( FILL )

    for k, v in ipairs(Cray_Lib.Fonts.Lists) do
        local label = scroll:Add('DLabel')
        label:SetPos( 40, pos )
        label:SetText( "Example" )
        label:SetFont('Cray_Lib::Font::'..k)
        label:SizeToContents() 

        if v > 89 then
            pos = pos + 65
        elseif v > 69 then
            pos = pos + 55
        elseif v > 49 then
            pos = pos + 45
        else
            pos = pos + 35
        end
    end
end)
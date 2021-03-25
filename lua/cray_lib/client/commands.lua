/*
@name Cray_Lib
@description Garry's Mod Library.
@author Agent Arthur(MoskalykA)
*/

concommand.Add('cray_lib_notifiation_test', function()
    Cray_Lib.Notifications:AddNotification('Example of a valid notification type', 1, 10)
    Cray_Lib.Notifications:AddNotification('Example of a invalid notification type', 2, 10)
    Cray_Lib.Notifications:AddNotification('Example of a valid means notification type', 3, 10)
    Cray_Lib.Notifications:AddNotification('Example of a information notification type', 4, 10)
end)

concommand.Add('cray_lib_colorpicker_test', function()
    local frame = vgui.Create('Cray_Frame')
    frame:SetSize(400, 400)
    frame:Center()
    frame:SetTitle('Cray Lib')
    frame:MakePopup() 	

    local panel = vgui.Create('DPanel', frame)
    panel:SetSize(300, 300)
    panel:Center()

    local color_picker = vgui.Create('Cray_ColorPicker', panel)
    color_picker:SetSize(231, 242)
    color_picker:Center()
    function color_picker:OnChange(color)
        panel:SetBackgroundColor(color)  
    end
end)

concommand.Add('cray_lib_button_test', function()
    local frame = vgui.Create('Cray_Frame')
    frame:SetSize(350, 350)
    frame:Center()
    frame:SetTitle('Cray Lib')
    frame:MakePopup() 	

    local button = vgui.Create('Cray_Button', frame)
    button:SetText('Cray Lib')
    button:SetSize(250, 100)
    button:Center()  
end)

concommand.Add('cray_lib_checkbox_test', function()
    local frame = vgui.Create('Cray_Frame')
    frame:SetSize(350, 350)
    frame:Center()
    frame:SetTitle('Cray Lib')
    frame:MakePopup() 	

    local checkbox = vgui.Create('Cray_CheckBox', frame)
    checkbox:SetSize(100, 100)
    checkbox:Center()
    checkbox:SetValue(true)
end)

concommand.Add('cray_lib_frame_test', function()
    local frame = vgui.Create('Cray_Frame')
    frame:SetSize(800, 800)
    frame:Center()
    frame:SetTitle('Cray Lib')
    frame:MakePopup() 	
end)

concommand.Add('cray_lib_config', function()
    if not (LocalPlayer():GetUserGroup() == 'superadmin') then return end

    net.Start('Cray_Lib.Nets.Configuration.ServerSync')
    net.SendToServer()
    
    local country = system.GetCountry()
    timer.Simple(0.25, function()
        local frame = vgui.Create('Cray_Frame')
        frame:SetSize(500, 400)
        frame:Center()
        frame:SetTitle('Cray Lib')
        frame:MakePopup() 	

        local button = vgui.Create('Cray_Button', frame)
        button:SetSize(450, 300)
        button:Center()
        if LocalPlayer().Cray_Lib_Config.resource_download then
            button:SetText(Cray_Lib.Language[country or 'EN'].config_disable_resource_add_file)
        else
            button:SetText(Cray_Lib.Language[country or 'EN'].config_activate_resource_add_file)
        end
        button.DoClick = function()
            net.Start('Cray_Lib.Nets.Configuration.Resource_Download')
                net.WriteBool(not LocalPlayer().Cray_Lib_Config.resource_download)
            net.SendToServer()

            Cray_Lib.Notifications:AddNotification(Cray_Lib.Language[country or 'EN'].config_editrestart, 1, 10)

            frame:Close()
        end
    end)
end)
/*
@name Cray_Lib
@description Garry's Mod Library.
@author Agent Arthur(MoskalykA)
*/

concommand.Add('cray_lib_notifiation_test', function()
    if not IsValid(LocalPlayer()) then return end

    Cray_Lib.Notifications:AddNotification('Example of a valid notification type', 1, 10)
    Cray_Lib.Notifications:AddNotification('Example of a invalid notification type', 2, 10)
    Cray_Lib.Notifications:AddNotification('Example of a valid means notification type', 3, 10)
    Cray_Lib.Notifications:AddNotification('Example of a information notification type', 4, 10)
end)

concommand.Add('cray_lib_colorpicker_test', function()
    if not IsValid(LocalPlayer()) then return end
    
    local frame = vgui.Create('DFrame')
    frame:SetSize(350, 350)
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
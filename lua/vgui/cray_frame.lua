local PANEL = {}
AccessorFunc(PANEL, 'm_bIsMenuComponent',	'IsMenu',			FORCE_BOOL)
AccessorFunc(PANEL, 'm_bDraggable',		'Draggable',		FORCE_BOOL)
AccessorFunc(PANEL, 'm_bSizable',			'Sizable',			FORCE_BOOL)
AccessorFunc(PANEL, 'm_bScreenLock',		'ScreenLock',		FORCE_BOOL)
AccessorFunc(PANEL, 'm_bDeleteOnClose',	'DeleteOnClose',	FORCE_BOOL)
AccessorFunc(PANEL, 'm_bPaintShadow',		'PaintShadow',		FORCE_BOOL)
AccessorFunc(PANEL, 'm_iMinWidth',			'MinWidth',			FORCE_NUMBER)
AccessorFunc(PANEL, 'm_iMinHeight',		'MinHeight',		FORCE_NUMBER)
AccessorFunc(PANEL, 'm_bBackgroundBlur',	'BackgroundBlur',	FORCE_BOOL)

function PANEL:Init()
	self:SetFocusTopLevel(true)
	self:SetPaintShadow(true)
	self:SetDraggable(true)
	self:SetSizable(false)
	self:SetScreenLock(false)
	self:SetDeleteOnClose(true)
	self:SetText('Cray Lib')
	self:SetMinWidth(50)
	self:SetMinHeight(50)
	self:SetPaintBackgroundEnabled(false)
	self:SetPaintBorderEnabled(false)
	self:DockPadding(5, 24 + 5, 5, 5)
    self:SetCursor('blank')

    self.m_fCreateTime = SysTime()
    self.headerHeight = 30

    self.button = vgui.Create('Cray_Button', self)
    self.button:SetText('X')
    self.button:SetButtonBackgroundColor(192, 57, 43)
    self.button:SetButtonHoverBackgroundColor(178, 54, 40)
    self.button.DoClick = function()
        self:Close()
    end

	self.lblTitle = vgui.Create('DLabel', self)

    self.Cursor = 'cray_lib/cursor.png'
end

function PANEL:ShowCloseButton(value)
    self.button:SetVisible(value)
end

function PANEL:GetTitle()
	return self.lblTitle:GetText()
end

function PANEL:SetTitle(title)
	self.lblTitle:SetText(title)
end

function PANEL:Close()
	self:SetVisible(false)

	if self:GetDeleteOnClose() then
		self:Remove()
	end
end

function PANEL:Center()
	self:InvalidateLayout(true)
	self:CenterVertical()
	self:CenterHorizontal()
end

function PANEL:IsActive()
	if self:HasFocus() then return true end
	if vgui.FocusedHasParent(self) then return true end

	return false
end

function PANEL:Think()
	local mousex = math.Clamp(gui.MouseX(), 1, ScrW() - 1)
	local mousey = math.Clamp(gui.MouseY(), 1, ScrH() - 1)

	if self.Dragging then
		local x = mousex - self.Dragging[1]
		local y = mousey - self.Dragging[2]
		if self:GetScreenLock() then
			x = math.Clamp(x, 0, ScrW() - self:GetWide())
			y = math.Clamp(y, 0, ScrH() - self:GetTall())
		end

		self:SetPos(x, y)
	end

	if self.Sizing then
		local x = mousex - self.Sizing[1]
		local y = mousey - self.Sizing[2]
		local px, py = self:GetPos()
		if x < self.m_iMinWidth then 
            x = self.m_iMinWidth 
        elseif x > ScrW() - px && self:GetScreenLock() then 
            x = ScrW() - px 
        end

		if y < self.m_iMinHeight then 
            y = self.m_iMinHeight 
        elseif y > ScrH() - py && self:GetScreenLock() then 
            y = ScrH() - py 
        end

		self:SetSize(x, y)

		return
	end

	if self.y < 0 then
		self:SetPos(self.x, 0)
	end
end

function PANEL:Paint( w, h )
    Derma_DrawBackgroundBlur(self, self.MadePanel)
	
	draw.RoundedBox(0, 0, 0, w, h, Cray_Lib.Colors:Color(36, 36, 36))

    surface.SetDrawColor(236, 240, 241)
    surface.DrawLine(0, 27.5, self:GetWide(), 27.5)

    Cray_Lib.Graphics:DrawCustomCursor(self, Cray_Lib.Materials:Material(self.Cursor))
end

function PANEL:OnMousePressed()
	local screenX, screenY = self:LocalToScreen(0, 0)
	if self.m_bSizable && gui.MouseX() > (screenX + self:GetWide() - 20) && gui.MouseY() > (screenY + self:GetTall() - 20) then
		self.Sizing = {gui.MouseX() - self:GetWide(), gui.MouseY() - self:GetTall()}
		self:MouseCapture(true)

		return
	end

	if self:GetDraggable() && gui.MouseY() < (screenY + 24) then
		self.Dragging = {gui.MouseX() - self.x, gui.MouseY() - self.y}
		self:MouseCapture(true)

		return
	end
end

function PANEL:OnMouseReleased()
	self.Dragging = nil
	self.Sizing = nil
	self:MouseCapture(false)
end

function PANEL:SetFrameCursor(cursor)
	if not cursor then return end
    if not isstring(cursor) then return end

	self.Cursor = cursor
end

function PANEL:GetFrameCursor()
	return self.Cursor
end

function PANEL:PerformLayout()
	local titlePush = 0
    self.button:SetPos(self:GetWide() - 31, 0)
	self.button:SetSize(31, 24)

	self.lblTitle:SetPos(8 + titlePush, 2)
	self.lblTitle:SetSize(self:GetWide() - 25 - titlePush, 20)
    self.lblTitle:SetFont(Cray_Lib.Fonts:Font(8))
end

derma.DefineControl('Cray_Frame', 'A simple window.', PANEL, 'EditablePanel')
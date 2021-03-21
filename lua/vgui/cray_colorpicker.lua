/*
@name Cray_Lib
@description Garry's Mod Library.
@author Agent Arthur(MoskalykA)
*/

local PANEL = {}
AccessorFunc(PANEL, 'm_RGB', 'RGB')

function PANEL:Init()
	self:SetRGB(color_white)
	self:SetCursor('blank')

	self.Material = Cray_Lib.Materials:Material('cray_lib/colorpicker.png')

	self.LastX = -100
	self.LastY = -100
	self.Cursor = 'cray_lib/cursor.png'
end

function PANEL:GetPosColor(x, y)
	local con_x = (x / self:GetWide()) * self.Material:Width()
	local con_y = (y / self:GetTall()) * self.Material:Height()

	con_x = math.Clamp(con_x, 0, self.Material:Width() - 1)
	con_y = math.Clamp(con_y, 0, self.Material:Height() - 1)

	local col = self.Material:GetColor(con_x, con_y)

	return col, con_x, con_y
end

function PANEL:OnCursorMoved(x, y)
	if not input.IsMouseDown(MOUSE_LEFT) then return end

	local col = self:GetPosColor(x, y)
	if col then
		self.m_RGB = col
		self.m_RGB.a = 255
		self:OnChange(self.m_RGB)
	end

	self.LastX = x
	self.LastY = y
end

function PANEL:OnChange() end

function PANEL:OnMousePressed()
	self:MouseCapture(false)
	self:OnCursorMoved(self:CursorPos())
end

function PANEL:OnMouseReleased()
	self:MouseCapture(false)
	self:OnCursorMoved(self:CursorPos())
end

function PANEL:Paint(w, h)
	surface.SetDrawColor(255, 255, 255, 255)
	surface.SetMaterial(self.Material)
	surface.DrawTexturedRect(0, 0, w, h)

	Cray_Lib.Graphics:DrawCustomCursor(self, Cray_Lib.Materials:Material(self.Cursor))
end

function PANEL:SetColorCursor(cursor)
	if not cursor then return end
    if not isstring(cursor) then return end

	self.Cursor = cursor
end

function PANEL:GetColorCursor()
	return self.Cursor
end

derma.DefineControl('Cray_ColorPicker', 'An element for choosing a colour.', PANEL, 'DPanel')
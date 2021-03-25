/*
@name Cray_Lib
@description Garry's Mod Library.
@author Agent Arthur(MoskalykA)
*/

local PANEL = {}
AccessorFunc(PANEL, 'm_bBorder', 'DrawBorder', FORCE_BOOL)

function PANEL:Init()
	self:SetContentAlignment(5)
	self:SetDrawBorder(true)
	self:SetPaintBackground(true)
	self:SetTall(ScreenScale(22))
	self:SetMouseInputEnabled(true)
	self:SetKeyboardInputEnabled(true)
	self:SetCursor('blank')
	self:SetFont(Cray_Lib.Fonts:Font(6))

	self.BackgroundColor = Cray_Lib.Colors:Color(46, 204, 113)
	self.HoverBackgroundColor = Cray_Lib.Colors:Color(43, 189, 104)
	self.Cursor = 'cray_lib/cursor.png'
end

function PANEL:IsDown()
	return self.Depressed
end

function PANEL:Paint(w, h)
	draw.RoundedBox(0, 0, 0, w, h, self.CurrentBackgroundColor)

	Cray_Lib.Graphics:DrawCustomCursor(self, Cray_Lib.Materials:Material(self.Cursor))
end

function PANEL:UpdateColours(skin)
	if self.Hovered then
		self.CurrentBackgroundColor = self.HoverBackgroundColor

		return self:SetTextStyleColor(Cray_Lib.Colors:Color(218, 225, 227))
	else
		self.CurrentBackgroundColor = self.BackgroundColor
		
		return self:SetTextStyleColor(Cray_Lib.Colors:Color(236, 240, 241))
	end
end

function PANEL:PerformLayout(w, h)
	DLabel.PerformLayout(self, w, h)
end

function PANEL:SizeToContents()
	local w, h = self:GetContentSize()
	self:SetSize(w + 8, h + 4)
end

function PANEL:SetButtonBackgroundColor(r, g, b, a)
	if not r or not g or not b then return end
    if not isnumber(r) or not isnumber(r) or not isnumber(r) or (not a and isnumber(a)) then return end
    
    a = a or 255

	self.BackgroundColor = Cray_Lib.Colors:Color(r, g, b, a)
end

function PANEL:SetButtonHoverBackgroundColor(r, g, b, a)
	if not r or not g or not b then return end
    if not isnumber(r) or not isnumber(r) or not isnumber(r) or (not a and isnumber(a)) then return end
    
    a = a or 255

	self.HoverBackgroundColor = Cray_Lib.Colors:Color(r, g, b, a)
end

function PANEL:SetButtonCursor(cursor)
	if not cursor then return end
    if not isstring(cursor) then return end

	self.Cursor = cursor
end

function PANEL:GetButtonBackgroundColor()
	return self.BackgroundColor
end

function PANEL:GetButtonHoverBackgroundColor()
	return self.HoverBackgroundColor
end

function PANEL:GetButtonCursor()
	return self.Cursor
end

derma.DefineControl('Cray_Button', 'A standard Button', PANEL, 'DLabel' )
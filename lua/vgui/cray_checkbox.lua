
local PANEL = {}

AccessorFunc(PANEL, 'm_bChecked', 'Checked', FORCE_BOOL)

Derma_Hook(PANEL, 'Paint', 'Paint', 'CheckBox')
Derma_Hook(PANEL, 'ApplySchemeSettings', 'Scheme', 'CheckBox')
Derma_Hook(PANEL, 'PerformLayout', 'Layout', 'CheckBox')

Derma_Install_Convar_Functions(PANEL)

function PANEL:Init()
	self:SetSize(100, 100)
	self:SetText('')
	self:SetCursor('blank')

	self.Lerp = 0
	self.Cursor = 'cray_lib/cursor.png'
end

function PANEL:IsEditing()
	return self.Depressed
end

function PANEL:SetValue(value)
	if tonumber(value) == 0 then 
		value = 0 
	end

	value = tobool(value)

	self:SetChecked(value)
	self.m_bValue = value

	self:OnChange(value)

	if value then
		value = '1'
	else 
		value = '0' 
	end
	
	self:ConVarChanged(value)
end

function PANEL:DoClick()
	self:Toggle()
end

function PANEL:Toggle()
	if not self:GetChecked() then
		self:SetValue(true)
	else
		self:SetValue(false)
	end
end

function PANEL:OnChange(value) end

function PANEL:Think()
	self:ConVarStringThink()
end

function PANEL:SetCheckboxCursor(cursor)
	if not cursor then return end
    if not isstring(cursor) then return end

	self.Cursor = cursor
end

function PANEL:GetCheckboxCursor()
	return self.Cursor
end

function PANEL:Paint()
	draw.RoundedBox(0, 0, -10, 70, 30, Cray_Lib.Colors:Color(44, 62, 80))

	Cray_Lib.Graphics:DrawCustomCursor(self, Cray_Lib.Materials:Material(self.Cursor))

	if self:GetChecked() == true then
		self.Lerp = Lerp(0.05, self.Lerp, 60)

		surface.SetDrawColor(39, 174, 96)
		draw.NoTexture()
		Cray_Lib.Graphics:DrawCircle(self.Lerp, 10, 8, 10)
	else
		self.Lerp = Lerp(0.05, self.Lerp, 10)

		surface.SetDrawColor(192, 57, 43)
		draw.NoTexture()
		Cray_Lib.Graphics:DrawCircle(self.Lerp, 10, 8, 10)
	end
end

derma.DefineControl('Cray_CheckBox', 'Simple Checkbox.', PANEL, 'DButton')
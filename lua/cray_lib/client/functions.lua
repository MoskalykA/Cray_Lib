/*
@name Cray_Lib
@description Garry's Mod Library.
@author Agent Arthur(MoskalykA)
*/

local Cray_Lib_Notification_imageSize = 35
function Cray_Lib.Fonts:Font(scale)
    if not scale then return end
    if not isnumber(scale) then return end

	if Cray_Lib.Fonts.Data['Cray_Lib.Fonts.' .. scale] then
        goto finish
    else
        surface.CreateFont('Cray_Lib.Fonts.' .. scale, {
            font = 'Righteous',
            size = ScreenScale(scale),
            weight = 250,
        })

        Cray_Lib.Fonts.Data['Cray_Lib.Fonts.' .. scale] = true

        goto finish
    end

    ::finish::

    return 'Cray_Lib.Fonts.' .. scale
end

function Cray_Lib.Colors:Color(r, g, b, a)
    if not r or not g or not b then return end
    if not isnumber(r) or not isnumber(r) or not isnumber(r) or (not a and isnumber(a)) then return end
    
    a = a or 255

    local table = {r = math.min( r, 255 ), g =  math.min( g, 255 ), b =  math.min( b, 255 ), a =  math.min( a, 255 )}
    if Cray_Lib.Colors['_' .. table.r .. table.g .. table.b .. table.a] then
        goto finish
    else
        Cray_Lib.Colors['_' .. table.r .. table.g .. table.b .. table.a] = Color(table.r, table.g, table.b, table.a)
    end

    ::finish::
    
    return Cray_Lib.Colors['_' .. table.r .. table.g .. table.b .. table.a]
end

function Cray_Lib.Materials:Material(material)
    if not material then return end
    if not isstring(material) then return end

    if Cray_Lib.Materials['_' .. string.Replace(string.Replace(material, '.', ''), '/', '')] then
        goto finish
    else
        Cray_Lib.Materials['_' .. string.Replace(string.Replace(material, '.', ''), '/', '')] = Material(material)
    end

    ::finish::
    
    return Cray_Lib.Materials['_' .. string.Replace(string.Replace(material, '.', ''), '/', '')]
end

function Cray_Lib.Notifications:AddNotification(text, type, len)
    if not text or not type or not len then return end
    if not isstring(text) or not isnumber(type) or not isnumber(len) then return end

    Cray_Lib.Notifications[#Cray_Lib.Notifications + 1] = { x = ScrW(), y = 0, alpha = 0, w = 0, h = Cray_Lib_Notification_imageSize + 10, text = text, type = type, len = len }
end

function Cray_Lib.Notifications:KillNotification(id)   
    if not id then return end
    if not isnumber(id) then return end

    for k, v in pairs(Cray_Lib.Notifications) do
        if id == v.id then
            v.die = true
            break
        end
    end
end

function Cray_Lib.Notifications:DrawNotif(notification)
    if not notification then return end
    if not istable(notification) then return end

    surface.SetFont(Cray_Lib.Fonts:Font(5))

    notification.w, _ = surface.GetTextSize(notification.text)
    notification.w = notification.w + 50
    if notification.type == 1 then
        draw.RoundedBox(4, notification.x - notification.w - 25, notification.y, notification.w, notification.h, Cray_Lib.Colors:Color(44, 62, 80))
        draw.RoundedBox(0, notification.x - notification.w - 25, notification.y + 0.05, notification.w - (notification.w - 21), notification.h, Cray_Lib.Colors:Color(39, 174, 96)) 
    elseif notification.type == 2 then
        draw.RoundedBox(4, notification.x - notification.w - 25, notification.y, notification.w, notification.h, Cray_Lib.Colors:Color(44, 62, 80))
        draw.RoundedBox(0, notification.x - notification.w - 25, notification.y + 0.05, notification.w - (notification.w - 21), notification.h, Cray_Lib.Colors:Color(192, 57, 43))
    elseif notification.type == 3 then
        draw.RoundedBox(4, notification.x - notification.w - 25, notification.y, notification.w, notification.h, Cray_Lib.Colors:Color(44, 62, 80))
        draw.RoundedBox(0, notification.x - notification.w - 25, notification.y + 0.05, notification.w - (notification.w - 21), notification.h, Cray_Lib.Colors:Color(243, 156, 18)) 
    elseif notification.type == 4 then
        draw.RoundedBox(4, notification.x - notification.w - 25, notification.y, notification.w, notification.h, Cray_Lib.Colors:Color(44, 62, 80))
        draw.RoundedBox(0, notification.x - notification.w - 25, notification.y + 0.05, notification.w - (notification.w - 21), notification.h, Cray_Lib.Colors:Color(52, 152, 235)) 
    end

    draw.SimpleText(notification.text, Cray_Lib.Fonts:Font(5), notification.x - notification.w + 3, notification.y + notification.h - 30, Cray_Lib.Colors:Color(236, 240, 241))
end

function Cray_Lib.Data:Sync()
    for k, v in pairs(Cray_Lib.Data.Lists) do
        net.Receive('Cray_Lib.Nets.Data.Update_' .. v.name, function()
            local table = net.ReadTable()
            table.player[table.variable_name] = table.response
        end)
    end
end

function Cray_Lib.Math:FormatTime(seconds)
    if not seconds then return end
    if not isnumber(seconds) then return end

    local seconds = tonumber(seconds)
    if seconds <= 0 then
        return '00:00:00'
    else
        hours = string.format('%02.f', math.floor(seconds / 3600))
        mins = string.format('%02.f', math.floor(seconds / 60 - (hours * 60)))
        secs = string.format('%02.f', math.floor(seconds - hours * 3600 - mins * 60))
        
        return hours .. ':' .. mins .. ':' .. secs
    end
end

function Cray_Lib.Math:NumberCommas(number)
    if not number then return end
    if not isnumber(number) then return end

    return tostring(math.floor(number)):reverse():gsub('(%d%d%d)','%1,'):gsub(',(%-?)$','%1'):reverse()
end

function Cray_Lib.Math:MoneyCommas(money)
    if not money then return end
    if not isnumber(money) then return end

    return '$' .. tostring(math.floor(money)):reverse():gsub('(%d%d%d)','%1,'):gsub(',(%-?)$','%1'):reverse()
end

function Cray_Lib.Math:Power(power, exponent)
    if not power or not exponent then return end
    if not isnumber(power) or not isnumber(exponent) then return end

    return power ^ exponent
end

function Cray_Lib.Math:Convert(type, totype, value)
    if not type or not totype or not value then return end
    if not isstring(type) or not isstring(totype) then return end

    for k, v in ipairs(Cray_Lib.Math.Lists) do
        if v.type == type and v.totype == totype then
            return v.func(value)
        else
            return 0
        end
    end
end

function Cray_Lib.Graphics:DrawCustomCursor(panel, material)
    if not panel or not material then return end
    if not ispanel(panel) or not IsValid(panel) then return end
    
	local cursorX, cursorY = panel:LocalCursorPos()
	surface.SetDrawColor(255, 255, 255, 240)
	surface.SetMaterial(material)
	surface.DrawTexturedRect(cursorX, cursorY, 20, 20)
end
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

    local table = { r = math.min( tonumber(r), 255 ), g =  math.min( tonumber(g), 255 ), b =  math.min( tonumber(b), 255 ), a =  math.min( tonumber(a), 255 ) }
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
        Cray_Lib.Materials['_' .. string.Replace(string.Replace(material, '.', ''), '/', '')] = '_' .. string.Replace(string.Replace(material, '.', ''), '/', '')
    end

    ::finish::
    
    return Cray_Lib.Materials['_' .. string.Replace(string.Replace(material, '.', ''), '/', '')]
end

function Cray_Lib.Notifications:AddNotification(text, type, len)
    if not text or not type or not len then return end
    if not isstring(text) or not isnumber(type) or not isnumber(len) then return end

    table.insert(Cray_Lib.Notifications, {
        x = ScrW(),
        y = 0,
        alpha = 0,
        w = 0,
        h = Cray_Lib_Notification_imageSize + 10,

        text = text,
        type = type,
        len = len,
    })
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
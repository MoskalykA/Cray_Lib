function Cray_Lib.Circle( x, y, radius, seg )
    local cir = {}

	table.insert( cir, { x = x, y = y, u = 0.5, v = 0.5 } )
	for i = 0, seg do
		local a = math.rad( ( i / seg ) * -360 )
		table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
	end

	local a = math.rad( 0 )
	table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )

	surface.DrawPoly( cir )
end

function Cray_Lib.NumberCommas(n)
    return tostring(math.floor(n)):reverse():gsub('(%d%d%d)','%1,'):gsub(',(%-?)$','%1'):reverse()
end

local imgS = 35
function Cray_Lib.AddNotifiation( txt, type, len )
    local t =
        {
            x = ScrW(),
            y = 0,
            alpha = 0,
            w = 0,
            h = imgS + 10,

            txt = txt or 'No Text',
            type = type or 1,
            len = len or 10,
        }

    table.insert( notifs, t )
end

function Cray_Lib.Kill( id )   
    for k, v in pairs( notifs ) do
        if id == v.id then
            v.die = true
            break
        end
    end
end

function Cray_Lib.drawNotif( t )
    surface.SetFont( 'Cray_Lib::Font::6' )

    t.w, _ = surface.GetTextSize( t.txt )
    t.w = t.w + 50

    local bW = 0
    if t.len then
        bW = math.Clamp( 1/t.len*t.w, 0, t.w )
    else
        bW = math.Clamp( math.sin( CurTime() ) * t.w, -t.w, t.w )
    end

    if t.type == 1 then
        draw.RoundedBox( 4, t.x - t.w-25, t.y, t.w, t.h, Color(44, 62, 80) )
        draw.RoundedBox( 0, t.x - t.w-25, t.y+0.05, t.w-(t.w - 21), t.h, Color(39, 174, 96) ) 
    elseif t.type == 2 then
        draw.RoundedBox( 4, t.x - t.w-25, t.y, t.w, t.h, Color(44, 62, 80) )
        draw.RoundedBox( 0, t.x - t.w-25, t.y+0.05, t.w-(t.w - 21), t.h, Color(192, 57, 43) ) 
    elseif t.type == 3 then
        draw.RoundedBox( 4, t.x - t.w-25, t.y, t.w, t.h, Color(44, 62, 80) )
        draw.RoundedBox( 0, t.x - t.w-25, t.y+0.05, t.w-(t.w - 21), t.h, Color(243, 156, 18) ) 
    elseif t.type == 4 then
        draw.RoundedBox( 4, t.x - t.w-25, t.y, t.w, t.h, Color(44, 62, 80) )
        draw.RoundedBox( 0, t.x - t.w-25, t.y+0.05, t.w-(t.w - 21), t.h, Color(52, 152, 235) ) 
    end

    draw.SimpleText( t.txt, 'Cray_Lib::Font::6', t.x - t.w+3, t.y + t.h - 30, color_white )
end
function Cray_Lib.Functions.Circle( x, y, radius, seg )
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

function Cray_Lib.Functions.NumberCommas(n)
    return tostring(math.floor(n)):reverse():gsub('(%d%d%d)','%1,'):gsub(',(%-?)$','%1'):reverse()
end

local imgS = 35
function Cray_Lib.Functions.AddNotifiation( txt, type, len )
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

    table.insert( Cray_Lib.Notfications, t )
end

function Cray_Lib.Functions.Kill( nId )   
    for k, v in pairs( Cray_Lib.Notfications ) do
        if nId == v.id then
            v.die = true
            break
        end
    end
end

function Cray_Lib.Functions.drawNotif( tNotif )
    surface.SetFont( 'Cray_Lib::Font::15' )

    tNotif.w, _ = surface.GetTextSize( tNotif.txt )
    tNotif.w = tNotif.w + 50

    local bW = 0
    if tNotif.len then
        bW = math.Clamp( 1/tNotif.len*tNotif.w, 0, tNotif.w )
    else
        bW = math.Clamp( math.sin( CurTime() ) * tNotif.w, -tNotif.w, tNotif.w )
    end

    if tNotif.type == 1 then
        draw.RoundedBox( 4, tNotif.x - tNotif.w-25, tNotif.y, tNotif.w, tNotif.h, Cray_Lib.Colors._446280 )
        draw.RoundedBox( 0, tNotif.x - tNotif.w-25, tNotif.y+0.05, tNotif.w-(tNotif.w - 21), tNotif.h, Cray_Lib.Colors._3917496 ) 
    elseif tNotif.type == 2 then
        draw.RoundedBox( 4, tNotif.x - tNotif.w-25, tNotif.y, tNotif.w, tNotif.h, Cray_Lib.Colors._446280 )
        draw.RoundedBox( 0, tNotif.x - tNotif.w-25, tNotif.y+0.05, tNotif.w-(tNotif.w - 21), tNotif.h, Cray_Lib.Colors._1925743 ) 
    elseif tNotif.type == 3 then
        draw.RoundedBox( 4, tNotif.x - tNotif.w-25, tNotif.y, tNotif.w, tNotif.h, Cray_Lib.Colors._446280 )
        draw.RoundedBox( 0, tNotif.x - tNotif.w-25, tNotif.y+0.05, tNotif.w-(tNotif.w - 21), tNotif.h, Cray_Lib.Colors._24315618 ) 
    elseif tNotif.type == 4 then
        draw.RoundedBox( 4, tNotif.x - tNotif.w-25, tNotif.y, tNotif.w, tNotif.h, Cray_Lib.Colors._446280 )
        draw.RoundedBox( 0, tNotif.x - tNotif.w-25, tNotif.y+0.05, tNotif.w-(tNotif.w - 21), tNotif.h, Cray_Lib.Colors._52152235 ) 
    end

    draw.SimpleText( tNotif.txt, 'Cray_Lib::Font::15', tNotif.x - tNotif.w+3, tNotif.y + tNotif.h - 30, color_white )
end
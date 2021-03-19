/*
@name Cray_Lib
@description Garry's Mod Library.
@author Agent Arthur(MoskalykA)
*/

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

function Cray_Lib.Data:GetData(name, player)
    if not name or not player then return end
    if not isstring(name) then return end

    for k, v in pairs(Cray_Lib.Data.Lists) do
        if v.name == name then 
            return player['Cray_Lib.Data.' .. name] 
        else 
            return false
        end
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
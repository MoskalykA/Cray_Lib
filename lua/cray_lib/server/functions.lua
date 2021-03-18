/*
@name Cray_Lib
@description Garry's Mod Library.
@author Agent Arthur
*/

function Cray_Lib.Data:Sync()
    net.Start('Cray_Lib.Nets.Data.UpdateTable')
        net.WriteTable(Cray_Lib.Data.Lists)
    net.Broadcast()
    
    for k, v in pairs(Cray_Lib.Data.Lists) do
        util.AddNetworkString('Cray_Lib.Nets.Data.Update_' .. v.name)
    end

    net.Start('Cray_Lib.Nets.Data.Sync')
    net.Broadcast()
end

function Cray_Lib.Data:Register(name, type)
    if not name or not type then return end
    if not isstring(name) or not isstring(type) then return end

    Cray_Lib.Data:Sync()
    for k, v in pairs(Cray_Lib.Data.Lists) do
        if v.name == name then return end
    end

    Cray_Lib.Data.Lists[#Cray_Lib.Data.Lists + 1] = {name = name, type = type}

    net.Start('Cray_Lib.Nets.Data.UpdateTable')
        net.WriteTable(Cray_Lib.Data.Lists)
    net.Broadcast()
end

function Cray_Lib.Data:SetData(name, value, player)
    if not name or not value or not player then return end
    if not isstring(name) then return end

    Cray_Lib.Data:Sync()
    for k, v in pairs(Cray_Lib.Data.Lists) do
        if v.name == name then 
            player['Cray_Lib.Data.' .. name] = value

            local table = {
                type = v.type,
                variable_name = 'Cray_Lib.Data.' .. name,
                response = value,
                player = player
            }

            net.Start('Cray_Lib.Nets.Data.Update_' .. v.name)
                net.WriteTable(table)
            net.Send(player)
        else
            return
        end
    end 
end

function Cray_Lib.Data:UpdateData(name, value, player)
    if not name or not value or not player then return end
    if not isstring(name) then return end

    Cray_Lib.Data:Sync()
    for k, v in pairs(Cray_Lib.Data.Lists) do
        if v.name == name then 
            player['Cray_Lib.Data.' .. name] = value

            local table = {
                type = v.type,
                variable_name = 'Cray_Lib.Data.' .. name,
                response = value,
                player = player
            }

            net.Start('Cray_Lib.Nets.Data.Update_' .. v.name)
                net.WriteTable(table)
            net.Send(player)
        else
            return
        end
    end 
end

Cray_Lib.Data:Sync()
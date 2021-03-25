/*
@name Cray_Lib
@description Garry's Mod Library.
@author Agent Arthur(MoskalykA)
*/

util.AddNetworkString('Cray_Lib.Nets.Notification.Send')
util.AddNetworkString('Cray_Lib.Nets.Data.UpdateTable')
util.AddNetworkString('Cray_Lib.Nets.Data.Sync')
util.AddNetworkString('Cray_Lib.Nets.Configuration.ServerSync')
util.AddNetworkString('Cray_Lib.Nets.Configuration.ClientSync')
util.AddNetworkString('Cray_Lib.Nets.Configuration.Resource_Download')

net.Receive('Cray_Lib.Nets.Configuration.ServerSync', function(len, ply)
    if not IsValid(ply) then return end
    if not (ply:GetUserGroup() == 'superadmin') then return end

    if not file.Exists('cray_lib/', 'DATA') then 
        file.CreateDir('cray_lib')
        file.Write('cray_lib/configuration.json', util.TableToJSON({resource_download = true}))
    end

    if not file.Exists('cray_lib/configuration.json', 'DATA') then
        file.Write('cray_lib/configuration.json', util.TableToJSON({resource_download = true}))
    end

    net.Start('Cray_Lib.Nets.Configuration.ClientSync')
        net.WriteTable(util.JSONToTable(file.Read('cray_lib/configuration.json', 'DATA')))
    net.Send(ply)
end)

net.Receive('Cray_Lib.Nets.Configuration.Resource_Download', function(len, ply)
    if not IsValid(ply) then return end
    if not (ply:GetUserGroup() == 'superadmin') then return end

    if not file.Exists('cray_lib/', 'DATA') then 
        file.CreateDir('cray_lib')
        file.Write('cray_lib/configuration.json', util.TableToJSON({resource_download = true}))
    end

    if not file.Exists('cray_lib/configuration.json', 'DATA') then
        file.Write('cray_lib/configuration.json', util.TableToJSON({resource_download = true}))
    end

    local table_file = util.JSONToTable(file.Read('cray_lib/configuration.json', 'DATA'))
    table_file.resource_download = net.ReadBool()
    file.Write('cray_lib/configuration.json', util.TableToJSON(table_file))
end)
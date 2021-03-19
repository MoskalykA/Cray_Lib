/*
@name Cray_Lib
@description Garry's Mod Library.
@author Agent Arthur(MoskalykA)
*/

hook.Add('PlayerSpawn', 'Cray_Lib.Hooks.Data.PlayerSpawn', function(ply)
    net.Start('Cray_Lib.Nets.Data.Sync')
    net.Send(ply)

    Cray_Lib.Data:Sync()
end)
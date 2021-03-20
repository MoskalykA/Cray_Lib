/*
@name Cray_Lib
@description Garry's Mod Library.
@author Agent Arthur(MoskalykA)
*/

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
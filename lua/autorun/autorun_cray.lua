local path = 'cray_lib'

if SERVER then
    MsgN('///////////////////////////////')
    MsgN('//     Cray Lib    //')
    MsgN('///////////////////////////////')
    local files = file.Find(path..'/shared/*.lua', 'LUA')
    for _, file in ipairs(files) do
        AddCSLuaFile(path..'/shared/'..file)
        include(path..'/shared/'..file)
        Msg('FILE: '..file..'\n')
    end

    local files = file.Find(path..'/client/*.lua', 'LUA')
    for _, file in ipairs(files) do
        AddCSLuaFile(path..'/client/'..file)
        Msg('FILE: '..file..'\n')
    end

    local files = file.Find(path..'/server/*.lua', 'LUA')
    for _, file in ipairs(files) do
        include(path..'/server/'..file)
        Msg('FILE: '..file..'\n')
    end
    MsgN('///////////////////////////////')
end

if CLIENT then
    local files = file.Find(path..'/shared/*.lua', 'LUA')
    for _, file in ipairs(files) do
        include(path..'/shared/'..file)
    end

    local files = file.Find(path..'/client/*.lua', 'LUA')
    for _, file in ipairs(files) do
        include(path..'/client/'..file)
    end
end
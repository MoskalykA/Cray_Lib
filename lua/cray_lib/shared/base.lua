/*
@name Cray_Lib
@description Garry's Mod Library.
@author Agent Arthur
*/

Cray_Lib = Cray_Lib or {}

Cray_Lib.Colors = Cray_Lib.Colors or {}
Cray_Lib.Notifications = Cray_Lib.Notifications or {}

Cray_Lib.Fonts = Cray_Lib.Fonts or {}
Cray_Lib.Fonts.Data = {}

Cray_Lib.Data = Cray_Lib.Data or {}
Cray_Lib.Data.Lists = Cray_Lib.Data.Lists or {}

Cray_Lib.Math = Cray_Lib.Math or {}
Cray_Lib.Math.Lists = {
    {
        type = 'mm',
        totype = 'cm',
        func = function(value)
            return value * 10
        end
    },
    {
        type = 'mm',
        totype = 'dm',
        func = function(value)
            return value * 100
        end
    },
    {
        type = 'dm',
        totype = 'mm',
        func = function(value)
            return value / 100
        end
    },
    {
        type = 'mm',
        totype = 'm',
        func = function(value)
            return value * 1000
        end
    },
    {
        type = 'm',
        totype = 'mm',
        func = function(value)
            return value / 1000
        end
    },
    {
        type = 'mm',
        totype = 'dam',
        func = function(value)
            return value * 10000
        end
    },
    {
        type = 'dam',
        totype = 'mm',
        func = function(value)
            return value / 10000
        end
    },
    {
        type = 'mm',
        totype = 'hm',
        func = function(value)
            return value * 100000
        end
    },
    {
        type = 'hm',
        totype = 'mm',
        func = function(value)
            return value / 100000
        end
    },
    {
        type = 'mm',
        totype = 'km',
        func = function(value)
            return value * 1000000
        end
    },
    {
        type = 'km',
        totype = 'mm',
        func = function(value)
            return value / 1000000
        end
    },
    {
        type = 'cm',
        totype = 'mm',
        func = function(value)
            return value / 10
        end
    },
    {
        type = 'cm',
        totype = 'dm',
        func = function(value)
            return value * 10
        end
    },
    {
        type = 'dm',
        totype = 'cm',
        func = function(value)
            return value / 10
        end
    },
    {
        type = 'cm',
        totype = 'm',
        func = function(value)
            return value * 100
        end
    },
    {
        type = 'm',
        totype = 'cm',
        func = function(value)
            return value / 100
        end
    },
    {
        type = 'cm',
        totype = 'dam',
        func = function(value)
            return value * 1000
        end
    },
    {
        type = 'dam',
        totype = 'cm',
        func = function(value)
            return value / 1000
        end
    },
    {
        type = 'cm',
        totype = 'hm',
        func = function(value)
            return value * 10000
        end
    },
    {
        type = 'hm',
        totype = 'cm',
        func = function(value)
            return value / 10000
        end
    },
    {
        type = 'cm',
        totype = 'km',
        func = function(value)
            return value * 100000
        end
    },
    {
        type = 'km',
        totype = 'cm',
        func = function(value)
            return value / 100000
        end
    },
    {
        type = 'dm',
        totype = 'm',
        func = function(value)
            return value * 10
        end
    },
    {
        type = 'm',
        totype = 'dm',
        func = function(value)
            return value / 10
        end
    },
    {
        type = 'm',
        totype = 'dam',
        func = function(value)
            return value * 10
        end
    },
    {
        type = 'dam',
        totype = 'm',
        func = function(value)
            return value / 10
        end
    },
    {
        type = 'm',
        totype = 'hm',
        func = function(value)
            return value * 100
        end
    },
    {
        type = 'hm',
        totype = 'm',
        func = function(value)
            return value / 100
        end
    },
    {
        type = 'm',
        totype = 'km',
        func = function(value)
            return value * 1000
        end
    },
    {
        type = 'km',
        totype = 'm',
        func = function(value)
            return value / 1000
        end
    },
    {
        type = 'dam',
        totype = 'hm',
        func = function(value)
            return value * 10
        end
    },
    {
        type = 'hm',
        totype = 'dam',
        func = function(value)
            return value / 10
        end
    },
    {
        type = 'km',
        totype = 'hm',
        func = function(value)
            return value * 100
        end
    },
    {
        type = 'hm',
        totype = 'km',
        func = function(value)
            return value / 100
        end
    },
    {
        type = 'hm',
        totype = 'km',
        func = function(value)
            return value * 10
        end
    },
    {
        type = 'km',
        totype = 'hm',
        func = function(value)
            return value / 10
        end
    }
}
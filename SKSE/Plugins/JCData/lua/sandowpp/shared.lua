-- Library for things exclusive to this mod.

-- local dmlib = jrequire 'dmlib'

local shared = {}

-- ;>========================================================
-- ;>===                    MANAGERS                    ===<;
-- ;>========================================================

--- Returns a function that traverses a table and executes a function on each member.
---
--- This function is meant to be used by managers to easily traverse whatever they are
--- managing.
--- @param tbl table
function shared.traverse(tbl)
    --- @param func function(x) end
    ---@param x table
    return function (func, x)
        for name, member in pairs(tbl) do
            func(member, name, x.data, x.extra)
        end
    end
end
return shared
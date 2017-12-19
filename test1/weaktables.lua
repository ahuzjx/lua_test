a = {}
b = {}
setmetatable(a, b)
b.__mode = "k" -- now 'a' has weak keys
key = {} -- creates first key
print(key)
a[key] = 1
key = {} -- creates second key
print(key)
a[key] = 2
collectgarbage() -- forces a garbage collection cycle
for k, v in pairs(a) do print(v) end



local defaults={}
setmetatable(defaults, {__mode="k"}})
local mt={__index=function(t) return defaults[t] end}

function setDefault(t,d)
    defaults[t]=d
    setmetatable(t, mt)
end

local metas={}
setmetatable(metas, {__mode="v"})
function setDefault(t,d)
    local mt=metas[d]
    if mt==nil then
        mt={__index=function() return d end}
        metas[d]=mt
    end
    setmetatable(t, mt)
end


function pairsByKeys(t,f)
    local a={}
    for n in pairs(t) do table.insert(a,n) end
    table.sort(a,f)
    local i=0
    local iter=function()
        i=i+1
        if a[i]==nil then return nil
        else return a[i],t[a[i]]
        end
    end
    return iter
end

lines = {
    luaH_set = 10,
    luaH_get = 24,
    luaH_present = 48,
}

for name ,line in pairsByKeys(lines) do
    print(name,line)
end

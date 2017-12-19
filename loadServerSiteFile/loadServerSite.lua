-- sites=serverSites[1]
local out = io.open("site.xml", "w")

function LoadServerSite(id, name,xieyi, sites)
    out:write("\t<Site id=\"" .. id .. "\" name=\"" .. name .. "\" protocol=\"" .. xieyi .. "\">\n")
    local Name
    local address
    local port
    for i, v in pairs(sites) do
        Name = v[1]
        address = v[2]
        port = v[3]
        out:write("\t\t<ITEM Name=\"" .. name .. "\" Address=\"" .. address .. "\" Port=\"" .. port .. "\"/>\n")
    
    end
    out:write("\t</Site>\n")
end


out:write("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n")
out:write("<Sites>\n")

dofile("serverSite.lua")
out:write("</Sites>\n")
out:close()

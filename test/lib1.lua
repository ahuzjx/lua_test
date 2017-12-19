--file 'lib1.lua'
function norm(x, y)
    local n2 = x ^ 2 + y ^ 2
    return math.sqrt(n2)
end

function twice(x)
    return 2*x
end

page = [[
    <HTML>
    <HEAD>
    <TITLE>An HTML Page</TITLE>
    </HEAD>
    <BODY>
    Lua
    [ [a text between double brackets] ]
    </BODY>
    </HTML>
    ]]
io.write(page)
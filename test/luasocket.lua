require("luasocket_2_0_2_3-socket")

host="www.w3.org"
file = "/TR/REC-html32.html"
c = assert(socket.connect(host, 80))
c:send("GET " .. file .. " HTTP/1.0\r\n\r\n")
local s,status=c:receive(2^10)
print(s)
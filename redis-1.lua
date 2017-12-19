----luarocks install redis-lua --from=http://rocks.moonscript.org/dev
local redis = require 'redis'
local host = "127.0.0.1"
local port = 6379
client = redis.connect(host, port)

redis.call = function(cmd, ...) 
    return assert(loadstring('return client:'.. string.lower(cmd) ..'(...)'))(...)
end
redis.call("SET","qzhMoney",1000000)
local memory=redis.call("GET","qzhMoney")
print(memory)
----luarocks install redis-lua --from=http://rocks.moonscript.org/dev
--luarocks install lua-cmsgpack --from=http://luarocks.org
local redis=require "redis"
local params={
    host="127.0.0.1",
    port=6379
}

local client=redis.connect(params)

client:set('foo',"bar")
local value=client:get("foo")
print(value)

--list操作
client:lpush("lua_list_key","123","456")
client:rpush("lua_list_key","ABC")

local list_array=client:lrange("lua_list_key",0,-1)
for key,val in pairs(list_array)
do
    print("key=",key)
    print("val=",val)
end

client:hset("lua_hash_key","name","zhang3")
client:hset("lua_hash_key","age",18)


local name=client:hget("lua_hash_key","name")
print("name=",name)
local age=client:hget("lua_hash_key","age")
print("age=",age)

local hash_zhang3=client:hgetall("lua_hash_key")
for key,val in pairs(hash_zhang3)
do
    print("key=",key)
    print("val=",val)
end

client:sadd("wbq_friends","chenhe","lichen","marong","dengchao")
client:sadd("sz_friends","sz_wife","marong")
local wbq_sz_friends=client:sinter("wbq_friends","sz_friends")
for key,val in pairs(wbq_sz_friends)
do
    print("key=",key)
    print("val=",val)
end

--zset操作
client:zadd("music_top_zset",98,"music01")
client:zadd("music_top_zset",91,"music02")
client:zadd("music_top_zset",97,"music03")

local top_musics=client:zrange("music_top_zset",0,-1)
for key,val in pairs(top_musics)
do
    print("key=",key)
    print("val=",val)
end

print("----- use withscores -----")
local top_musics=client:zrange("music_top_zset",0,-1,{withscores=true})

for key,val in pairs(top_musics)
do
    print("key=",key)
    for index,value in pairs(val)
    do
        if (index == 1) then
            print("member = ", value)
            end
            if (index == 2) then
            print("socre = ", value)
            end
    end

   
end


client:del("foo")
client:del("lua_list_key")
client:del("wbq_friends")
client:del("sz_friends")
client:del("music_top_zset")
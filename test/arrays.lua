a={}
for i=1,1000 do
    a[i]=i
end

for i,v in ipairs(a) do
    print(v)
end

N=100
M=100
mt={}
for i=1,N do
    mt[i]={}
    for j=1,M do
        mt[i][j]=0
    end
end
mt=nil
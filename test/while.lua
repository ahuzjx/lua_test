do
    local i=100
    local sum=0;
    while i>0 do
        sum=sum+i
        i=i-1
    end
    print(sum)

    sum=0
    for var=1,100,1 do
        sum=sum+var
    end
    print(sum)

    days = {"Sunday", "Monday", "Tuesday", "Wednesday",
    "Thursday", "Friday", "Saturday"}

    revDays={}

    for i,v in ipairs(days) do
        revDays[v]=i
    end

    x = "Tuesday"
    print(revDays[x])
    
    for key,value in pairs(revDays) do
        print(key .. value)
    end
  
end

function maximum(a)
    local mi=1
    local m=a[mi]
    for i,val in ipairs(a) do
        if val>m then
            m=val
            mi=i
        end
    end
    return m,mi
end

print(maximum({8,10,23,12,5}))
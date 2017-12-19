function newStack()
    return {""}
end

function addString(stack,s)
    table.insert(stack,s)
    for i=table.getn(stack)-1,1,-1 do
        if string.len(stack[i])>string.len(stack[i+1]) then
            break
        end
        stack[i]=stack[i] .. table.remove(stack)
    end
end
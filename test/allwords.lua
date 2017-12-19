--迭代器遍历一个文件内的所有匹配的
--单词。为了实现目的，我们需要保留两个值：当前行和在当前行的偏移量，我们使用两
--个外部局部变量 line、pos 保存这两个值

function allwords()
    local line=io.read()
    local pos=1
    return function()
        while line do
            local s,e=string.find(line,"%w+",pos)
            if s then
                pos=e+1
                return string.sub(line,s,e)
            else
                line=io.read()
                pos=1
            end
        end
    return nil
    end
end

for word in allwords() do
    print(word)
end
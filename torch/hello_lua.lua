-- string, number, tables - a tiny introduction
-- how to run this code in command line:$th hello_lua.lua
a = 'hello lua'
print(a)

-- table
b={}
b[1] = a
b[2] = 30
b[3] = 20.0

-- the # operator is the length operator in Lua
for i=1,#b do
    print(b[i])
end

print(type(b[3]))

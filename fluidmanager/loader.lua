f = fs.open("d.txt", "r")
db = {}

while true do
    local line = f.readLine()
    if not line then break end
    db[#db+1] = textutils.unserialiseJSON(line)
end

for k,v in pairs(db) do
    multishell.launch({}, "manager.lua", v)
end
args = {...}
barrel = peripheral.wrap("bottom")
chests = { peripheral.find("minecraft:chest") }

function findME(name)
    counter = {}

    for k, v in pairs(chests) do
        for kk, namein in pairs(v.list()) do
            if namein.name == name then

                if k == counter.x and kk == counter.y then
                    table.insert(counter, {["count"]=namein.count, ["x"]=k, ["y"]=kk, ["name"]=name})
                end
            end
        end
        return counter
    end
end

function sumCounts(data)
    local result = {}
    
    for _, item in ipairs(data) do

        if item ~= nil then
            local name = item.name
            local count = item.count
            

            if not result[name] then
                result[name] = 0
            end
        end
        
        result[name] = result[name] + count
    end
    
    return result
end

function deposit()
    for i= 1, barrel.size() do
        for _,v in pairs(chests) do
            barrel.pushItems(peripheral.getName(v), 64)
        end
    end
end

function sumall()
    data = {}
    dataall = {}
    for k,v in pairs(chests) do
        table.insert(data, v.list())
    end

    for i=1, #data do
        table.insert(dataall, sumCounts(data))
    end

    return dataall
end


if args[1] == "f" then
    z = findME(args[2])
    for k,v in pairs(z) do 
        if v then
            print( ("%s - %d / %d=%d"):format(v.name, v.count, v.x, v.y) ) 
        end
    end
elseif args[1] == "d" then
    deposit()

elseif args[1] == "a" then
    x = sumall()
    print(textutils.serialise(x))
end

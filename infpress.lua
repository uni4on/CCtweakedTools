
cache = "minecraft:barrel_4"
ph = peripheral.wrap(cache)

ed = "minecraft:barrel_5"
ep = peripheral.wrap(ed)

depots = { peripheral.find("create:depot") }
name = ""


function load()
    while true do
        z = ph.list()
        if z then

            for _,v in pairs(z) do
                name = v.name
            end

            for k,v in pairs(z) do
            
                if v.name == name then
                    for kk,vv in pairs(depots) do
                        ph.pushItems(peripheral.getName(vv), k, 1)
                    end
                end
            end 
        end
    end


end

function get()

    while true do
        for k,vn in pairs(depots) do
            for kk,ll in pairs(vn.list()) do
                local vvv = vn.getItemDetail(kk)
                if ll.name ~= name and not vvv.durability then
                    ep.pullItems(peripheral.getName(vn), kk)
                end
            end
        end
    end

end

parallel.waitForAll(load, get)
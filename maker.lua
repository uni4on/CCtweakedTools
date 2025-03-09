depot = "create:belt_2"
brl = "create:item_vault_2"
dropper = { peripheral.find("create:chute") }
press = "basin_2"
stoneout = "minecraft:hopper_0"
stonevault = "create:item_vault_3"

function checker()
    local x = peripheral.wrap(depot)
    local z = peripheral.wrap(press)
    
    while true do
        for k,v in pairs(x.list()) do
            if v.name == "minecraft:iron_nugget" then
                
                z.pullItems(depot, k, 9) 
                
            elseif v.name == "minecraft:flint" then
                x.pushItems(brl, k)
            end
                
        end
        os.sleep(0.1)
    end
end

function sniffer()

    
    local x = peripheral.wrap(press)
    while true do
        for k, v in pairs(x.list()) do
            if v.name == "minecraft:iron_ingot" then
                x.pushItems(brl, k)
            end
        end
    end
end

function drop()

    local x = peripheral.wrap(stonevault)

    while true do
        for kk,vv in pairs(dropper) do
            for k,v in pairs(x.list()) do
                if v.name == "minecraft:cobblestone" then
                    vv.pullItems(stonevault, k)
                end
            end
        end
    end
end

function getcobble()
    local x = peripheral.wrap(stoneout)
    while true do
        x.pushItems(stonevault, 1)
    end
end

parallel.waitForAll(checker, drop, sniffer, getcobble)


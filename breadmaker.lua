x = { peripheral.find("create:mechanical_crafter") }

z = peripheral.find("minecraft:barrel")

while true do
    for k,v in pairs(z.list()) do    
        if v.name == "minecraft:wheat" then
            for kk,vv in pairs(x) do
                vv.pullItems(peripheral.getName(z), k, 1)        
            end
        end    
    end

end

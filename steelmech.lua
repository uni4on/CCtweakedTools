local dep  ="create:deployer_3"
local ch = "minecraft:chest_53"
local ing = "create:depot_25"

barrellist = {}

local function blist()
    while true do
        barrellist = peripheral.call(ch, "list")
    end
end

local function main()
    local x = peripheral.wrap(ing)

    while true do
        local inst = x.getItemDetail(1)
        if inst then
           if inst.name == "tfmg:heavy_plate" then
                for k,v in pairs(barrellist) do
                    if v.name == "tfmg:steel_ingot" then
                        peripheral.call(dep, "pullItems", ch, k, 1)
                    end
                end

            elseif inst.name ~= "tfmg:heavy_plate" and inst.name ~= "tfmg:unfinished_steel_mechanism" and inst.name ~= "tfmg:steel_mechanism" then
                peripheral.call(ing, "pushItems", ch, 1)

            elseif inst.name == "tfmg:unfinished_steel_mechanism" and tonumber(string.format("%.1f", inst.durability)) == 0.2 then
                for k,v in pairs(barrellist) do
                    if v.name == "tfmg:aluminum_ingot" then
                        peripheral.call(dep, "pullItems", ch, k, 1)
                    end
                end
            elseif inst.name == "tfmg:unfinished_steel_mechanism" and tonumber(string.format("%.1f", inst.durability)) == 0.5 then
                for k,v in pairs(barrellist) do
                    if v.name == "tfmg:screw" then
                        peripheral.call(dep, "pullItems", ch, k, 1)
                    end
                end
            elseif inst.name == "tfmg:unfinished_steel_mechanism" and tonumber(string.format("%.2f", inst.durability)) == 0.77 then
                for k,v in pairs(barrellist) do
                    if v.name == "tfmg:screwdriver" then
                        peripheral.call(dep, "pullItems", ch, k, 1)
                    end
                end
            elseif inst.name == "tfmg:steel_mechanism" then
                peripheral.call(ing, "pushItems", ch, 1)
           end
        else
            for k,v in pairs(barrellist) do
                if v.name == "tfmg:heavy_plate" then
                    x.pullItems(ch, k, 1)
                end
            end
        end
        os.sleep(0.3)
        peripheral.call(dep, "pushItems", ch, 1)
    end
end

parallel.waitForAll(blist, main)
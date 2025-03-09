depo = peripheral.wrap("create:depot_1")
belt = "create:belt_0"
chest = "minecraft:chest_39"
chestcontrol = peripheral.wrap(chest)


depo.pushItems(chest, 1)

while true do

    for k,v in pairs(chestcontrol.list()) do
        if v.name == "create:golden_sheet" then
            chestcontrol.pushItems(belt, k, 1)
        end
    end

    while true do
        repeat
            os.sleep(0.2)
        until depo.getItemDetail(1)

        x = depo.getItemDetail(1)

        if x.name == "create:incomplete_precision_mechanism" then
            depo.pushItems(belt, 1)
        elseif x.name == "create:precision_mechanism" then
            depo.pushItems(chest, 1)
            break
        else
            depo.pushItems(chest, 1)
            break
        end
    end
end


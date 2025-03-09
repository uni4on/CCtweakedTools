brl = "minecraft:barrel_6"
brlc = peripheral.wrap(brl)
out1 = "fluidTank_11"


oven = { peripheral.find("tfmg:coke_oven") }

function load()
    while true do
        for x, z in pairs(oven) do
            for k,v in pairs(brlc.list()) do
                if v.name == "minecraft:coal" then
                    brlc.pushItems(peripheral.getName(z), k, 10)
                end
            end
        end
        os.sleep(50)
    end
end

function outfluid()
    while true do
        for k,v in pairs(oven) do
            v.pushFluid(out1, 5000)
        end
        os.sleep(1)
    end
end


load()

outfluid()


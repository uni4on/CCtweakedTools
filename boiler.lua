boilers = {"fluidTank_18", "fluidTank_19"}
lava = "fluidTank_20"
water = "fluidTank_21"

function lavain()
    lavalits = 100 

    while true do
        local heater = { peripheral.find("createaddition:liquid_blaze_burner") }
        for k,v in pairs(heater) do
            peripheral.call(peripheral.getName(v), "pullFluid", lava, lavalits) 
        end
        os.sleep(90)
    end
end

function waterin()
    waterlits = 1000

    while true do
        
        for k,v in pairs(boilers) do

            peripheral.call(v, "pullFluid", water, waterlits)
           
        end
        os.sleep(1)
    end
end

parallel.waitForAll(lavain, waterin)

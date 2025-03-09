lava = "fluidTank_1"

while true do 

    x = { peripheral.find("createaddition:liquid_blaze_burner") }

    for _,v in pairs(x) do 
        v.pullFluid(lava, 100)
    
    end

    os.sleep(90)
end
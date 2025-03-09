water = peripheral.wrap("fluidTank_2")
boilers = {"fluidTank_3", "fluidTank_4", "fluidTank_5", "fluidTank_6"}



while true do 


    for _,v in pairs(boilers) do 
        water.pushFluid(v, 10000)
    
    end

    os.sleep(2)
end
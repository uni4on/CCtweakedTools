
pvault = peripheral.wrap("create:item_vault_0")
vault = "create:item_vault_0"

vaults = { peripheral.find("create:item_vault") }
chests = { peripheral.find("minecraft:chest") }

for i =1, #chests do
    table.insert(chests, vaults[i])
end

brl = peripheral.wrap("minecraft:barrel_7")
depots = { peripheral.find("create:depot") } 
plavka =  "minecraft:chest_24" 

loadcoal = 0

function listof()
    local data = {}

    for k,v in pairs(chests) do
        for slot, info in pairs(v.list()) do
            table.insert(data, {["storage"]=k, ["slot"]=slot, ["item_name"]=info.name, ["item_count"]=info.count, ["vname"]=peripheral.getName(v)})
        end
    end

    return data
end

function find(name)
    local data = {}

    for k,v in pairs(chests) do
        for slot, info in pairs(v.list()) do
            local a, b = info.name:match("([^:]+):([^:]+)")

            if name == b then
                table.insert(data, {["storage"]=k, ["slot"]=slot, ["item_name"]=info.name, ["item_count"]=info.count, ["vname"]=peripheral.getName(v)})
            end
        end
    end

    return data
end



function drop_to_vault(ch1)
    for k,v in pairs(chests[tonumber(ch1)].list()) do
        print(k, v.name)
        chests[tonumber(ch1)].pushItems(vault, k)
    end
end

function transfer(ch1, ch2)

    for k,v in pairs(chests[tonumber(ch1)].list()) do
        print(k, v.name)
        chests[tonumber(ch1)].pushItems(peripheral.getName(chests[tonumber(ch2)]), k)
    end
    
    
end

function listchest(storage)
    return chests[tonumber(storage)].list()
end

function listchest(storage)
    return chests[tonumber(storage)].list()
end

function push(chest, slot, tochest)
    chests[tonumber(chest)].pushItems(peripheral.getName(chests[tonumber(tochest)]), tonumber(slot))
end

function pushdepot(chest, slot, todepot, count)
    chests[tonumber(chest)].pushItems(peripheral.getName(depots[tonumber(todepot)]), tonumber(slot), tonumber(count))
end

function press(name, count)

    if not name and not count then
        return -1
    end

    local getcount = tonumber(count)
    local data = find(name)
    local pname = data[1].item_name

    for k,v in pairs(data) do
        brl.pullItems(peripheral.getName(chests[v.storage]), v.slot, v.item_count)
        getcount = getcount - v.item_count
    end

    if getcount ~= 0 then print("needed "..getcount ) end

    for i=1, #brl.list() do
        brl.pushItems(peripheral.getName(depots[1]), i) 
    end

    
end

function listdepots()
    for k,v in pairs(depots) do 
        print(("%d %s"):format(k, peripheral.getName(v)))
    end
end


pushplavka(name, stacks)

    if not name and not stacks then
        return -1
    end
    local getblocks = find(name)
    if tonumber(stacks) <= #getblocks then
        for k,v in pairs(getblocks) do
            chests[v.storage].pushItems(plavka, v.slot)
            print(("%d - %s %d"):format(k, v.item_name, v.item_count))
            if k == tonumber(stacks) then
                break
            end
        end
    else
        print("too match")
    end
    
end

function pushwood(name, stacks)

    if not name and not stacks then
        return -1
    end
    local getblocks = find(name)
    if tonumber(stacks) <= #getblocks then
        for k,v in pairs(getblocks) do
            chests[v.storage].pushItems("minecraft:chest_38", v.slot)
            print(("%d - %s %d"):format(k, v.item_name, v.item_count))
            if k == tonumber(stacks) then
                break
            end
        end
    else
        print("too match")
    end
    
end

function pushdrob(name, stacks)

    if not name and not stacks then
        return -1
    end
    local getblocks = find(name)
    if tonumber(stacks) <= #getblocks then
        for k,v in pairs(getblocks) do
            chests[v.storage].pushItems("minecraft:chest_36", v.slot)
            print(("%d - %s %d"):format(k, v.item_name, v.item_count))
            if k == tonumber(stacks) then
                break
            end
        end
    else
        print("too match")
    end
    
end

function showchest(storage)
    local data = listchest(storage)

    for k,v in pairs(data) do
        print(("%d - %s %d"):format(k, v.name, v.count))
        os.sleep(0.2)
    end
end

function mesto()
    local data = {}
    for k,v in pairs(chests) do
        table.insert(data, {["chest"]=k, ["max"]=v.size(), ["items"]=#v.list()})
    end

    return data
end

function get(storage, slot)
    brl.pullItems(peripheral.getName(chests[tonumber(storage)]), tonumber(slot))
end

function vget(slot)
    brl.pullItems(vault, tonumber(slot))
end

function depotget(depot, slot)
    brl.pullItems(peripheral.getName(depots[tonumber(depot)]), tonumber(slot))
end

function calcmesto()
    local data = mesto()
    limit = 0
    items = 0
    for k,v in pairs(data) do
        limit = limit + v.max
        items = items + v.items
    end

    local d = ((items)/(limit))*100

    print(("%d / %d-items %d%%"):format(limit, items, d))
end



function vaultMON()
    local mon = peripheral.wrap("monitor_1")
    local vault = peripheral.wrap("create:item_vault_0")
    while true do

        limit = 0
        items = 0
    
        limit = limit + vault.size()
        items = items + #vault.list()
    

        local d = ((items)/(limit))*100
        mon.clear()
        mon.setTextScale(1.5)
        mon.setCursorPos(1,1)
        mon.write(("%d / %d - %d%%"):format(limit, items, d))

        os.sleep(0.3)
    end
end

function getamount(name, stacks)

    local data = find(name)
    local ocal a, b = name:match("([^:]+):([^:]+)")

    local counter = 0

    for k, v in pairs(data) do
        if counter == tonumber(stacks) then
            return
        end

        brl.pullItems(v.vname, v.slot)
        print(v.item_name, v.slot, v.item_count)
        counter = counter + 1
    end

end

function calclistof()
    local data = listof()

    for k,v in pairs(data) do 
        print(("%d | %s - %d | (%d/%d) %s"):format(k, v.item_name, v.item_count, v.storage, v.slot, v.vname))
        os.sleep(0.2)
    end
end

function calcfind(name)
    local data = find(name)

    for k,v in pairs(data) do 
        print(("%d | %s - %d | (%d/%d) %s"):format(k, v.item_name, v.item_count, v.storage, v.slot, v.vname))
        os.sleep(0.2)
    end
    
end

function droping()
    local x = {"minecraft:chest_23", "minecraft:chest_35", "minecraft:chest_45", "minecraft:chest_50", "minecraft:barrel_8", "minecraft:chest_22"}
    while true do
        for k,chest in pairs(x) do
            for slot, item in pairs(peripheral.call(chest, "list")) do
                pvault.pullItems(chest, slot)
            end
        end
    end
end

function pushnuggets()
    local press = peripheral.wrap("basin_1")
    while true do
        local data = listof()
        
        for k,v in pairs(data) do
            if v.vname ~= "minecraft:chest_52" then
                if v.item_name ~= "create:experience_nugget" then
                    if v.item_name ~= "minecraft:iron_nugget" then
                        if v.item_name:find("nugget") then
                            press.pullItems(v.vname, v.slot)
                        end
                    end
                end
            end
        end
    end
end

function dropoven()
    local x = { peripheral.find("tfmg:coke_oven") } 
    while true do
        for k,v in pairs(x) do
            v.pushFluid("tfmg:flarestack_0", 5000)
        end
    end
end

function loadcoaltooven()
    local x = { peripheral.find("tfmg:coke_oven") } 
    while true do
        if loadcoal == 1 then

            
            local data = listof()
            for k,v in pairs(x) do
                for kk,vv in pairs(data) do
                    if vv.item_name == "minecraft:coal" then
                        v.pullItems(vv.vname, vv.slot, 5)
                    end
                end
            end
        else
            os.sleep(1)
        end
    end
end

function dropflint()
    while true do

        local data = listof()
        local xr = peripheral.wrap("create:chute_10")
        for k,v in pairs(data) do
            if v.item_name == "minecraft:flint" then
                peripheral.call(v.vname, "pushItems", "create:chute_10", v.slot)
            end
            
        end
    

    end
end

function unloadbackpack()

        
    function bbb()
        local x = peripheral.find("sophisticatedbackpacks:backpack")
        if x then
            for k,v in pairs(x.list()) do
                pvault.pullItems(peripheral.getName(x), k)
            end
        end
    end
    
    while true do
        pcall(bbb)
        os.sleep(0.5)
    end
    
end

function lavaspout()
    local x = peripheral.wrap("create:spout_0")

    while true do
        x.pullFluid("fluidTank_1", 1000)
    end
end

function railfabric()
    local nugget =  {"create:deployer_0", "create:deployer_1" }
    local cache = peripheral.wrap("minecraft:chest_52")
    local slab = "create:deployer_2"

    local function load()
        while true do 
            for _,dp in pairs(nugget) do
                local data = cache.list()
                for k,v in pairs(data) do
                    if v.name == "minecraft:iron_nugget" then
                        cache.pushItems(dp, k, 10)
                    elseif v.name == "minecraft:oak_slab" then
                        cache.pushItems(slab, k)
                    end   
                end
            end
        end
    end

    local function get()
        while true do 
            local data = find("iron_nugget")
            for k,v in pairs(data) do
                cache.pullItems(v.vname, v.slot)
            end
        end
    end

    parallel.waitForAll(load, get)
end

function pullingots()
    local press = peripheral.wrap("basin_1")
    while true do
        local data = press.list()
        for k,v in pairs(data) do
            if not v.name:find("nugget") then
                press.pushItems(vault, k)
            end
        end
    end
end

function pushautodrob()

    local drob = 'minecraft:chest_36'
    while true do
        local data = listof()
        for k,v in pairs(data) do
            if v.vname ~= "minecraft:chest_48" then
                if v.item_name:find("%f[%a]raw%f[%A]") and not v.item_name:find("%f[%a]crushed%f[%A]")  or v.item_name == "tfmg:coal_coke" then
                    peripheral.call(v.vname, "pushItems", drob, v.slot)
                end
            end
        end
    end
end

function crushedtowater()
    while true do
        dat = listof()
        for k,v in pairs(dat) do
            x = {}
            if v then
                if v.item_name ~= "create:crushed_raw_iron" then
                    for w in v.item_name:gmatch("[^:_]+") do table.insert(x, w) end
                    if x[2] == "crushed" then
                        peripheral.call(v.vname, "pushItems", plavka, v.slot)
                    end 
                end
            end
        end
    end
end

function pushstail()
    local x = "tfmg:blast_furnace_output_1"
    while true do
        peripheral.call(x, "pushFluid", "fluidTank_17", 5000, "tfmg:molten_slag")
        peripheral.call(x, "pushFluid", "fluidTank_14", 5000, "tfmg:molten_steel")
    end
end

function pushingstail()
    local x = "create:chute_11"
    while true do
        local data = listof()
        for k,v in pairs(data) do
            if v.item_name == "tfmg:blasting_mixture" or v.item_name == "tfmg:coal_coke_dust" then
                peripheral.call(v.vname, "pushItems", x, v.slot)
            end
        end
    end
end

function loadkreosote()
    local spout = "create:spout_0"
    local tank = "fluidTank_11"

    while true do
        peripheral.call(tank, "pushFluid", spout, 1000)
    end
end

function craftmixture()
    local bosinn = "basin_3"
    local function pushto()
        while true do
            local data = listof()

            for k,v in pairs(data) do
                if v.item_name == "tfmg:limesand" or v.item_name == "create:crushed_raw_iron" then
                    peripheral.call(v.vname, "pushItems", bosinn, v.slot)
                end
            end
        end
    end

    local function pullfrom()
        while true do
            for k,v in pairs(peripheral.call(bosinn, "list")) do
                if v.name == "tfmg:blasting_mixture" then
                    pvault.pullItems(bosinn, k)
                end
            end
        end
    end

    local function meltcoke() 
        local drobber = "minecraft:chest_36"
        while true do
            local data = listof()
            
            for k,v in pairs(data) do
                if v.item_name == "tfmg:coal_coke" or v.item_name == "create:limestone" then
                    peripheral.call(v.vname, "pushItems", drobber, v.slot)
                end
            end
        end
    end

    parallel.waitForAll(pushto, pullfrom, meltcoke)

end

function setoven(nb)
    loadcoal = tonumber(nb)
end

function tfdf(fromvname, tovname)
    local tx = peripheral.wrap(fromvname)
    local rx = tovname
    
    for k,v in pairs(tx.list()) do 
        tx.pushItems(rx, k)
        print(k, v.name, v.count)
    end

end

function craftSteel()
    local makingbasin = "tfmg:casting_basin_0"
    local makingspout = "tfmg:casting_spout_0"
    local stailtank = "fluidTank_14"

    local function loadspout()
        while true do
            peripheral.call(stailtank, "pushFluid", makingspout, 1000)
        end
    end

    local function pullingots()
        while true do
            local x = peripheral.call(makingbasin, "list")
            for k,v in pairs(x) do
                if v.name == "tfmg:steel_ingot" then
                    pvault.pullItems(makingbasin, k)
                end
            end
        end
    end

    parallel.waitForAll(loadspout, pullingots)
end

function main()


    textutils.slowPrint("loading uni4on's Base ME System . . .", 0.5)
    while true do
        io.write("[BASE@uni4on]-->"
        local stt = io.read()
        local g = {}
        for w in stt:gmatch("%S+") do table.insert(g, w) end
        local st = g

        if st[1] == "f" then
            calcfind(st[2])
        elseif st[1] == "g" then
            get(st[2], st[3])
        elseif st[1] == "a" then
            calcmesto()
            calclistof()
        elseif st[1] == "p" then
            push(st[2], st[3], st[4])

        elseif st[1] == "ld" then
            listdepots()

        elseif st[1] == "pd" then
            pushdepot(st[2], st[3], st[4], st[5])

        elseif st[1] == "sc" then
            showchest(st[2])

        elseif st[1] == "melt" then
            pushplavka(st[2], st[3])

        elseif st[1] == "press" then
            press(st[2], st[3])
        
        elseif st[1] == "t" then
            transfer(st[2], st[3])

        elseif st[1] == "gd" then
            depotget(st[2], st[3])

        elseif st[1] == "pushwood" then
            pushwood(st[2], st[3])

        elseif st[1] == "pushdrob" then

        
        elseif st[1] == "tv" then
            drop_to_vault(st[2])
        elseif st[1] == "gv" then
            vget(st[2])

        elseif st[1] == "gg" then
            getamount(st[2], st[3])

        elseif st[1] == "dropflint" then
            enabledropflint(st[2])

        elseif st[1] == "tfdf" then
            tfdf(st[2], st[3])

        elseif st[1] == "loadcoal" then
            setoven(st[2])
        end
    end

end

parallel.waitForAll(main, droping, vaultMON, pullingots, railfabric, pushautodrob, pushstail, dropoven, pushingstail, dropflint, craftmixture, craftSteel, loadcoaltooven, unloadbackpack, pushnuggets, crushedtowater, loadkreosote)


--  pushnuggets  crushedtowater 

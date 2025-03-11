txfrog = peripheral.wrap("create:package_frogport_4")
rxfrog = peripheral.wrap("create:package_frogport_5")

txs = { "create:packager_1", "create:packager_3", "create:packager_5", "create:packager_11", "create:packager_9", "create:packager_7", "create:packager_17", "create:packager_15", "create:packager_13"}

rxs = {"create:packager_0", "create:packager_2", "create:packager_4", "create:packager_10", "create:packager_8", "create:packager_6", "create:packager_16", "create:packager_14", "create:packager_12"}

function tx()
    while true do
        for k,v in pairs(txs) do
            txfrog.pullItems(v, 1)
        end
    end
end

function rx()
    while true do
        for k,v in pairs(rxfrog.list()) do
            rxfrog.pushItems(rxs[math.random(#rxs)], k)
        end
    end
end

parallel.waitForAll(rx, tx)



tx = peripheral.wrap("minecraft:barrel_0")
rx = peripheral.wrap("minecraft:barrel_1")

ct= { peripheral.find("create:packager") }

function ftx()
    while true do
        for k,v in pairs(ct) do
            tx.pullItems(peripheral.getName(v), 1)
        end
    end
end

function frx()
    while true do
        for k,v in pairs(rx.list()) do
            rx.pushItems(peripheral.getName(ct[math.random(#ct)]), k)
        end
    end
end

parallel.waitForAll(frx, ftx)



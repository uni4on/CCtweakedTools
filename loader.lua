

function load()
    local x = peripheral.wrap("left")
    while true do
        x.pushItems("right", 1)
    end
end

while true do pcall(load()) end

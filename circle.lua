local counter = 1
local bb = 4

redstone.setOutput("bottom", true)

for i=1,10 do
    turtle.forward()
end

turtle.placeDown()

while true do
    for i=1,2 do
        for k=1,counter do
            for n =1, bb do
                turtle.forward()
            end
            turtle.placeDown()
        end
        counter = counter + 1
        turtle.turnLeft()
    end
end
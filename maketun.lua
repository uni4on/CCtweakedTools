print(turtle.getFuelLevel())

for i=1, 10 do
    turtle.dig()
    turtle.forward()
end

for i=1, 11 do
    turtle.select(1)
    turtle.place()
    turtle.select(2)
    turtle.place()
    turtle.back()
end

turtle.select(3)
turtle.place()
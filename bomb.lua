
x = math.random(10, 100)
y = math.random(50, 100)
z = math.random(10, 100)

repeat
    os.sleep(1)
until turtle.getItemDetail(16)

for i=1, y do
    turtle.up()
end

for i=1, z do
    turtle.forward()
end

turtle.turnRight()

for i=1, x do
    turtle.forward()
end

for i=1, 16 do
    turtle.select(i)
    turtle.placeDown()
    turtle.forward()
end





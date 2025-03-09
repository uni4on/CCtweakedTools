
function lin()
	for i=1, 10 do
		repeat
			local x, y = turtle.inspect()
			if y.name == "minecraft:water" or y.name == "minecraft:lava" then break end
			turtle.dig()
		until not x

		turtle.forward()
		turtle.digUp()
		turtle.digDown()
		end
end

function ll()
	turtle.turnLeft()
	turtle.dig()
	turtle.forward()
	turtle.digDown()
	turtle.digUp()
	turtle.turnLeft()
end

function rr()
	turtle.turnRight()
	turtle.dig()
	turtle.forward()
	turtle.digDown()
	turtle.digUp()
	turtle.turnRight()
end

turtle.select(1)

print(turtle.getFuelLevel())

for i=1, 10 do 

		lin()
		rr()
		lin()
		ll()

end
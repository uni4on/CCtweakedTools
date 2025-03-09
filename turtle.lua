rednet.open("right")

while true do

	_,x = rednet.receive()

	if x.name == "f" then
		for i=1, x.q do
			turtle.forward()
		end	
	elseif x.name == "u" then
		for i=1, x.q do
			turtle.up()
		end
	elseif x.name == "d" then
		for i=1, x.q do
			turtle.down()
		end
	elseif x.name == "t" then
		turtle.placeDown(x.q)

	elseif x.name == "b" then
		for i=1, x.q do
			turtle.back()
		end
	elseif x.name == "l" then
		turtle.turnLeft()

	elseif x.name == "r" then
		turtle.turnRight()

	elseif x.name == "sel" then
		turtle.select(tonumber(x.q))

	elseif x.name == "du" then
		turtle.digUp()

	elseif x.name == "dd" then
		turtle.dig()

	elseif x.name == "dz" then
		turtle.digDown()

	elseif x.name == "pu" then
		turtle.placeUp()

	elseif x.name == "p" then
		turtle.place()

	elseif x.name == "pd" then
		turtle.placeDown()

	elseif x.name == "suck" then
		turtle.suck()

	elseif x.name == "suckup" then
		turtle.suckUp()

	elseif x.name == "suckdown" then
		turtle.suckDown()

	elseif x.name == "drop" then
		turtle.drop(x.q)
	end
end

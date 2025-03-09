
function lin()
	for i=1, 10 do
		turtle.dig()
		turtle.forward()
	end
end

function ll()
	turtle.turnLeft()
	turtle.dig()
	turtle.forward()
	turtle.turnLeft()
end

function rr()
	turtle.turnRight()
	turtle.dig()
	turtle.forward()
	turtle.turnRight()
end


for i=1, 10 do 

		lin()
		rr()
		lin()
		ll()

end
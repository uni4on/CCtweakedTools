
function lin()
	for i=1, 10 do
		turtle.dig()
		turtle.forward()
	end
end

function sd()
	for i=1, 10 do
		turtle.dig()
		turtle.forward()
	end
end


function ll()
	turtle.turnLeft()
	sd()
	turtle.turnLeft()
end

function rr()
	turtle.turnRight()
	sd()
	turtle.turnRight()
end


for i=1, 10 do 

		lin()
		rr()
		lin()
		ll()

end

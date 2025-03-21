
function lin()
	for i=1, 50 do
		turtle.dig()
		dd()
		turtle.forward()
	end
end

function dd()
	turtle.digDown()
	turtle.digUp()
end

function sd()
	for i=1, 10 do
		turtle.dig()
		dd()
		turtle.forward()
	end
	dd()
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

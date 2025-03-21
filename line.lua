
function lin()
	for i=1, 50 do
		gc()
		dd()
		turtle.forward()
	end
end

function dd()
	turtle.digDown()
	turtle.digUp()
end

function gc()
	repeat
		x = { turtle.inspect() }
		if x[1] then
			if x[2].tags["minecraft:replaceable"] == true then
				return
			else
				turtle.dig()
			end
		end
	until x[1] ~= true
end

function sd()
	for i=1, 10 do
		gc()
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

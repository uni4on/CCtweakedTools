rednet.open("back")

while true do

	_,s = os.pullEvent("char")

	if s == "w" then
		rednet.broadcast( { ["name"]="f", ["q"]=1 } )
	elseif s == "s" then
		rednet.broadcast( { ["name"]="b", ["q"]=1 } )
	elseif s == "a" then
		rednet.broadcast( { ["name"]="l", ["q"]=1 } )
	elseif s == "d" then
		rednet.broadcast( { ["name"]="r", ["q"]=1 } )
	elseif s == "q" then
		rednet.broadcast( { ["name"]="u", ["q"]=1 } )
	elseif s == "e" then
		rednet.broadcast( { ["name"]="d", ["q"]=1 } )
	elseif s == "r" then
		rednet.broadcast( { ["name"]="dd", ["q"]=1 } )
	elseif s == "x" then
		nm = io.read()
		nq = io.read()
		rednet.broadcast({ ["name"]=nm, ["q"]=nq })
    elseif s == "h" then
        rednet.broadcast({ ["name"]="p", ["q"]=1 })
    elseif s == "b" then
        rednet.broadcast({ ["name"]="pd", ["q"]=1 })
    end
end

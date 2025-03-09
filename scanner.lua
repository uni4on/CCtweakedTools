x = peripheral.find("geoScanner")

while true do
	
	repeat
		z = x.scan(8)
	until z ~= nil

		
	for k,v in pairs(z) do
		if v.name == "minecraft:diamond_ore" or v.name == "minecraft:deepslate_diamond_ore" or v.name == "computercraft:turtle_normal" or v.name == "minecraft:ancient_debris" then
			d = v.x*v.x + v.y*v.y + v.z*v.z
			print(v.name .. "  X:"..v.x.." Y:"..v.y.." Z:"..v.z.." DST: "..math.sqrt(d).."\n")
		end
	end
	os.sleep(2)
	term.clear()
	term.setCursorPos(1,1)
end
repeat
    if turtle.getItemDetail().count < 10 then
        break
    end

    turtle.placeDown()
    for i=1,10 do 
        turtle.forward()
    end
    turtle.placeDown()
until not turtle.getItemDetail()
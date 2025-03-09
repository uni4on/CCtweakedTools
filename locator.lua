

local cords = {["x"]=1, ["y"]=2, ["z"]=4, ["date"]=os.date()}
local vvv = textutils.serialiseJSON(cords)
local b = "https://webhook.site/ea69b472-1c2c-4262-a56d-bd18cfc77718"

http.post(b, vvv)





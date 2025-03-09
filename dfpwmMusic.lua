local dfpwm = require("cc.audio.dfpwm")
local speaker = peripheral.find("speaker")

local decoder = dfpwm.make_decoder()
local track = http.get("https://cdn.discordapp.com/attachments/1271481953962426432/1324048378732089385/586f95b09c116871.dfpwm?ex=678147a5&is=677ff625&hm=a1c7431ea0f795ce5a3de2a39a0b30b817b38fcccd278e5f9002491edb9b27db&")

while true do
	for chunk = track.read(15 * 1024) do
		local buffer = decoder(chunk)

		    while not speaker.playAudio(buffer) do
			os.pullEvent("speaker_audio_empty")
		end
	end
end
x
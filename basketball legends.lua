local Window = Library:New({Name = "Vexium Hub", Accent = Color3.fromRGB(255, 0, 255)})
 
local Main = Window:Page({Name = "Basketball Legends"})
 
local Main_Config = Main:Section({Name = "Main", Side = "Left"})
local Main_Script = Main:Section({Name = "Config", Side = "Right"})
 
 
Main_Config:Toggle({Name = "Aimbot", Default = false, Callback = function(Text)
	aimbotState = Text
end})
 
Main_Config:Toggle({Name = "Magnet", Default = false, Callback = function(Text)
	magnetState = Text
end})
 
Main_Config:Slider({Name = "Magnet Range", Minimum = 2, Maximum = 17, Default = 0, Decimals = 1, Callback = function(Text)
	magnetRange = Text
end})
 
 
Main_Script:Label({Name = "This GUI is only usable once,\n    so please set all values.", Middle = true})
 
 
Main_Script:Button({Name = "Apply Script", Callback = function ()
	Window:Fade()
	wait(0.5)
	print("DEBUG: callback work")
	checkForNil()
	Window:Unload()
 
end})
 
 
function checkForNil()
	if aimbotState or magnetState == nil then
		if aimbotState == nil then
			aimbotState = false
			print("* Changed aimbotState to false from nil")
 
		end
 
		if magnetState == nil then
			magnetState = false
			print("* Changed magnetState to false from nil")
 
		end
	end
	runScript()
end
 
function runScript()
	loadstring(game:HttpGet("https://vexiumhub.xyz/BL.lua", true))()
	wait(1)
	getgenv().FeaturesTable = {
    	["Aimbot"] = aimbotState,
    	["BallMagnet"] = {
        	["State"] = magnetState,
        	["Range"] = magnetRange	
		}
	}		
 
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Vexium Hub",
    	Text = "Your config for Basketball Legends has loaded!",
		Icon = "rbxassetid://5975697871",
    	Duration = 10,
    	Button1 = "Okay"
	})
 
	print(aimbotState, magnetState, magnetRange)
 
end
 
Window:Initialize()

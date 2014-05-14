module(..., package.seeall )



local localGroup

function new()

	local localGroup=display.newGroup();


	
	--background
	local MenuBG=display.newImage("menu02.png",8,0)

	localGroup:insert(MenuBG)


--	local buttons=display.newImage("buttons.png",227,260)
--	buttons.alpha=0.5
--	localGroup:insert(buttons)

	local but1=display.newImage("but1.png",227,260)
	localGroup:insert(but1)
	but1.alpha=0.1
	local but2=display.newImage("but2.png",393,260)
	localGroup:insert(but2)
	but2.alpha=0.1
--[[
]]--

local function onTouch(event)
	if event.phase=="ended" then
			local touchStart=display.newImage("touchstart.png",8,0)
			localGroup:insert(touchStart)
			timer.performWithDelay(50,function() 
			director:changeScene("Game","fade")	
			end,1)
			but1:removeEventListener("touch", onTouch)
	end
end



local function onTouch2(event)
	if event.phase=="ended" then
		local touchRules=display.newImage("touchrules.png",8,0)
		localGroup:insert(touchRules)
		timer.performWithDelay(50,function() 
		director:changeScene("instructions1","fade")
		end,1)
		but2:removeEventListener("touch", onTouch2)
	end
end





but1:addEventListener("touch",onTouch)
but2:addEventListener("touch",onTouch2)


return localGroup

end
	
	
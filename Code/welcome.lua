module(..., package.seeall )


display.setStatusBar(display.HiddenStatusBar)



function new()
	local localGroup=display.newGroup();
	
	--background
	local welcome=display.newImage("welcome.png",8,0)
	localGroup:insert(welcome)
	


function onTouch(event)
	if event.phase=="ended" then
			director:changeScene("Menu","fade")
	end
end



timer.performWithDelay(3000,function()
welcome:addEventListener("touch",onTouch)
end,1)

return localGroup

end
	
	
module(..., package.seeall )


display.setStatusBar(display.HiddenStatusBar)



function new()
	local localGroup=display.newGroup();
	
	--background

	local inst1=display.newImage("inst1.png",-10,5)
	localGroup:insert(inst1)

	


function onTouch(event)
	if event.phase=="ended" then
			director:changeScene("instructions2","moveFromRight")
	end
end




inst1:addEventListener("touch",onTouch)


return localGroup

end
	
	
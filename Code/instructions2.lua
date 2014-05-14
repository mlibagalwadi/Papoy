module(..., package.seeall )


display.setStatusBar(display.HiddenStatusBar)



function new()
	local localGroup=display.newGroup();
	
	--background

	local inst2=display.newImage("inst2.png",-10,5)
	--inst2:setReferencePoint(display.CenterReferencePoint)
	localGroup:insert(inst2)

	


function onTouch(event)
	if event.phase=="ended" then
			director:changeScene("Menu","moveFromRight")
	end
end




inst2:addEventListener("touch",onTouch)


return localGroup

end
	
	
module(..., package.seeall )

display.setStatusBar(display.HiddenStatusBar)

local physics = require("physics")

physics.start()

physics.setGravity( 0, 0)

--physics.setDrawMode("hybrid")



local localGroup

function new()

	--memory usage check
--[[]
]]--
	--




	local localGroup=display.newGroup();



local back=display.newImage("airport 1-01.png")

back:setReferencePoint(display.TopLeftReferencePoint)
back.x=-10
back.y=0
back.speed=5
localGroup:insert(back)

local back1=display.newImage("airport 1-01.png")

back1:setReferencePoint(display.TopLeftReferencePoint)
back1.x=1900
back1.y=0
back1.speed=5
localGroup:insert(back1)
--[[local foreground1=display.newImage("foreground_1.png")

foreground1:setReferencePoint(display.BottomLeftReferencePoint)
foreground1.x=0
foreground1.y=340
foreground1.speed=-2


local fore=display.newImage("foreground_2.png")

foreground2:setReferencePoint(display.BottomLeftReferencePoint)
foreground2.x=705
foreground2.y=340
foreground2.speed=-2
]]--



local belt=display.newImage("belt2.png")
belt.x=950
belt.y=160
belt.speed=5
localGroup:insert(belt)

local belt2=display.newImage("belt2.png")
belt2.x=2850
belt2.y=160
belt2.speed=5
localGroup:insert(belt2)


function scrollForward(self,event)
	if self.x<-1900 then
	self.x=1900
	else
	self.x=self.x-self.speed
	end
end



back.enterFrame=scrollForward
Runtime:addEventListener("enterFrame",back)
back1.enterFrame=scrollForward
Runtime:addEventListener("enterFrame",back1)
belt.enterFrame=scrollForward
Runtime:addEventListener("enterFrame",belt)
belt2.enterFrame=scrollForward
Runtime:addEventListener("enterFrame",belt2)


local sprite = require("sprite")



local physicsData = (require "shapedef").physicsData(1.0)
local physicsData1 = (require "shapedef1").physicsData(1.0)
local physicsData2 = (require "shapedef2").physicsData(1.0)
local physicsData3 = (require "shapedef3").physicsData(1.0)

local spriteSheet = sprite.newSpriteSheet("allmin.png", 100, 155)

local minionsSet = sprite.newSpriteSet(spriteSheet, 1, 5)
sprite.add(minionsSet, "running", 2, 3, 500, -2)
sprite.add(minionsSet, "jumping", 1, 1, 1000, 0)
sprite.add(minionsSet, "ducking", 5, 1, 1000, 1)



local minion = sprite.newSprite(minionsSet)
minion.x=60
minion.y=220
minion.gravity=-6
localGroup:insert(minion)

physics.addBody(minion,"dynamic",physicsData:get("walk"))
minion:prepare("running")
minion:play()



--for purple minion

	--run


--local spriteSheet2 = sprite.newSpriteSheet("minion-03.png", 174.3, 153)


local spriteSheet2 = sprite.newSpriteSheet("minion-03.png", 174.3, 153)



local minionsSet2 = sprite.newSpriteSet(spriteSheet2, 1, 5, 0)
sprite.add(minionsSet2, "running", 1, 5, 300,-2)
sprite.add(minionsSet2, "slide", 6, 1, 300,1)

local prun = sprite.newSprite(minionsSet2)
prun.x=600
prun.y=220
prun.isVisible=false
prun.isAlive=false
localGroup:insert(prun)
	--

	--jump

local spriteShee1 = sprite.newSpriteSheet("jump1.png", 144, 400)

local minionsSet3 = sprite.newSpriteSet(spriteShee1, 1, 6, 1)
sprite.add(minionsSet3, "somersault", 2, 5, 500,1)

local pjump = sprite.newSprite(minionsSet3)
pjump.x=80
pjump.y=110
pjump.isAlive=false
pjump.isVisible=false

localGroup:insert(pjump)

	--


--explosion sprite

--spriteSheet4 = sprite.newSpriteSheet("poof.png", 267.7, 250)

local spriteSheet4 = sprite.newSpriteSheet("Explosion.png", 118, 118)

local expSet = sprite.newSpriteSet(spriteSheet4, 1, 5)

sprite.add(expSet,"poof",1,5,200,1)
local explosion = sprite.newSprite(expSet)
explosion.isVisible=false
localGroup:insert(explosion)
--


local mode=0







--all variable definitions
local check=0

local speed=9

local banana=audio.loadSound("bababanana.mp3")
local bark=audio.loadSound("bark.mp3")

local score=0

local scoreText = display.newText("SCORE: "..score, 0, 0, "Ka-Boing!", 25)
scoreText:setReferencePoint(display.CenterLeftReferencePoint)
scoreText:setTextColor(0, 0, 0)
scoreText.x = 30
scoreText.y = 30
localGroup:insert(scoreText)

	local TimerText=display.newText("",(display.contentWidth/2)-10, 0, "Ka-Boing!", 50)
	TimerText.alpha=0
localGroup:insert(TimerText)







--/all variable definitions

local function yellowmode(event)
	mode=0
	TimerText.isVisible=false
	--physics.removeBody(prun)
			explosion.isAlive=false
		explosion.isVisible=false

	prun.isVisible=false
	prun.isAlive=false
	print(mode)
	speed=speed-4
	minion.x=60
--	minion.bodyType="dynamic"
	if prun.isVisible==false and pjump.isVisible==false then
		minion.isVisible=true
		minion.isAlive=true
	else
		prun.isVisible=false
		pjump.isVisible=false
	end
	
	physics.addBody(minion,"static",physicsData:get("walk"))
	minion:prepare("running")
	minion:play()

end


local potionCount=3


local potion=display.newImage("potion.png")
potion.x=500
potion.y=60
localGroup:insert(potion)

local PotionText=display.newText("",potion.x,potion.y-25,"Ka-Boing!",20)
PotionText:setTextColor(0,0,0)
PotionText.text=potionCount
localGroup:insert(PotionText)

local function purplemode(event)

	mode=1
	potionCount=potionCount-1
	if potionCount==1 then
		PotionText.text=(potionCount+1)
	elseif potionCount==-1 then
	PotionText.text=(potionCount+2)
	end

	if potionCount<-1 then
		potion:removeEventListener("touch", purplemode)
		potion.isVisible=false
		PotionText:removeSelf()
	end
		minion.isAlive=false
		minion.isVisible=false
		minion.x=-500
		physics.removeBody(minion)

		prun.x=60

		physics.addBody(prun,"static",physicsData2:get("runp"))

		prun.isAlive=true
		prun.isVisible=true
		prun:prepare("running")
		prun:play()
		--minion.bodyType="static"
		--physics.addBody(prun,"static",physicsData2:get("runp"))
			TimerText.isVisible=true

		local timeCounter=15
			local myTimer=timer.performWithDelay( 1000, function() 
			TimerText.alpha=1
			timeCounter=timeCounter-1
			TimerText.text=timeCounter
			TimerText:setTextColor(85, 26, 139)
			end, 15 )
		speed=speed+4
		print(mode)

		timer.performWithDelay(15000, function()
			prun.isVisible=false
			pjump.isVisible=false
			physics.removeBody(prun)
			yellowmode()
			end,1)
end


potion:addEventListener("touch", purplemode)





--[[apple=display.newImage("apple.png")
apple.x=150

function appleSpawn(self,event)

if back.x%20==0 then
apple.x=apple.x-20
apple.y=150
end
end

apple.enterFrame=appleSpawn
Runtime:addEventListener("enterFrame",apple)

]]--

--[[
local function scrollBelt(self,event)

	if self.x<-500 then
	self.x=500
	else
	self.x=self.x-self.speed
	end


end


]]--


local hmm=audio.loadSound("lalala.mp3")


function onTouch(event)
		if event.phase=="began" then
			if event.x<display.contentWidth/2 then
				if mode==0 then
					physics.removeBody(minion)
					minion.y=140
					--minion.y=minion.y-80
					
					minion:prepare("jumping")
					minion:play()
					physics.addBody(minion,"static",physicsData:get("jump"))
				else
					minion:pause()
					--physics.removeBody(minion)
					prun.isVisible=false
						if mode==0 then
							pjump.isVisible=false
							prun.isVisible=false
						end
					pjump.isVisible=true
					pjump:prepare("somersault")
					pjump:play()
				end
			elseif event.x>display.contentWidth/2 then
				if mode==0 then
					physics.removeBody(minion)
					minion:prepare("ducking")
					minion:play()
					physics.addBody(minion,"static",physicsData:get("duck"))
				else
					minion:pause()
					prun:prepare("slide")
					prun:play()
				end
					

					
			
			end
					
		elseif event.phase=="ended" then
			if event.x<display.contentWidth/2 then
				if mode==0 then
					if prun.isVisible==true or pjump.isVisible==true then
						prun.isVisible=false
						pjump.isVisible=false
					--	minion.y=minion.y-80
					end
					physics.removeBody(minion)
					physics.addBody(minion,"static",physicsData:get("walk"))
					minion:prepare("running")
					minion:play()
					minion.y=220
					--minion.y=minion.y+80
				else

					timer.performWithDelay(700,function()
					pjump.isVisible=false
					if minion.isVisible==false then
						prun.isVisible=true
						prun:prepare("running")
						prun:play()
					end
					end, 1)
					if mode==0 then
						prun.isVisible=false
					end
				end
			else
				if mode==0 then
					physics.removeBody(minion)
					physics.addBody(minion,"static",physicsData:get("walk"))
					minion:prepare("running")
					minion:play()
				else
					prun:prepare("running")
					prun:play()
				end
			end
		end


end


Runtime:addEventListener("touch", onTouch)



function scrollForward1(self,event)
	if self.x<-100 then
		--physics.removeBody(self)
		--self.bodyType="static"
		--self.isAlive=false
		--self.isVisible=false
		--self.x=600
		self:removeSelf()
		Runtime:removeEventListener("enterFrame",self)
		
	
	else
		self.x=self.x-speed
		
	end
end

local pos=0


local function Spawn(event)


	if check~=1 then
		

		--luggage definitions


		local toplight=display.newImage("toplight.png")
		toplight.x=800
		toplight.isAlive=false
		physics.addBody(toplight,"static",physicsData:get("toplight"))
		toplight.density=100
		localGroup:insert(toplight)

		--toplight.speed=7
		local toplight1=display.newImage("toplight.png")
		toplight1.x=800
		toplight1.isAlive=false
		localGroup:insert(toplight1)
		--toplight1.speed=7
		physics.addBody(toplight1,"static",physicsData:get("toplight"))
		toplight1.density=100
		local bag1=display.newImage("luggage1.png")
		--bag1.speed=7
		bag1.x=-150
		bag1.y=800
		bag1.isAlive=false
		physics.addBody(bag1,"static",physicsData:get("luggage1"))
		bag1.density=100
		localGroup:insert(bag1)

		local bag2=display.newImage("luggage2.png")
		--bag2.speed=7
		bag2.y=800
		bag2.x=-150

		bag2.isAlive=false
		physics.addBody(bag2,"static",physicsData3:get("luggage2"))
		bag2.density=100
		localGroup:insert(bag2)

		local bag3=display.newImage("luggage3.png")
		--bag3.y=245
		--bag3.speed=7
		bag3.x=-150
		bag3.y=800

		bag3.isAlive=false
		physics.addBody(bag3,"static",physicsData:get("luggage3"))
		bag3.density=100
		localGroup:insert(bag3)

		local bag4=display.newImage("luggage4.png")
		--bag4.speed=7
		bag4.x=-150
		bag4.y=800
		bag4.isAlive=false
		physics.addBody(bag4,"static",physicsData1:get("luggage4"))
		bag4.density=100
		localGroup:insert(bag4)

		local bag5=display.newImage("luggage5.png")
		--bag5.speed=7
		bag5.y=800
		bag5.x=-150
		bag5.isAlive=false
		physics.addBody(bag5,"static",physicsData:get("luggage5"))
		bag5.density=100
		localGroup:insert(bag5)

		local bag6=display.newImage("luggage6.png")
		--bag6.speed=7
		bag6.x=-150
		bag6.y=800
		bag6.isAlive=false
		physics.addBody(bag6,"static",physicsData3:get("luggage6"))
		bag6.density=100
		localGroup:insert(bag6)

		local bag7=display.newImage("luggage7.png")
		--bag7.speed=7
		bag7.x=-150
		bag7.y=800
		bag7.isAlive=false
		physics.addBody(bag7,"static",physicsData1:get("luggage7"))
		bag7.density=100
		localGroup:insert(bag7)

		local bag8=display.newImage("luggage8.png")
		--bag8.speed=7
		bag8.y=800
		bag8.x=-150
		bag8.isAlive=false
		physics.addBody(bag8,"static",physicsData:get("luggage8"))
		bag8.density=100
		localGroup:insert(bag8)


		local disp=display.newImage("displays.png")
		disp.x=800
		physics.addBody(disp,"static",physicsData2:get("displays"))
		localGroup:insert(disp)


		local clock=display.newImage("clock.png")
		clock.x=800
		physics.addBody(clock,"static",physicsData2:get("clock"))
		localGroup:insert(clock)

		local dog=display.newImage("doug.png")
		dog.x=800
		dog.y=-150
		physics.addBody(dog,"static",physicsData2:get("doug"))
		localGroup:insert(dog)
		
		collectgarbage("collect")

		print("mem "..collectgarbage("count"))

		luggage={bag1,bag2,bag3,bag4,bag5,bag6,bag7,bag8,toplight1,toplight,disp,clock,dog}


		--


		score=score+50
		
		local function updateScore(event)
			scoreText.text=("SCORE: "..score)
		end
		if speed<10 then
		timer.performWithDelay(1000,updateScore,1)
		else
		timer.performWithDelay(500,updateScore,1)
		end
		--print(score)
		if score%700==0 then
			audio.play(hmm)
		end

		index=math.random(1,13)
		luggage[index].x=400
		if index==9 or index==10 or index==11 then
			pos=1 --top
			luggage[index].y=90
		elseif index==12 then
			pos=1--top
			luggage[index].y=100	
		else
			pos=0
			if index==13 then
				audio.play(bark)
			end
			luggage[index].y=250
		end
		speed=speed+0.05
		--print(speed)
		luggage[index].bodyType="dynamic"
		luggage[index].isAlive=true
		luggage[index].isVisible=true
		--audio.play(banana)
		luggage[index].enterFrame=scrollForward1
		Runtime:addEventListener("enterFrame",luggage[index])
	else
		physics.removeBody(luggage[index])
		Runtime:removeEventListener("enterFrame",luggage[index])
		timer.cancel(event.source)
	end
end



if speed<20 then
timer.performWithDelay(1500,Spawn,0)
end


	GameOver=display.newImage("Game over.png",display.contentWidth/2-200,display.contentHeight/2-100)
	GameOver.isVisible=false
	localGroup:insert(GameOver)



local function onCollision(event)
	if event.phase=="began" then
		if event.object1==minion then
		prun.isVisible=false
	--	print("collision")
		back.speed=0
		back1.speed=0
		belt.speed=0
		belt2.speed=0
		speed=0
		check=1

		elseif event.object1==prun then
--			luggage[index].bodyType="static"
		event.object2.isVisible=false
		explosion.isVisible=true
		
		if pos==1 then
		explosion.x=150
		explosion.y=100
		else
		explosion.x=150
		explosion.y=250
		end
--		explosion.isVisible=true
		explosion:prepare("poof")
		explosion:play()
		
		--event.object2.isAlive=false
		--event.object2.isVisible=false

		--	timer.performWithDelay(25,function()
		--	luggage[index].bodyType="static"
		--	end,1)
		
		timer.performWithDelay(25,function()
			if event.object2.bodyType=="dynamic" then
				physics.removeBody(event.object2)
			end
		end,1)

		timer.performWithDelay(600,function()
			explosion.isVisible=false
		end,1)
		check=0
		end
	elseif event.phase=="ended" then
		if mode==0 then

		timer.performWithDelay(1000,function()
		if minion.isVisible==true then
			GameOver.isVisible=true
		end

		--GameOver.isVisible=true
		--GameOver.isAlive=true
		
		end)
		back.speed=0
		back1.speed=0
		belt.speed=0
		belt2.speed=0
		speed=0
		check=1

			
		Runtime:removeEventListener("enterFrame",back)
		Runtime:removeEventListener("enterFrame",back1)
		Runtime:removeEventListener("enterFrame",belt)
		Runtime:removeEventListener("enterFrame",belt2)
		
		----------------------------------------------------------potion:removeEventListener("touch", purplemode)
		potion.isVisible=false
		PotionText.isVisible=false
		
	
		function GOver(event)
			if event.phase=="ended" then
			GameOver.isVisible=false
			director:changeScene("Game","fade")
			end
		end
		Runtime:removeEventListener("collision", onCollision)
		Runtime:removeEventListener("touch", onTouch)
		GameOver:addEventListener("touch", GOver)

		else--if mode==1 then


		explosion.x=900
		back.speed=5
		back1.speed=5
		belt.speed=5
		belt2.speed=5
		if minion.isVisible==true then
		speed=-7
		end
	--	timer.performWithDelay(1,function() 
			
		--	end,1)
		check=0
 		--print("back speed :"..back.speed)
		end
	end


--[[
	back.speed=5
	back1.speed=5
	belt.speed=5
	belt2.speed=5
	speed=7
]]--
	end




Runtime:addEventListener( "collision", onCollision )


return localGroup

end
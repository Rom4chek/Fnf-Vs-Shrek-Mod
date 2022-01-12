function Resetti()
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.6, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.6, 'setDefault')
		end
        end

function setMiddleScroll()
    for i = 4, 7 do 
        tweenPosXAngle(i, _G['defaultStrum'..i..'X'] - 275,getActorAngle(i) + 360, 0.6, 'setDefault')
    end
    for i=0,3 do 
        tweenFadeOut(i,0,2)
    end
end

   function FadeAI()
        for i=0,3 do 
		 tweenFadeOut(i,1,1)
    end
end

function start (song)
      print("Succesfully play our song (tiny mad dad ayo)")
end

function update (elapsed)
      local currentBeat = (songPos / 1000)*(bpm/60)
           if curStep >= 384 and curStep < 576 then
		for i=0,7 do
                   setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0)), i)
                   setActorY(_G['defaultStrum'..i..'Y'] + 10,i)
		end
           end 
           if curStep >= 576 and curStep < 768 then
                for i=0,7 do
                        setActorX(_G['defaultStrum'..i..'X'] + 9 * math.sin((currentBeat + i*0.25) * 9), i)
	                setActorY(_G['defaultStrum'..i..'Y'] + 9 * math.cos((currentBeat + i*0.25) * 9), i)
                end
           end
          if curStep >= 960 and curStep < 1128 then
                for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] + 300 * math.sin((currentBeat + i*0) * 1.75) + 350, i)
		end
		for i=4,7 do
		 	setActorX(_G['defaultStrum'..i..'X'] - 300 * math.sin((currentBeat + i*0) * 1.75) - 275, i)
                end
           end
            if curStep >= 1152 and curStep < 1344 then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
		end
           end 
end


function stepHit (step)
     if step == 576 then
               Resetti()
     end
     if step == 768 then
              Resetti()
     end
     if step == 960 then
               showOnlyStrums = true
     end
     if step == 1128 then
              Resetti()
     end
     if step == 1152 then
              showOnlyStrums = false
     end
     if step == 1344 then
               Resetti()

     end
     if step == 1512 then
               setMiddleScroll()
     end

     if step == 1920 then
               FadeAI()
               Resetti()
     end
end
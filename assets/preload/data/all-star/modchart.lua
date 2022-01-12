function Resetti()
		for i=0,7 do
			tweenPosXAngle(i, _G['defaultStrum'..i..'X'], 0, 0.6, 'setDefault')
			tweenPosYAngle(i, _G['defaultStrum'..i..'Y'], 0, 0.6, 'setDefault')
		end
           end

function start (song)
      print("Succesfully play our song (all star)")
end

function update (elapsed)
      local currentBeat = (songPos / 1000)*(bpm/60)
           if curStep >= 512 and curStep < 704 then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.25) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.cos((currentBeat + i*0.25) * math.pi), i)
		end
           end 
           if curStep >= 576 and curStep < 704 then
                for i=0,7 do
                        setActorX(_G['defaultStrum'..i..'X'] + 9 * math.sin((currentBeat + i*0.25) * 9), i)
	                setActorY(_G['defaultStrum'..i..'Y'] + 9 * math.cos((currentBeat + i*0.25) * 9), i)
                end
           end
            if curStep >= 960 and curStep < 1088 then
		for i=0,3 do
			setActorX(_G['defaultStrum'..i..'X'] + 300 * math.sin((currentBeat + i*0) * 1.75) + 350, i)
		end
		for i=4,7 do
		 	setActorX(_G['defaultStrum'..i..'X'] - 300 * math.sin((currentBeat + i*0) * 1.75) - 275, i)
                end
           end
end


function stepHit (step)
     if step == 576 then
               showOnlyStrums = true
               Resetti()
     end
     if step == 704 then
              showOnlyStrums = false
              Resetti()
     end
     if step == 960 then
              showOnlyStrums = true
     end
     if step == 1088 then
               showOnlyStrums = false
               Resetti()
     end
end
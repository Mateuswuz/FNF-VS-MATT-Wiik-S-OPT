--cam stuff variables

local xx = 504; -- Code to change the position of the camera to the left or right for your opponent, Less = Left (They can be negative numbers), More = Right
local yy = 700.5; -- Code to change the position of the camera up or down for the enemy Less = Down (They can be negative numbers), More = Up
local xx2 = 852.5; -- Same code as above, but for boyfriend left, right
local yy2 = 738.5; -- Same code as above, but for boyfriend up, down
local xx3 = 0; -- Same code as above, but for girlfriend left, right
local yy3 = 0; -- Same code as above, but for girlfriend, up, down
local ofs = 15; -- Code to adjust the intensity with which the camera moves, the more numbers, the more intense, and the fewer numbers, less intense
local followchars = true; -- This code is necessary for the script to work, don't even think about deleting it!
local del = 0;
local del2 = 0;

local camMove = false

function onBeatHit()
    -- duo sing cam zoom
    if 
    curBeat == 184 or
    curBeat == 313 or
    curBeat == 504 or
    curBeat == 632 or
    curBeat == 648 or
    curBeat == 664 or
    curBeat == 680 or
    curBeat == 696 then
        setProperty('defaultCamZoom', 0.75)
        triggerEvent('Camera Follow Pos', '678.25', '719.5')
    elseif
    curBeat == 184+8 or
    curBeat == 313+7 or
    curBeat == 504+8 or
    curBeat == 632+8 or
    curBeat == 648+8 or
    curBeat == 664+8 or
    curBeat == 680+8 or
    curBeat == 696+8 then
        setProperty('defaultCamZoom', 0.8)
        triggerEvent('Camera Follow Pos', '', '')
    end

    --spam/that one part bars
    if
    curBeat == 184+8 or
    curBeat == 313+7 or
    curBeat == 504+8 or
    curBeat == 632+8 then
        barsIn()
    elseif
    curBeat == 184+72 or
    curBeat == 312+72 or
    curBeat == 504+72 or
    curBeat == 632+72 then
        barsOut()
    end

    --game end
    if curBeat == 768 then
        playAnim('fini', 'finished', false)
        setProperty('fini.visible', true)
        hudGone()
    end
end

function barsIn()
    cameraFlash('hud', 'FFFFFF', 0.6)
    camMove = true
    doTweenY('barUin', 'barU', 0, 1, 'cubeOut')
    doTweenY('barDin', 'barD', 644, 1, 'cubeOut')
end

function barsOut()
    camMove = false
    cameraSetTarget('dad')
    triggerEvent('Camera Follow Pos','','')
    doTweenY('barUout', 'barU', 0-80, 1, 'cubeOut')
    doTweenY('barDout', 'barD', 644+80, 1, 'cubeOut')
end

function hudGone()
    doTweenAlpha('hBar', 'healthBar', 0, 0.3, 'cubeOut')
    doTweenAlpha('sTxt', 'scoreTxt', 0, 0.3, 'cubeOut')
    doTweenAlpha('tTxt', 'timeTxt', 0, 0.3, 'cubeOut')
    doTweenAlpha('tBar', 'timeBar', 0, 0.3, 'cubeOut')
    doTweenAlpha('i1', 'iconP1', 0, 0.3, 'cubeOut')
    doTweenAlpha('i2', 'iconP2', 0, 0.3, 'cubeOut')

    noteTweenAlpha('n0', '0', 0, 0.3, 'cubeOut')
    noteTweenAlpha('n1', '1', 0, 0.3, 'cubeOut')
    noteTweenAlpha('n2', '2', 0, 0.3, 'cubeOut')
    noteTweenAlpha('n3', '3', 0, 0.3, 'cubeOut')
    noteTweenAlpha('n4', '4', 0, 0.3, 'cubeOut')
    noteTweenAlpha('n5', '5', 0, 0.3, 'cubeOut')
    noteTweenAlpha('n6', '6', 0, 0.3, 'cubeOut')
    noteTweenAlpha('n7', '7', 0, 0.3, 'cubeOut')
end

-- old cam script by Washo789, not learning how to lol..
                
function onUpdate(id, direction, note_type, sustained) -- The Main Code
    if del > 0 then
        del = del - 1
    end
    if del2 > 0 then
        del2 = del2 - 1
    end
    if followchars == true and camMove == true then
        if mustHitSection == false then -- Code for the camera to follow the poses of your opponent
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if gfSection == true then -- The camera follows GF when she sings, only when the "GF Section" option in the chart editor is activated. 
                if getProperty('gf.animation.curAnim.name') == 'singLEFT' then -- Credits to Serebeat and company for their Slaybells mod,
                    triggerEvent('Camera Follow Pos',xx3-ofs,yy3)              -- That's where I got the gf code from.
                end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                    triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
                end
                if getProperty('gf.animation.curAnim.name') == 'singUP' then
                    triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                    triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'idle-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3)
                end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT-alt' then
                    triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
                end
                if getProperty('gf.animation.curAnim.name') == 'singUP-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'idle-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3)
                end
            end
        else
                 -- Code for the camera to follow the poses of boyfriend
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
        if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        --do nothing, i control that >:)
    end
    
end
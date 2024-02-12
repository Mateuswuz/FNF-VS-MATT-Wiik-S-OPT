function onCreatePost()
	setProperty('gf.visible', false)

  makeLuaSprite('wallbg', 'matt/wallwindow', -402, 12)
  setScrollFactor('wallbg', 0.8, 0.8)
  scaleObject('wallbg', 2.5,2.5)
  addLuaSprite('wallbg')

  makeLuaSprite('floor', 'matt/floor', -824, 637)
  addLuaSprite('floor')
  scaleObject('floor', 2,2)

  makeLuaSprite('wall', 'matt/wall', -859, 59)
  setScrollFactor('wall', 0.93, 1)
  addLuaSprite('wall')
  scaleObject('wall', 2,2)

  makeLuaSprite('ring', 'matt/thering', -228, 216)
  addLuaSprite('ring')
  scaleObject('ring', 2,2)

  makeLuaSprite('bfshad', 'matt/bfshadow', 823, 915)
  setProperty('bfshad.alpha', 0.17)
  addLuaSprite('bfshad')

  makeLuaSprite('mattsshad', 'matt/mattsshadow', 225, 898)
  setProperty('mattsshad.alpha', 0.17)
  addLuaSprite('mattsshad')

  makeLuaSprite('light', 'matt/light', -639, -185)
  scaleObject('light', 2,2)
setBlendMode('light', 'add')
  setProperty('light.alpha', 0.4)
  addLuaSprite('light', true)

  makeLuaSprite('vig', 'matt/vig', -359, 115)
  setBlendMode('vig', 'multiply')
  setScrollFactor('vig', 0.5, 1)
  scaleObject('vig', 2,2)
  setProperty('vig.alpha', 0.65)
  addLuaSprite('vig', true)

  makeAnimatedLuaSprite('fini', 'matt/finished', 0, 0)
  addAnimationByPrefix('fini', 'finished', 'finishedPlay', 60, false)
  setObjectCamera('fini', 'hud')
  addLuaSprite('fini', true)
  setProperty('fini.visible', false)
  screenCenter('fini', 'x')
  screenCenter('fini', 'y')

  makeLuaSprite('hudvig', 'matt/hudvig', 0, 0)
  setProperty('hudvig.alpha', 0.3)
  setObjectCamera('hudvig', 'hud')
  addLuaSprite('hudvig', false)

  makeLuaSprite('barU', 'matt/bar', 0, 0)
  makeLuaSprite('barD', 'matt/bar', 0, 644)
  setObjectCamera('barU', 'hud')
  setObjectCamera('barD', 'hud')
  addLuaSprite('barU')
  addLuaSprite('barD')
  setProperty('barU.y', 0-80)
  setProperty('barD.y', 644+80)

  close()

end
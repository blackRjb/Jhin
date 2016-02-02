if GetObjectName(GetMyHero()) ~= "Jhin" then return end

require('Inspired')
require('DeftLib')

local JhinMenu = MenuConfig("Jhin", "jhin")

JhinMenu:Menu("Combo", "Combo")
JhinMenu.Combo:Boolean("Q", "Use Q", true)
JhinMenu.Combo:Boolean("W", "Use W", true)
JhinMenu.Combo:Boolean("E", "Use E", true)
JhinMenu.Combo:Slider("Mana", "If Mana % >", 30, 0, 75, 1)

JhinMenu:Menu("Harass", "Harass")
JhinMenu.Harass:Boolean("Q", "Use Q", true)
JhinMenu.Harass:Boolean("W", "Use W", true)
JhinMenu.Harass:Boolean("E", "Use E", False)
JhinMenu.Harass:Slider("Mana", "if mana >", 30, 0, 75, 1)

JhinMenu:Menu("Ksecure", "Ksecure")
JhinMenu.Ksecure:Boolean("Q", "Use Q", true)
jhinMenu.Ksecure:Boolean("W", "Use W", true)
JhinMenu.Ksecure:Boolean("E", "Use E", false)
JhinMenu.Ksecure:Boolean("R", "Use R", true)

JhinMenu:Menu("Drawings", "Drawings")
JhinMenu.Drawings:Boolean("Q", "Draw Q Range", true)
JhinMenu.Drawings:Boolean("W", "Draw W Range", true)
JhinMenu.Drawings:Boolean("E", "Draw E Range", false)
JhinMenu.Drawings:Boolean("R", "Draw R Range", true)
JhinMenu.Drawings:Boolean("DrawDMG", "Draw Damage", true)

JhinMenu:Menu("Misc", "Misc")
if Ignite ~= nil then JhinMenu.Misc:Boolean("AutoIgnite", "Auto Ignite", True) end

------Drawing range and damage
OnDraw(function(myHero)
local pos = GetOrigin(myHero)

if JhinMenu.Drawings.Q:Value() then DrawCircle(pos,1150,1,25,GoS.Pink) end
if JhinMenu.Drawings.W:Value() then DrawCircle(pos,1000,1,25,GoS.Blue) end
if JhinMenu.Drawings.R:Value() then DrawCircle(pos,1450,1,25,GoS.Green) end

if mainMenu.Drawings.DrawDMG:Value() then
local target = GetCurrentTarget()
	if CanUseSpell(myHeroQWER)== READY then 
	  DrawDmgOverHpBar(target,GetCurrentHP(target),DPS,0,0xff00ff00)
  end
end

end)

----
	  

  

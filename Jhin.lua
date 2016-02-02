if GetObjectName(GetMyHero()) ~= "Jhin" then return end

require('Inspired')
require('DeftLib')

local JhinMenu = MenuConfig("Jhin", "Jhin")

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
JhinMenu.Ksecure:Boolean("W", "Use W", true)
JhinMenu.Ksecure:Boolean("E", "Use E", false)
JhinMenu.Ksecure:Boolean("R", "Use R", true)

JhinMenu:Menu("Drawings", "Drawings")
JhinMenu.Drawings:Boolean("Q", "Draw Q Range", true)
JhinMenu.Drawings:Boolean("W", "Draw W Range", true)
JhinMenu.Drawings:Boolean("E", "Draw E Range", false)
JhinMenu.Drawings:Boolean("R", "Draw R Range", true)
JhinMenu.Drawings:Boolean("DrawDmg", "Draw Damage", true)

if Ignite ~= nil then
JhinMenu:Menu("Misc", "Misc")
JhinMenu.Misc:Boolean("AutoIgnite", "Auto Ignite", true) 
JhinMenu.Misc:Boolean("AutoHeal", "Auto Heal", true)
end

------Drawing range and damage
OnDraw(function(myHero)
local pos = GetOrigin(myHero)

if JhinMenu.Drawings.Q:Value() then 
 DrawCircle(pos,1150,1,25,GoS.Pink) 
end

if JhinMenu.Drawings.W:Value() then 
 DrawCircle(pos,1000,1,25,GoS.Blue) 
end

if JhinMenu.Drawings.R:Value() then 
 DrawCircle(pos,1450,1,25,GoS.Green) 
end

if JhinMenu.Drawings.DrawDmg:Value() then
local target = GetCurrentTarget()
	if CanUseSpell("Q")== READY then 
	  DrawDmgOverHpBar(target,GetCurrentHP(target),DPS,0,0xff00ff00)
	end
	if CanUseSpell("W")== READT then
	  DrawDmgOverHpBar(target,GetCurrentHP(target),DPS,0,0xff00ff00)
	end
	if CanUseSpell("E")== READY then
	  DrawDmgOverHpBar(target,GetCurrentHP(target),DPS,0,0xff00ff00)
	end
        if CanUseSpell("R")== READY then
          DrawDmgOverHpBar(target,GetCurrentHP(target),DPS,0,0xff00ff00)
        end
end

end)

----MISC IGNITE

for i,enemy in pairs(GetEnemyHeroes()) do
   	
        if Ignite and JhinMenu.Misc.AutoIgnite:Value() then
          if IsReady(Ignite) and 20*GetLevel(myHero)+50 > GetCurrentHP(enemy)+GetDmgShield(enemy)+GetHPRegen(enemy)*3 and ValidTarget(enemy, 600) then
          CastTargetSpell(enemy, Ignite)
          end
        end

----->Auto Heal Soon
 -----COMBO
 
 OnTick(function(myHero)
    local target = GetCurrentTarget()
    local Qtarget = target1:Gettarget()
    local Wtarget = target2:GetTarget()
    local Etarget = target3:GetTarget()
    local Rtarget = target4:GetTarget()
    
if IsReady(_Q) and QReady and ValidTarget(target, 600) and AsheMenu.Combo.Q:Value() then
 CastSpell(_Q,Qtarget)
end
						
if IsReady(_W) and WReady and ValidTarget(target, 600) and JhinMenu.Combo.W:Value() then
 Cast(_W,Wtarget)
end
						
if IsReady(_E) and EReady and ValidTarget(target, 2000) and GetPercentHP(Rtarget) <= 50 and AsheMenu.Combo.R:Value() then
 Cast(_E,Etarget)
end

end)

 -----HARASS
 -----KSECURE

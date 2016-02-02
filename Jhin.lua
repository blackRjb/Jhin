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
JhinMenu.Drawings:Boolean("E", "Draw E Range", true)
JhinMenu.Drawings:Boolean("R", "Draw R Range", false)
JhinMenu.Drawings:Boolean("Q", "Draw Q% Dmg", true)
JhinMenu.Drawings:Boolean("W", "Draw W% Dmg", true)
JhinMenu.Drawings:Boolean("E", "Draw E% Dmg", false)
JhinMenu.Drawings:Boolean("R", "Draw R% Dmg", true)

JhinMenu:Menu("Misc", "Misc"
if Ignite ~= nil then JhinMenu.Misc:Boolean("AutoIgnite", "Auto Ignite", True) end

/* 

Script name: RPG MO - All in One Bot
Made by: FloowSnaake
Autohotkey version: v1.1.23.00
Tested on: Windows 7 64 Bit Ultimate and Windows 8 32 Bit
Started working Date: 12/11/2015
 
For more info:
https://github.com/floowsnaake/RPG-MO---All-in-one-Bot
 
 bugs list:
 (x) 1. The url under the youtubevideo links to the wrong github page
 (x) 2. In the i.imgur file you posted in the ahk Forum is your ingame username still visible. 

3. Sometimes the character moves a bit strange and messes the whole pattern up, but maybe (probably) I have clicked somewhere and am at fault here.

3.5. It is intended that I need to click the “start bot” button every time my inventory is full? Haven’t seen an automated return process in your code and I do not know if it is even possible for the script to detect if the inventory is full.
4. When you start the script it attaches itself to the client, but hides the bottom (where the start/stop button etc are), if you rescale the client you can't click on the gui anymore.
5. Your script counts for every run 39 slots for full inventory, but if you have a pet it’s 38 slots + pet inventory
6. Maybe uncheck the announce trade
7. You should mention the start-coordinates somewhere or start at the chest (would not work if 3.5 is true)
8. Selling is done through clicks? However as long as the start position of the mouse is not correct the clicks are futile (need the materials for the other skills anyway and selling it on the market manual is no big deal so it doesn’t matter that much to me)
9. Do you prefer the feedback here or on any other side??

*/
 
IF NOT A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%"
   ExitApp
}
 
;   #SingleInstance force
   SetWorkingDir, %A_ScriptDir%
 
 
   CoordMode, Mouse, client
   CoordMode, Pixel, client
   CoordMode, Tooltip, client
 
   DetectHiddenText, On
   OnExit, Quit
 
    Blank =
    hid = 0
    Wood = 0
    Sand = 0
    Fish = 0
    Cook = 0
   mine = 0
   
   Global hid
   Global price
   Global Funcy_Price
   Global Checkt
   Global Petbox
   Global Debug_Mod
   Global Alarm
   Global Drop_Crystal
   Global SandC 
   Global SandS
   Global total
   Global loops
   Global XP
   Global Selling_time
   Global loops
   Global Fast
   Global Normal
   Global Slow
   Global Anounce_Sell
   Global Runs
   Global Account
   Global Blank
   Global Game_Path_Dir
   Global Tree_type
   Global Tree_type2
   Global Sand
   Global Wood
   Global Fish
   Global Cook
   GLobal Fight
   Global mine
   
   IfExist,RPG MO Bot.ini
   {
      FileReadLine,Read_Acc,RPG MO Bot.ini,1
      FileReadLine,Read_GamePath,RPG MO Bot.ini,2
      FileReadLine,Read_StartKey,RPG MO Bot.ini,3
      FileReadLine,Read_HideKey,RPG MO Bot.ini,4
      FileReadLine,Read_Steam,RPG MO Bot.ini,5
      FileReadLine,Read_Key_Movment,RPG MO Bot.ini,6
      FileReadLine,Read_Click_Movment,RPG MO Bot.ini,7
      
      Hotkey,%Read_StartKey%,Botkey
       Hotkey,%Read_HideKey%,Hidekey
 
      Account = %Read_Acc%
      Game_Path_Dir = %Read_GamePath%
      
      IF (Read_Steam = 1)
      {
       Original_Title = RPG MO - Early Access
       Procces = nw.exe
      }
      
      IF (Read_Steam = 0)
      {
       Original_Title = RPG MO - Web Browser Game
       Procces = RPG MO.exe
      }
      
   }
 
   IfNOTExist,RPG MO Bot.ini
   {
      Gui, Start: Add, Text, w110 h20,Account
      Gui, Start: Add, Edit, w100 h20 vAcc, Account name
 
      Gui, Start: Add, Text, w110 h20 ,Bot Start Hotkey:
      Gui, Start: Add, Hotkey, w70 h20 vStartKey,^T
 
      Gui, Start: Add, Text, w110 h20 ,Bot Hide Hotkey:
      Gui, Start: Add, Hotkey, w70 h20 vHideKey,F1
 
      Gui, Start: Add, Text, w110 h20,RPG MO Path
      Gui, Start: Add, Edit, w100 h20 vGame_Path,
      Gui, Start: Add, Button,gBrowse,Browse
      Gui, Start: Add, Checkbox,vSteam,Steam version
      Gui, Start: Add, Text, w110 h20,Movment Style:
      Gui, Start: Add, Radio, Checked vKey_Movment,Key
      Gui, Start: Add, Radio, vClick_Movment,Click
      Gui, Start: Add, Button,gsave, Save
 
      Gui, Start: Show,, Settings
      return
 
      save:
      Gui, Start: Submit
      FileAppend,%Acc%`n%Game%`n%StartKey%`n%HideKey%`n%Steam%`n%Key_Movment%`n%Click_Movment%,RPG MO Bot.ini
      Reload
      return
 
      Browse:
      FileSelectFile, Game, 3, , Select RPG MO exe, RPG MO Client (*.exe)
      if Game =
      MsgBox,You user didn't select the game!
      else
         GuiControl,,Game_Path,%Game%
      return
   }
 
Menu_Screen:
Gui, Select: +AlwaysOnTop
 
;Gui, Select: Add,Text,,Combat skills
;Gui, Select: Add,Button,H30,Auto Fight
;Gui, Select: Add,Button,H30,Auto Fight (Magic)
 
Gui, Select: Add,Text,ym,Bot Menu
Gui, Select: Add,Button,gsand,Sand Digging (Revel)
Gui, Select: Add,Button,gwood,Woodcutting
Gui, Select: Add,Button,gfish,Fishing
Gui, Select: Add,Button,vmin gmine,Mining
 
 Gui, Select: Add,Button,gSettings,Settings
 
GuiControl, Select:Disable,min
 
;Gui, Select: Add,Button,H30,Farming
 
;Gui, Select: Add,Text,ym,Crafting skills
;Gui, Select: Add,Button,H30,Forging
;Gui, Select: Add,Button,H30,Jewelry
;Gui, Select: Add,Button,H30,Carpentry
;Gui, Select: Add,Button,H30,Cooking
;Gui, Select: Add,Button,H30,Alchemy
;Gui, Select: Add,Button,H30,Fighting
;Gui, Select: Add,Button,H30,Breeding
 
Gui,Select: Show, W140 ,Bot Script select Menu
return
 
Wood:
{
 Wood = 1 
 Gui, Select: Submit
 
Process, Exist, %Procces%
IF !errorlevel=1
{
Run, %Game_Path_Dir%
}
 
WinWait,%Original_Title%
WinMove,%Original_Title%,,,,906,705
WinSet, Style, -0x30000,%Original_Title%
 
Game_Title = WoodCutting Bot
WinSetTitle,%Original_Title%,,%Game_Title%
Sleep, 500
WinActivate,%Game_Title%
WinWaitActive,%Game_Title%
 
Gui, 1:New, +LastFound -Caption +AlwaysOnTop
Gui, Margin, 0, 0
 
Gui Add, Text, x10 y6 w52 h13 , Tree Type:
Gui Add, DropDownList, x8 y24 w120 vTree_type, Fir|Cactus|Oak|Willow|Maple|Spirit|Blue Palm|Magic Oak
Gui Add, CheckBox, x224 y24 w90 h20 vDebug_Mod, Debug Mode
Gui Add, CheckBox, x144 y24 w70 h20 vPetbox, Have Pet
Gui Add, CheckBox, x328 y24 w110 h20 vDrop_Crystal, Alarm on Capatcha
Gui Add, Text, x448 y24 w110 h20 , Wood Sell Price:
Gui Add, Edit, x528 y24 w30 h20 vprice, 200
Gui Add, Text, x752 y24 w99 h20 , Sell Wood every run:
Gui Add, Edit, x856 y24 w30 h20 vSelling_time, 20
Gui Add, CheckBox, x568 y24 w170 h20 Checked  vAnounce_Sell, Announce selling in Trade Chat
Gui, Add, ListView,grid  x8 y56 w850 h62 ,Account|Runs|Status|Wood Cut|Profit|XP Gained
 
LV_ModifyCol(1, 100) , LV_ModifyCol(2, 40) , LV_ModifyCol(3, 255) , LV_ModifyCol(4, 85) , LV_ModifyCol(5, 70) , LV_ModifyCol(6,80), LV_Add(1,"","","","","",""), LV_Modify(1,,Account,0,"Not Started",0,0,0)
 
Gui Add, Button, x8 y136 w90 h23 gStart_Bot, Start/Stop
Gui Add, Button, x130 y136 w90 h23 gMenu, Script Menu
 
Gui Add, Link, x226 y136 w71 h13, <a href="https://autohotkey.com/boards/viewtopic.php?f=19&t=13323">Bot Homepage</a>
 
Gui Add, Link, x416 y136 w100 h13, <a href="http://rpg-mo.wikia.com/wiki/Woodcutting">Woodcutting Wiki</a>
 
GuiControl,Choose,Tree_type,Fir
SetParentByClass("Chrome_WidgetWin_0", 1)
Gui Show, x0 y500 w967 h172, 1
WinActivate,%Game_Title%
}
return
 
Sand:
{
Sand = 1
Tree_type2 = sand
  Gui, Select: Submit 
 
Process, Exist, %Procces%
IF !errorlevel=1
{
Run, %Game_Path_Dir%
}
 
WinWait,%Original_Title%
WinMove,%Original_Title%,,,,906,705
WinSet, Style, -0x30000,%Original_Title%
 
Game_Title = Digging Bot
WinSetTitle,%Original_Title%,,%Game_Title%
Sleep, 500
WinActivate,%Game_Title%
WinWaitActive,%Game_Title%
 
Gui, 1:New, +LastFound -Caption +AlwaysOnTop
Gui, Margin, 0, 0
 
Gui Add, CheckBox, x8 y24 w90 h20 vDebug_Mod, Debug Mode
Gui Add, CheckBox, x224 y24 w70 h20 vPetbox, Have Pet
Gui Add, CheckBox, x328 y24 w110 h20 vDrop_Crystal, Alarm on Capatcha
Gui Add, Text, x448 y24 w110 h20 , Sand Sell Price:
Gui Add, Edit, x528 y24 w30 h20 vprice, 200
Gui Add, Text, x752 y24 w99 h20 , Sell Sand every run:
Gui Add, Edit, x856 y24 w30 h20 vSelling_time, 20
Gui Add, CheckBox, x568 y24 w170 h20 Checked  vAnounce_Sell, Announce selling in Trade Chat
Gui, Add, ListView,grid  x8 y56 w850 h62 ,Account|Runs|Status|Sand Dug|Profit|XP Gained
 
LV_ModifyCol(1, 100) , LV_ModifyCol(2, 40) , LV_ModifyCol(3, 255) , LV_ModifyCol(4, 85) , LV_ModifyCol(5, 70) , LV_ModifyCol(6,80), LV_Add(1,"","","","","",""), LV_Modify(1,,Account,0,"Not Started",0,0,0)
 
Gui Add, Button, x130 y136 w90 h23 gMenu, Script Menu
Gui Add, Button, x8 y136 w90 h23 gStart_Bot, Start/Stop
 
Gui Add, Link, x226 y136 w71 h13, <a href="https://autohotkey.com/boards/viewtopic.php?f=19&t=13323">Bot Homepage</a>
 
Gui Add, Link, x416 y136 w100 h13, <a href="http://rpg-mo.wikia.com/wiki/Sand">Sand Wiki</a>
 
SetParentByClass("Chrome_WidgetWin_0", 1)
Gui Show, x0 y500 w967 h172, 1
WinActivate,%Game_Title%
}
return
 
 
fish:
{
 Fish = 1 
Tree_type2 = Fish
 Gui, Select: Submit
 
Process, Exist, %Procces%
IF !errorlevel=1
{
Run, %Game_Path_Dir%
}
 
WinWait,%Original_Title%
WinMove,%Original_Title%,,,,906,705
WinSet, Style, -0x30000,%Original_Title%
 
Game_Title = Fishing Bot
WinSetTitle,%Original_Title%,,%Game_Title%
Sleep, 500
WinActivate,%Game_Title%
WinWaitActive,%Game_Title%
 
Gui, 1:New, +LastFound -Caption +AlwaysOnTop
Gui, Margin, 0, 0
 
Gui Add, Text, x10 y6 w52 h13 , Fishing Place:
Gui Add, DropDownList, x8 y24 w120 vFish_Location, Dorpat ; |Reval|Rakblood|Narwa
Gui Add, CheckBox, x224 y24 w90 h20 vDebug_Mod, Debug Mode
Gui Add, CheckBox, x144 y24 w70 h20 vPetbox, Have Pet
Gui, Add, ListView,grid  x8 y56 w850 h62 ,Account|Runs|Status|Fish Catched
 
LV_ModifyCol(1, 100) , LV_ModifyCol(2, 40) , LV_ModifyCol(3, 255) , LV_ModifyCol(4, 85) , LV_ModifyCol(5, 70) , LV_ModifyCol(6,80), LV_Add(1,"","","","","",""), LV_Modify(1,,Account,0,"Not Started",0,0,0)
 
Gui Add, Button, x8 y136 w90 h23 gStart_Bot, Start/Stop
Gui Add, Button, x130 y136 w90 h23 gMenu, Script Menu
 
Gui Add, Link, x226 y136 w71 h13, <a href="https://autohotkey.com/boards/viewtopic.php?f=19&t=13323">Bot Homepage</a>
 
Gui Add, Link, x416 y136 w100 h13, <a href="http://rpg-mo.wikia.com/wiki/Fishing">Fishing Wiki</a>
 
GuiControl,Choose,Fish_Location,Dorpat
SetParentByClass("Chrome_WidgetWin_0", 1)
Gui Show, x0 y500 w967 h172, 1
WinActivate,%Game_Title%
}
return
 
 mine:
{
 mine = 1 
Tree_type2 = mine
 Gui, Select: Submit
 
Process, Exist, %Procces%
IF !errorlevel=1
{
Run, %Game_Path_Dir%
}
 
WinWait,%Original_Title%
WinMove,%Original_Title%,,,,906,705
WinSet, Style, -0x30000,%Original_Title%
 
Game_Title = Mining Bot
WinSetTitle,%Original_Title%,,%Game_Title%
Sleep, 500
WinActivate,%Game_Title%
WinWaitActive,%Game_Title%
 
Gui, 1:New, +LastFound -Caption +AlwaysOnTop
Gui, Margin, 0, 0
 
Gui Add, Text, x10 y6 w52 h13 , Mining Place:
Gui Add, DropDownList, x8 y24 w120 vmine_Location, Dorpat|Reval|Rakblood|Narwa
Gui Add, CheckBox, x224 y24 w90 h20 vDebug_Mod, Debug Mode
Gui Add, CheckBox, x144 y24 w70 h20 vPetbox, Have Pet
Gui, Add, ListView,grid  x8 y56 w850 h62 ,Account|Runs|Status|Ore Mined
 
LV_ModifyCol(1, 100) , LV_ModifyCol(2, 40) , LV_ModifyCol(3, 255) , LV_ModifyCol(4, 85) , LV_ModifyCol(5, 70) , LV_ModifyCol(6,80), LV_Add(1,"","","","","",""), LV_Modify(1,,Account,0,"Not Started",0,0,0)
 
Gui Add, Button, x8 y136 w90 h23 gStart_Bot, Start/Stop
Gui Add, Button, x130 y136 w90 h23 gMenu, Script Menu
 
Gui Add, Link, x226 y136 w71 h13, <a href="https://autohotkey.com/boards/viewtopic.php?f=19&t=13323">Bot Homepage</a>
 
Gui Add, Link, x416 y136 w100 h13, <a href="http://rpg-mo.wikia.com/wiki/Mining">Mining Wiki</a>
 
GuiControl,Choose,Fish_Location,Dorpat
SetParentByClass("Chrome_WidgetWin_0", 1)
Gui Show, x0 y500 w967 h172, 1
WinActivate,%Game_Title%
}
return
 
 StartGuiClose:
 SelectGuiClose:
GuiClose:
ExitApp
 
Settings:
run, notepad "RPG MO Bot.ini"
return

Menu:
Wood = 0
Sand = 0
Fish = 0
Fight = 0
mine = 0

Full_INV = 0
XP = 0
loops = 0
runs = 0

WinSetTitle,%Game_Title%,,%Original_Title%
WinMove,%Original_Title%,,,,906,539
 
Gui, Select:Destroy
Gui, 1:Destroy
Gui Destroy
Gosub, Menu_Screen
return
 
 
BotKey:
Start_Bot:
Gui, Submit ,NoHide
 
IF (Wood = 1)
{
GuiControlGet, Tree_type2,, Tree_type 
}
 
IF (mine = 1)
{
GuiControlGet, mine_Location2,, mine_Location
}
 
IF (fish = 1)
{
GuiControlGet,Fish_Location2,,Fish_Location
}
 
WinActivate,%Game_Title%
WinWaitActive, %Game_Title%
Sleep, 200
 
LV_Modify(1,,,,"Bot Started")
 
Gui, Submit ,NoHide
 
GuiControl, Disable, Start RPG MO
GuiControl, Disable, Start Bot
GuiControl, Disable, Walk_Speed
GuiControl, Disable, price
GuiControl, Disable, PetBox
GuiControl, Disable, Alarm
GuiControl, Disable, Drop_Crystal
GuiControl, Disable, Debug_Mod
GuiControl, Disable,Anounce_Sell
GuiControl, Disable,Selling_time
GuiControl, Disable, Start RPG MO
GuiControl, Disable, Run to Stash
GuiControl, Disable, Walk_Speed
GuiControl, Disable, price
GuiControl, Disable, PetBox
GuiControl, Disable, Alarm
GuiControl, Disable, Drop_Crystal
GuiControl, Disable, Debug_Mod
GuiControl, Disable, Tree_type
GuiControl, Disable, Fish_Location
GuiControl, Disable, mine_Location
 
 
WinActivate,%Game_Title%
 
Work_And_Stash()
return
 
Work_And_Stash(){
Going2stash()
Stashing()
 
IF (loops = Selling_time)
{
IF (Wood = 1){ 
LV_Modify(1,,,,"Going to Stash and Selling" Tree_type2 )
}
IF (Sand = 1){ 
LV_Modify(1,,,,"Going to Stash and Selling Sand")
}
loops = 0
Selling(price)
LV_Modify(1,,,,"Anouncing in trade chat")
IF (Anounce_Sell = 1){
IF (Wood = 1){  
Anounces("[SELL] " Tree_type2 " " Full_INV " For " price "ea")
}
IF (sand = 1){  
Anounces("[SELL]  Sand " Full_INV " For " price "ea")
}
 
Sleep, 700
}
 
}
 
GoingBack()
 
GuiControl, Enable,Anounce_Sell
GuiControl, Enable, Start RPG MO
GuiControl, Enable, Run to Stash
GuiControl, Enable, Walk_Speed
GuiControl, Enable, price
GuiControl, Enable, PetBox
GuiControl, Enable, Alarm
GuiControl, Enable, Drop_Crystal
GuiControl, Enable, Debug_Mod
GuiControl, Enable, Tree_type
GuiControl, Enable,Anounce_Sell 
GuiControl, Enable, Start RPG MO
GuiControl, Enable, Start Bot
GuiControl, Enable, Walk_Speed
GuiControl, Enable, price
GuiControl, Enable, PetBox
GuiControl, Enable, Alarm
GuiControl, Enable, Drop_Crystal
GuiControl, Enable, Debug_Mod
GuiControl, Enable, Fish_Location
GuiControl, Enable, mine_location
 
}
return
 
Selling(Funcy_Price){
 
IF (Fish = 1)
{
return
}
 
 IF (mine = 1)
{
LV_Modify(1,,,,"Selling " mine_Location2 " wood in the market for: " Funcy_Price )
}
 
IF (Wood = 1)
{
LV_Modify(1,,,,"Selling " Tree_type2 " wood in the market for: " Funcy_Price )
}
 
IF (Sand = 1)
{
LV_Modify(1,,,,"Selling Sand in the market for: " Funcy_Price )
}
 
 
   click, 465 114
   Sleep, 1000
   click, 546 114
   Sleep, 1000
   click, 394 179
   Sleep, 1000
   Send, %Tree_type2% 
   Sleep 700
   Send {Enter}
   Sleep 700
   click, 398 234
   Click 2
   send %Funcy_Price%
   Sleep 700
   click, 493 265
   Sleep, 1000
   click, 388 320
   Sleep, 1000
 
IF (Wood = 1)
{
LV_Modify(1,,,, Tree_type2 " wood sold in the market for: " Funcy_Price ) 
}
 
IF (Sand = 1)
{
LV_Modify(1,,,, "Sand sold in the market for: " Funcy_Price ) 
}
 
Sleep 700
}
return
 
 
 
 
 
GoingBack(){
 
 
IF (Fish = 1)
{
GuiControlGet,Fish_Location2,,Fish_Location
LV_Modify(1,,,,"Going back fishing")  
 
IF (Fish_Location2 = "Dorpat")
{
K("down","3")
K("Left","5")
K("Down","6")
 }
 
}
 
IF (Sand = 1)
{
LV_Modify(1,,,,"Going to Sand")  
Sleep, 400
K("Down","7")
K("Right","1")
K("Down","8")
K("Left","7")
K("Up","17")
K("Left","1")
}
 
IF (Wood = 1)
{
   GuiControlGet, Tree_type2,, Tree_type 
   LV_Modify(1,,,,"Going to " Tree_type2 " tree")  
   Sleep, 400
 
   IF (Tree_type2 = "Cactus")
  {
   K("Down","7")
   K("Right","1")
   K("Down","13")
   K("Left","8")
  }
 
   IF (Tree_type2 = "Maple")
  { 
   K("Down","7")
   K("Right","1")
   K("Down","10")
   K("Right","50")
   K("Up","10")
   K("Right","2")
   K("Up","8")
}
}
 
IF (Wood = 1)
{
LV_Modify(1,,,,"Cutting " Tree_type2 " tree")
}
 
IF (Sand = 1)
{
LV_Modify(1,,,,"Digging Sand")
}
 
IF (Fish = 1)
{
LV_Modify(1,,,,"Fishing")
}
 
Sleep, 300
loops+= 1
Runs+= 1
LV_Modify(1,,,Runs)
 
}
return
 
 
 
 
Going2stash(){
Global Full_INV
Global XP
 
 
IF (Fish = 1)
{
LV_Modify(1,,,,"Going to Stash")
GuiControlGet, Fish_Location2,, Fish_Location 
Full_INV += 39
}
 
IF (Sand = 1)
{
LV_Modify(1,,,,"Going to Stash")
Full_INV += 39
XP += 390
}
 
IF (Wood = 1)
{
   LV_Modify(1,,,,"Going to Stash")
    GuiControlGet, Tree_type2,, Tree_type 
      Full_INV += 39
 
     IF (Tree_type2 = "Fir")
   {
      XP += 195
   }
     IF (Tree_type2 = "Cactus")
   {
      XP += 312
   }
     IF (Tree_type2 = "Oak")
   {
      XP += 507
}
     IF (Tree_type2 = "Willow")
   {
      XP += 702
}
     IF (Tree_type2 = "Maple")
   {
      XP += 897
}
     IF (Tree_type2 = "Spirit")
   {
      XP += 1170
}
     IF (Tree_type2 = "Blue Palm")
   {
      XP += 1755
}
     IF (Tree_type2 = "Magic Oak")
   {
      XP += 2145
   }
}
   LV_Modify(1,,,,,Full_INV)
   LV_Modify(1,,,,,,Full_INV*price "$") 
   LV_Modify(1,,,,,,,XP)
 
   Sleep, 300
 
IF (Wood = 1)
{
    IF (Tree_type2 = "Maple")
   {
     K("Down","7")
     K("Left","2")
     K("Down","3")
     K("Left","50")
     K("Up","10")
     K("Left","1")
     K("Up","7")
     K("Left","2")
     Sleep, 300
   }
 
    IF (Tree_type2 = "Cactus")
   {
   K("Right","5")
   K("Up","13")
   K("Left","1")
   K("Up","7")
   K("Left","2")
   Sleep, 300
}
}
 
IF (fish = 1)
{
 
IF (Fish_Location2 = "Dorpat")
{
K("Up","5")
K("Right","5")
K("Up","3")
K("Right","2")
Sleep, 300
}
 
}
 
IF (Sand = 1)
{
K("Down","17")
K("Right","7")
K("Up","8")
K("Left","1")
K("Up","7")
K("Left","2")
Sleep, 300
}
}
return
 
 
 
 
Stashing(){
 
IF (Wood = 1)
{
LV_Modify(1,,,,"Stashing "  Tree_type2 " woods")
}
 
IF (Sand = 1)
{
LV_Modify(1,,,,"Stashing Sand")
}
 
IF (Fish = 1)
{
LV_Modify(1,,,,"Stashing Fish")
}
 
   Sleep, 500
   send, {E Down}
   Sleep, 300
   send, {E Up}
   Sleep, 1000
 
   IF (Petbox = 1)
   {
      LV_Modify(1,,,,"Stashing Pets Inventory") 
      Click 831,374
      Sleep 500
      Click 831,374
 
      Sleep, 1000
      send, {E Down}
      Sleep, 300
      send, {E Up}
      Sleep, 2000
   }
   LV_Modify(1,,,, "Inventory Stashed")
}
return
 
Anounces(message){
   Sleep, 700
   send, {Enter}
   Sleep, 3000
   K("Up","3")
   Sleep, 3000
   SendRaw,%message%
   Sleep, 4000
   send, {Enter}
   Sleep, 3000
}
return
 
C(clc,x,y){
   Loop, %clc%
   {
      Click %x%, %y%   
      Click Down Left
      Sleep, 300   
      Click up Left
   }
}
return
 
 
K(key,times){
   Loop, %times%
   {
      Random,Sleepy,230,240
 
      IF (Debug_Mod = 1)
      {
         ToolTip,Walking: %key% Steps: %A_index% /  %times% /  %total%,0,0
      } 
 
      Send,{%key% Down}
      Sleep, %Sleepy%
      Send,{%key% Up}
      Sleep, 200
      total++
   }
   Sleep, 100
}
return
 
HideKey:
{
hid++
 
IF (hid = 1)
{
WinSetTitle,%Game_Title%,,%Original_Title%
WinMove,%Original_Title%,,,,906,539
WinActivate,%Original_Title%
WinWaitActive,%Original_Title%
}
 
IF (hid = 2)
{
hid = 0
WinSetTitle,%Original_Title%,,%Game_Title%
WinMove,%Game_Title%,,,,906,705
SetParentByClass("Chrome_WidgetWin_0", 1)
WinActivate,%Game_Title%
WinWaitActive,%Game_Title%
}
 
}
return
 
^Esc::
ExitApp
return
 
Quit:
WinSetTitle,%Game_Title%,,%Original_Title%
WinMove,%Original_Title%,,,,906,539
send, {Up Up}
send, {Down Up}
send, {Right Up}
send, {Left Up}
ExitApp
return
 
 
SetParentByClass(Window_Class, Gui_Number)
{ 
    Parent_Handle := DllCall( "FindWindowEx", "uint",0, "uint",0, "str", Window_Class, "uint",0) 
    Gui, %Gui_Number%: +LastFound 
    Return DllCall( "SetParent", "uint", WinExist(), "uint", Parent_Handle )
}
 
SetParentByTitle(Window_Title_Text, Gui_Number) 
{
    WinGetTitle, Window_Title_Text_Complete, %Window_Title_Text% 
    Parent_Handle := DllCall( "FindWindowEx", "uint",0, "uint",0, "uint",0, "str", Window_Title_Text_Complete) 
    Gui, %Gui_Number%: +LastFound 
    Return DllCall( "SetParent", "uint", WinExist(), "uint", Parent_Handle )
}
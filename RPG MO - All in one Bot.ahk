/*
Script name: RPG MO - All in One Bot
Made by: FloowSnaake
Autohotkey version: v1.1.23.01
Tested on: Windows 7 64 Bit Ultimate and Windows 8 32 Bit
Started working Date: 12/11/2015
Latest Build date: 28/03/2016

For more info:
https://github.com/floowsnaake/RPG-MO---All-in-one-Bot
 
*/

#SingleInstance Force
OnExit, Quit
SetWorkingDir, %A_ScriptDir%

CoordMode, Mouse, Client
CoordMode, Pixel, Client
CoordMode, ToolTip, Client

Global Walkspeed

   IfExist,RPG MO Bot2.ini
   {
      FileReadLine,Read_Acc,RPG MO Bot2.ini,1
      FileReadLine,Read_StartKey,RPG MO Bot2.ini,2
     ; FileReadLine,Read_HideKey,RPG MO Bot2.ini,3
      FileReadLine,Read_Steam,RPG MO Bot2.ini,3
      
     ; Hotkey,%Read_HideKey%,Hidekey
      Hotkey,%Read_StartKey%,Botkey
       
      Account = %Read_Acc%
      
      IF (Read_Steam = 1)
      {
       Game_Title = RPG MO - Early Access
       Procces = nw.exe
      }
      
      IF (Read_Steam = 0)
      {
       Game_Title = RPG MO - Web Browser Game
       Procces = RPG MO.exe
      }
      
   }
 
IfNOTExist,RPG MO Bot2.ini
{
      Gui, Start: Add, Text, w110 h20,Account
      Gui, Start: Add, Edit, w100 h20 vAcc, Account name
 
      Gui, Start: Add, Text, w110 h20 ,Bot Start Hotkey:
      Gui, Start: Add, Hotkey, w70 h20 vStartKey,^T
      
      ;Gui, Start: Add, Text, w110 h20 ,Bot Hide Hotkey:
      ;Gui, Start: Add, Hotkey, w70 h20 vHideKey,F1
      
      Gui, Start: Add, Checkbox,vSteam,Steam version
      Gui, Start: Add, Button,gsave, Save
 
      Gui, Start: Show,w160, Settings
      return
 
      save:
      Gui, Start: Submit
      FileAppend,%Acc%`n%StartKey%`n%Steam%,RPG MO Bot2.ini
     Reload
      return
}

Process, Exist, %Procces%
IF !errorlevel=1
{
MsgBox, Start the RPG MO Client and login then start the bot
ExitApp
}

Gui, Lunch: Color, White
Gui, Lunch: Add, Button, x8 y272 w75 h23 gStart_Bot_gui, Start Bot
Gui, Lunch: Add, Button, x96 y272 w115 h23 gStart_Script_Maker, Start the Script Maker
Gui, Lunch: Add, GroupBox, x8 y320 w187 h70, Download RPG MO Client
Gui, Lunch: Add, Button, x112 y352 w75 h23 gsteam, Steam
Gui, Lunch: Add, Button, x16 y352 w75 h23 gRpg, Normal
Gui, Lunch: Add, Link, x0 y408 w120 h23, <a href="https://github.com/floowsnaake/RPG-MO---All-in-one-Bot">Bot Development Page</a>
Gui, Lunch: Add, Picture, x8 y40 w32 h32, %A_ScriptDir%\Data\pickshovel.png
Gui, Lunch: Add, Text, x40 y48 w120 h23 +0x200, Mining and Digging sand
Gui, Lunch: Add, Text, x0 y0 w193 h23 +0x200, What can RPG MO - All in one Bot do?
Gui, Lunch: Add, Picture, x8 y80 w32 h32, %A_ScriptDir%\Data\campfire.png
Gui, Lunch: Add, Text, x40 y88 w46 h23 +0x200, Cooking
Gui, Lunch: Add, Picture, x176 y40 w32 h32, %A_ScriptDir%\Data\cactus.png
Gui, Lunch: Add, Text, x208 y48 w70 h23 +0x200, Woodcutting
Gui, Lunch: Add, Picture, x104 y80 w32 h32, %A_ScriptDir%\Data\still.png
Gui, Lunch: Add, Text, x136 y88 w46 h23 +0x200, Alchemy
Gui, Lunch: Add, Picture, x200 y80 w32 h32, %A_ScriptDir%\Data\native-american-turtle.png
Gui, Lunch: Add, Text, x232 y88 w47 h23 +0x200, Fishing
Gui, Lunch: Add, Text, x40 y152 w100 h23 +0x200, Works with your Pet
Gui, Lunch: Add, Picture, x8 y144 w32 h32, %A_ScriptDir%\Data\circus-llama.png
Gui, Lunch: Add, Text, x8 y200 w227 h23 +0x200, More Skills and Futures will be added soon   `;)
Gui, Lunch: Add, Text, x8 y248 w125 h23 +0x200, What do you want to do?
Gui, Lunch: Add, Text, x248 y400 w39 h23 +0x200, Gui, Lunch: v3
Gui, Lunch: Show, w282 h423, RMAIOB Menu
Return

LunchGuiClose:
ExitApp

Rpg:
Run, http://mo.ee/download.html
return

steam:
Run, http://store.steampowered.com/app/372800
return

Start_Bot_gui:
Gui, Lunch: Destroy 
gosub, BotMode
return

Start_Script_Maker:
Gui, Lunch: Destroy 
gosub,ScrMaker
return

ScrMaker:
SetWorkingDir, %A_ScriptDir%/scripts

CoordMode, Mouse, Client
CoordMode, Pixel, Client
CoordMode, ToolTip, Client

Home:
Gui, Maker: Color, White

Gui, Maker: Add, Button, x8 y8 w95 h23 gOpen, Open/Edit Script
Gui, Maker: Add, Text, x8 y40 w63 h23 +0x200, Open Script:

Gui, Maker: Add, Edit, x8 y64 w297 h20 ReadOnly vpath, Dont Edit this box

Gui, Maker: Add, Text, x8 y96 w44 h23, Type:
Gui, Maker: Add, Edit, x8 y120 w56 h21 vType,

Gui, Maker: Add, Text, x80 y96 w98 h23, Exp per Type/item:
Gui, Maker: Add, Edit, x80 y120 w39 h21 vExp,

Gui, Maker: Add, Text, x200 y96 w96 h23, Stash/Chest Click:
Gui, Maker: Add, Text, x184 y128 w32 h19, Cords:
Gui, Maker: Add, Edit, x216 y128 w47 h21 ReadOnly vChest_Click,
Gui, Maker: Add, Button, x274 y128 w89 h20 gCoords, Set Coords

Gui, Maker: Add, Text, x8 y160 w119 h23, Walking to chest/stash:
Gui, Maker: Add, Button, x136 y160 w75 h23 grecord1, Record walk
Gui, Maker: Add, Edit, x8 y184 w298 h21 vStash,

Gui, Maker: Add, Text, x8 y216 w71 h23, Walking Back:
Gui, Maker: Add, Button, x136 y216 w75 h23 grecord2, Record Walk
Gui, Maker: Add, Edit, x8 y240 w298 h21 vBack,

Gui, Maker: Add, Text, x8 y272 w26 h23 +0x200, Skill:
Gui, Maker: Add, Edit, x8 y296 w57 h21 vInfo1,

Gui, Maker: Add, Text, x80 y272 w47 h23 +0x200, Location:
Gui, Maker: Add, Edit, x80 y296 w80 h21 vInfo2,

Gui, Maker: Add, Text, x176 y272 w70 h23 +0x200, Requirements:
Gui, Maker: Add, Edit, x176 y296 w91 h21 vInfo3,

Gui, Maker: Add, Button, x8 y336 w75 h23 gsaveScript, Save Script

Gui, Maker: Show, w372 h369, Script Maker and Editor
Return

MakerGuiClose:
ExitApp

record1:
MsgBox, the recording is currently not working
return

record2:
MsgBox, the recording is currently not working
return

Open:
FileSelectFile, SelectedScript, 3, , Select a Script/Path, Edit script (*.path)
if SelectedScript =
    MsgBox, The user didn't select anything.
else

FileReadLine,Read_Type,%SelectedScript%,1
FileReadLine,Read_Exp,%SelectedScript%,2
FileReadLine,Read_Stash,%SelectedScript%,3
FileReadLine,Read_Chest_Click,%SelectedScript%,4
FileReadLine,Read_Back,%SelectedScript%,5
FileReadLine,Read_Info,%SelectedScript%,6


GuiControl, Maker:,Type,%Read_Type%
GuiControl, Maker:,Exp,%Read_Exp%
GuiControl, Maker:,Stash,%Read_Stash%
GuiControl, Maker:,Chest_Click,%Read_Chest_Click%
GuiControl, Maker:,Back,%Read_Back%

StringSplit, w, Read_Info, ||,all
GuiControl, Maker:,Info1,%w2%
GuiControl, Maker:,Info2,%w5%
GuiControl, Maker:,Info3,%w8%

GuiControl, Maker:,path,%SelectedScript%
return

Coords:
MsgBox, 0, , Set Mouse Coordinates for the Chest/stash`n`nPress OK then mouse your mouse over to the chest and press X key. make sure that the RPG MO window is activated

WinActivate,RPG MO - Early Access
WinActivate,RPG MO - Web Browser Game

KeyWait, X,D
KeyWait, X
MouseGetPos,XX,YY
MsgBox, 0, , chest have been set to: %XX% %YY%
GuiControl, Maker:,Chest_Click, %XX% %YY%
return

saveScript:
Gui, Maker:Submit

Script_var =
(
%Type%
%Exp%
%Stash%
%Chest_Click%
%Back%
Skill:|%Info1%||Location/Coordinates:|%Info2%||Requirements:|%Info3%
)

FileSelectFile, ScriptName, S16,%A_ScriptDir%/scripts, Save Script, script (*.path)

if (ScriptName = "")
	return
file := FileOpen(ScriptName, "w")
if !IsObject(file)
{
	MsgBox Can't open "%ScriptName%" for writing.
	return
}
file.Write(Script_var)
file.Close()
MsgBox, Saved %ScriptName% 
return

BotMode:
Select_Again:
FileSelectFile, Script, 3,,Load a script, Script (*.path)
IF Script =
{
MsgBox, You didn't select a script
Sleep, 200
gosub, Select_Again
return
}

FileReadLine,Read_Type,%Script%,1
FileReadLine,Read_Exp,%Script%,2
FileReadLine,Stash,%Script%,3
FileReadLine,Read_Chest_Click,%Script%,4
FileReadLine,Back,%Script%,5
FileReadLine,Read_Info,%script%,6
StringReplace, NewStr, Read_Info,|,`n, All
FileReadLine,startCheck,%script%,7


IF NOT (startCheck = "Disable start info")
{
MsgBox, 262212, How to use Script:, %NewStr%`n`nDisable this Info at start up
IfMsgBox,Yes
FileAppend,`nDisable start info,%script%
}


WinWait,%Game_Title%
WinActivate,%Game_Title%


WinSet, Style, -0x30000, %Game_Title%
WinSet, Style, -0x40000, %Game_Title%

WinWaitActive,%Game_Title%
WinMove,%Game_Title%,,,,906,705

Gui Color, White
Gui, 1:New, +LastFound -Caption +AlwaysOnTop
Gui, Margin, 0, 0
Gui Add, Text, x8 y8 w100 h15, Script Info/Help:
Gui Add, Button, x8 y24 w49 h23 gHelp, Script
 Gui Add, Text, x104 y8 w74 h13, Pet +inventory:
Gui Add, Radio, x104 y24 w55 h23 Checked vPet0, No Pet
Gui Add, Radio, x168 y24 w30 h23 vPet4, 4
Gui Add, Radio, x208 y24 w30 h23 vPet8, 8
Gui Add, Radio, x248 y24 w30 h23 vPet12, 12
Gui Add, Radio, x288 y24 w30 h23 vPet16, 16


Gui Add, Text, x336 y8 w74 h13, %Read_Type% Sell Price:
Gui Add, Edit, x336 y24 w30 h20 vprice, 200

Gui Add, Text, x536 y8 w110 h13, Sell %Read_Type% Every run:
Gui Add, Edit, x536 y24 w30 h20 vSelling_time, 5

Gui Add, Text, x656 y8 w78 h12, Walking Speed:
Gui Add, ComboBox, x640 y24 w100 ReadOnly vWalkspeed,Extremely Slow|Very Slow|Slow|Normal|Fast|Very Fast|Extremely Fast

Gui Add, CheckBox, x752 y24 w120 h23 Checked vclick_chest, Click on chest

Gui Add, CheckBox, x384 y24 w139 h20  Checked  vAnounce_Sell, Announce selling in Chat

Gui, Add, ListView,grid  x8 y56 w850 h62 ,Account|Runs|Status|%Read_Type% Stashed|Profit|XP Gained
LV_ModifyCol(1, 100) , LV_ModifyCol(2, 40) , LV_ModifyCol(3, 255) , LV_ModifyCol(4, 85) , LV_ModifyCol(5, 70) , LV_ModifyCol(6,80), LV_Add(1,"","","","","",""), LV_Modify(1,,Account,0,"Not Started",0,0,0)

Gui Add, Button, x8 y136 w90 h23 gStart_Bot, Start
Gui Add, Button, x112 y136 w90 h23 gLscript, Load new Script
Gui Add, Button, x216 y136 w90 h23 gSFolder, Bot folder
Gui Add, Button, x320 y136 w90 h23 gMake_Script, Script Maker
Gui Add, Link, x430 y144 w56 h13, <a href="https://github.com/floowsnaake/RPG-MO---All-in-one-Bot">Homepage</a>
Gui Add, Link, x520 y144 w73 h13, <a href="http://rpg-mo.wikia.com/wiki/Main_Page">RPG MO Wiki</a>

GuiControl,Choose,Location,%Read_Location%
GuiControl, Choose, Walkspeed, Normal

SetParentByClass("Chrome_WidgetWin_0", 1)


Gui Show, x0 y505 w967 h172, 1
WinActivate,%Game_Title%
return

Help:
MsgBox, 262208,Script Info/Help, %NewStr%
return

SFolder:
run, explore %A_ScriptDir%
return

Lscript:
MsgBox, 36, , Are you sure that you want to load new script?
IfMsgBox,Yes
Gosub,BotMode
return

Make_Script:
MsgBox, 68, , This will close the Bot`, do you want to continue?
IfMsgBox,Yes
{
gosub,ScrMaker
}
return

Start_Bot:
Botkey:
Gui, Submit ,NoHide
WinActivate,%Game_Title%
WinWaitActive,%Game_Title%

hid = 0
Sleep, 200

IF Pet0
Full_inv = 39
IF  Pet4
Full_inv = 42
IF Pet8
Full_inv = 46
IF Pet12
Full_inv = 50
IF Pet16
Full_inv = 54

loops+= 1
Runs+= 1
LV_Modify(1,,,Runs)

INV += Full_inv

XP += Full_inv*Read_Exp

LV_Modify(1,,,,,INV)
LV_Modify(1,,,,,,INV*price "$") 
LV_Modify(1,,,,,,,XP)

LV_Modify(1,,,,"Going to stash")  
K(Stash)
Sleep, 300

IF (click_chest = 1)
{  
click, %Read_Chest_Click% 
Sleep, 500
click, %Read_Chest_Click% 
Sleep, 1000
}

LV_Modify(1,,,,"Stashing the " Read_Type) 

K("E 2")

IF NOT Pet0
{
K("Z 2")
K("E 2")
}

IF (loops = Selling_time)
{
loops = 0
LV_Modify(1,,,,"Selling " Read_Type " in the market for: " price)
click, 465 114
Sleep, 1000
click, 546 114
Sleep, 1000
click, 394 179
Sleep, 1000
SendRaw, %Read_Type% 
Sleep 700
Send {Enter}
Sleep 700
Click, 458, 235
click, 2
Sleep 700
send %price%
Sleep 700
click, 493 265
Sleep, 1000
click, 388 320
Sleep, 1000

LV_Modify(1,,,, Read_Type " sold in the market for: " price ) 


IF (Anounce_Sell = 1)
{
Sleep, 700
K("Enter 1")
Sleep, 3000
K("Up 4")
Sleep, 3000
SendRaw,[sell] %Read_Type% for %price% ea
Sleep, 4000
K("Enter 1")
Sleep, 3000
}
}
LV_Modify(1,,,,"Going back")
K(Back)
LV_Modify(1,,,,"Working...")  
return


K(multipleKeyTimes){
    Global
    Loop, Parse, multipleKeyTimes,`,
    {
        keyOrTimes:=StrSplit(A_LoopField,A_Space)
        Loop % keyOrTimes[2] {
  

            IF (Walkspeed = "Normal")
            {
                Random, Sleepy, 140, 130
            }
            
             IF (Walkspeed = "Fast")
            {
                Random, Sleepy, 100, 110
            }
            
             IF (Walkspeed = "Very Fast")
            {
               Random, Sleepy, 50, 60
            }
            
             IF (Walkspeed = "Extremely Fast")
            {
               Random, Sleepy, 15, 20
            }
            else
                Random, Sleepy, 140, 130
            
            Send, % "{" keyOrTimes[1]" Down}"
            Sleep, % Sleepy
            Send, % "{" keyOrTimes[1]" Up}"
            
            IF (Walkspeed = "Extremely Slow")
            { 
            Sleep 1000
             }
            IF (Walkspeed = "Very Slow")
            { 
            Sleep 600
             }
            IF (Walkspeed = "Slow")
            { 
            Sleep 300
             }
            IF (Walkspeed = "Normal")
            { 
            Sleep 250
             }
            IF (Walkspeed = "Fast")
            { 
            Sleep 100
             }
            IF (Walkspeed == "Very Fast")
            { 
            Sleep 50
             }
            IF (Walkspeed == "Extremely Fast")
          {  
            Sleep 10
           }
        }

}
}
return

SetParentByClass(Window_Class, Gui_Number)
{ 
    Parent_Handle := DllCall( "FindWindowEx", "uint",0, "uint",0, "str", Window_Class, "uint",0) 
    Gui, %Gui_Number%: +LastFound 
    Return DllCall( "SetParent", "uint", WinExist(), "uint", Parent_Handle )
}
 

^Esc::
Quit:
WinSet, Style, +0x30000,%Game_Title%
WinSet, Style, +0x40000, %Game_Title%
WinMove,%Game_Title%,,,,906,539
ExitApp
return

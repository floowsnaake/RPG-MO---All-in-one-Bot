/*
Script name: RPG MO - All in One Bot
Made by: FloowSnaake
Autohotkey version: v1.1.23.05
Tested on: Windows 7 64 Bit Ultimate and Windows 8 32 Bit
Started working Date: 12/11/2015
Latest Build date: 07/04/2016

For more info:
https://github.com/floowsnaake/RPG-MO---All-in-one-Bot
 
*/

#MaxHotkeysPerInterval 99000000
SetWorkingDir, %A_ScriptDir%
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input
#SingleInstance Force
OnExit, Quit


CoordMode, Mouse, Client
CoordMode, Pixel, Client
CoordMode, ToolTip, Client

Global Walkspeed
Global outputvar
Global Mouse_Chest1
Global Mouse_Chest2

   IfExist,RPG MO Bot Config.ini
   {
      FileReadLine,Read_Acc,RPG MO Bot Config.ini,1
      FileReadLine,Read_StartKey,RPG MO Bot Config.ini,2
     ; FileReadLine,Read_HideKey,RPG MO Bot Config.ini,3
      FileReadLine,Read_Steam,RPG MO Bot Config.ini,3
      
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



Gui, Lunch: Color, White
Gui, Lunch: Add, Button, x8 y272 w75 h23 gStart_Bot_gui, Run Bot
Gui, Lunch: Add, Button, x96 y272 w115 h23 gStart_Script_Maker, Run Script Maker
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
Gui, Lunch: Add, Text, x248 y400 w39 h23 +0x200, Gui: v4
Gui, Lunch: Show, w282 h423, RPG MO Bot Menu
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
IfExist,RPG MO Bot Config.ini
{
Gui, Lunch: Destroy
gosub,BotMode
}


IfNOTExist,RPG MO Bot Config.ini
{
 
 MsgBox, 4160, First Time Running, Hey and welcome to RPG MO Bot`n`nFirst of all make sure that you have downloaded the RPG MO Client and that you have logged in to the game`n`nMake sure that you read all the information in the next window and apply those settings to the game or else the bot will not work.`n`nFloowSnaake 2016-04-06
 
 Gui, Start: Color, White
 Gui, Start:  Add, Tab2, x-8 y-3 w278 h397, Game Settings|Bot Settings
 
 Gui, Start:  Add, Text, x7 y32 w256 h20 0x50000000, Make sure that RPG MO Have the following settings:
 Gui, Start:  Add, Text, x14 y73 w111 h23 +0x200, Game max size(1.25x)
 Gui, Start:  Add, Text, x136 y72 w91 h23 +0x200, Game grid(13x13)
 Gui, Start:  Add, Text, x14 y105 w185 h23 +0x200, Interface size`,  set this to the smallest 
 Gui, Start:  Add, GroupBox, x8 y56 w240 h90, Menu --> Game Options --> Video
 Gui, Start:  Add, GroupBox, x6 y153 w232 h56, Menu --> Wiki & Mods menu
 Gui, Start:  Add, Text, x22 y177 w152 h23 +0x200, Press "Select All" then "Load"
 Gui, Start:  Add, GroupBox, x6 y217 w232 h125, Menu --> Keybindings
 Gui, Start:  Add, Text, x22 y241 w125 h20 0x50000000, Deposit All+ in chest = E
 Gui, Start:  Add, Text, x22 y273 w125 h20 0x50000000, Unload pet inventory = Z
 Gui, Start:  Add, Text, x22 y305 w125 h20 0x50000000, Toggle inventory = Q

 Gui, Start:  Add, Text, x10 y349 w150 h23 +0x200, Now Go to the Bot Settings Tab
 Gui, Start:  Tab, 2
 Gui, Start:  Add, Text, x7 y34 w84 h20 0x50000000, Account Name:
 Gui, Start:  Add, Edit, x7 y58 w100 h20 0x50010080 vAcc, username
 Gui, Start:  Add, Text, x7 y82 w110 h20 0x50000000, Bot Start Hotkey:
 Gui, Start:  Add, Hotkey, x7 y106 w70 h20 0x50010000 vStartKey, F3
 Gui, Start:  Add, CheckBox, x7 y138 w89 h13 0x50010003 vSteam, Steam version
 Gui, Start:  Add, Button, x7 y162 w90 h23 0x50010000 gsave, Save settings

 Gui, Start:  Show, w266 h385, First Time Config
Return


save:
Gui, Start: Submit
Gui, Lunch: Destroy
FileAppend,%Acc%`n%StartKey%`n%Steam%,RPG MO Bot Config.ini
gosub, BotMode
return
}
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
FileRead,Cfg,RPG MO Bot Config.ini
IF errorlevel
{
MsgBox, 4112,Settings Error,Delete your RPG MO Bot Config.ini in the Bot folder and then restart the Bot.
}

Process, Exist, %Procces%
IF !errorlevel=1
{
MsgBox, 4112, RPG MO Client ERROR, Can't find: %Procces%`n`nPlease start %Procces% and Login to your account then restart RPG MO Bot.
ExitApp
}

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

FileReadLine,Read_Chest_Click,%Script%,4
StringSplit,Mouse_Chest,Read_Chest_Click,|,all


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
ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1,%Game_Title%
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
;Gui Add, CheckBox, x752 y4 w120 h23 Checked vAuto_Loop, Loop

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
ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1,%Game_Title%

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
ControlClick,x%Mouse_Chest1% y%Mouse_Chest2%, ahk_id %outputvar% 
Sleep, 500
ControlClick,x%Mouse_Chest1% y%Mouse_Chest2%, ahk_id %outputvar% 
Sleep, 2000
}

LV_Modify(1,,,,"Stashing the " Read_Type) 
Sleep, 200
K("E 3")
Sleep, 1000

IF NOT Pet0
{
K("Z 3")
Sleep, 1500
K("E 3")
Sleep, 1500
}

IF (loops = Selling_time)
{
loops = 0
LV_Modify(1,,,,"Selling " Read_Type " in the market for: " price)
ControlClick,x465 y114, ahk_id %outputvar%
Sleep, 1000
ControlClick,x546 y114, ahk_id %outputvar%
Sleep, 1000
ControlClick,x394 y179, ahk_id %outputvar%
Sleep, 1000
ControlSend,%Read_Type%, ahk_id %outputvar%
Sleep 700
ControlSend,, {Enter}, ahk_id %outputvar%
Sleep 700
ControlClick,x458, y235, ahk_id %outputvar%
Sleep, 200
ControlClick,x458, y235, ahk_id %outputvar%
Sleep 700
ControlSend,, %price%, ahk_id %outputvar%
Sleep 700
ControlClick,x493 y265, ahk_id %outputvar%
Sleep, 1000
ControlClick,x388 y320, ahk_id %outputvar%
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
             ControlFocus,,ahk_id %outputvar%
            ControlSend,, % "{" keyOrTimes[1]" Down}", ahk_id %outputvar%
            Sleep, % Sleepy
            ControlSend,, % "{" keyOrTimes[1]" Up}", ahk_id %outputvar%
            
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
            Sleep 400
             }
            IF (Walkspeed = "Normal")
            { 
            Sleep 300
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

ControlSend,,{W}, ahk_id %outputvar%
ControlSend,,{A}, ahk_id %outputvar%
ControlSend,,{S}, ahk_id %outputvar%
ControlSend,,{D}, ahk_id %outputvar%

ControlSend,,{Up}, ahk_id %outputvar%
ControlSend,,{Down}, ahk_id %outputvar%
ControlSend,,{Left}, ahk_id %outputvar%
ControlSend,,{Right}, ahk_id %outputvar%

WinSet, Style, +0x30000,%Game_Title%
WinSet, Style, +0x40000, %Game_Title%
WinMove,%Game_Title%,,,,906,539
ExitApp
return

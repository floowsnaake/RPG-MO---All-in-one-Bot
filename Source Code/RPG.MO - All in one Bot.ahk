/*
Script name: RPG MO - All in One Bot
Made by: FloowSnaake
Autohotkey version: v1.1.23.01
Tested on: Windows 7 64 Bit Ultimate and Windows 8 32 Bit
Started working Date: 12/11/2015
Latest Build date: 15/2/2016

For more info:
https://github.com/floowsnaake/RPG-MO---All-in-one-Bot
 
*/

#SingleInstance Force
OnExit, Quit
SetWorkingDir, %A_ScriptDir%

CoordMode, Mouse, Client
CoordMode, Pixel, Client
CoordMode, ToolTip, Client


   IfExist,RPG MO Bot2.ini
   {
      FileReadLine,Read_Acc,RPG MO Bot2.ini,1
      FileReadLine,Read_StartKey,RPG MO Bot2.ini,2
     ; FileReadLine,Read_HideKey,RPG MO Bot2.ini,3
      FileReadLine,Read_Steam,RPG MO Bot2.ini,4
      
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
      FileAppend,%Acc%`n%StartKey%`n%HideKey%`n%Steam%,RPG MO Bot2.ini
     Reload
      return
}

Process, Exist, %Procces%
IF !errorlevel=1
{
MsgBox, Start the RPG MO Client and login then start the bot
ExitApp
}

Select_Again:
FileSelectFile, Script, 3,%a_workingdir%/Scripts,Load a script, Script (*.path)
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
Reload
return

Make_Script:
MsgBox, 68, , This will close the Bot`, do you want to continue?
IfMsgBox,Yes
{
Run, Script Maker.exe
ExitApp
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

click, %Read_Chest_Click% 
Sleep, 500
click, %Read_Chest_Click% 
Sleep, 1000

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
    Loop, Parse, multipleKeyTimes,`,
    {
        keyOrTimes:=StrSplit(A_LoopField,A_Space)
        Loop % keyOrTimes[2] {
            Random, Sleepy, 130, 140
            Send, % "{" keyOrTimes[1]" Down}"
            Sleep, % Sleepy
            Send, % "{" keyOrTimes[1]" Up}"
            Sleep 250
        }
        Sleep, 100
    }
}
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


^Esc::
Quit:
WinSet, Style, +0x30000,%Game_Title%
WinSet, Style, +0x40000, %Game_Title%
WinMove,%Game_Title%,,,,906,539
ExitApp
return

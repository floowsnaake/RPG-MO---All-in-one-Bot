SetWorkingDir, %A_ScriptDir%/scripts

CoordMode, Mouse, Client
CoordMode, Pixel, Client
CoordMode, ToolTip, Client

Home:
Gui Color, White

Gui Add, Button, x8 y8 w95 h23 gOpen, Open/Edit Script
Gui Add, Text, x8 y40 w63 h23 +0x200, Open Script:

Gui Add, Edit, x8 y64 w297 h20 ReadOnly vpath, Dont Edit this box

Gui Add, Text, x8 y96 w44 h23, Type:
Gui Add, Edit, x8 y120 w56 h21 vType,

Gui Add, Text, x80 y96 w98 h23, Exp per Type/item:
Gui Add, Edit, x80 y120 w39 h21 vExp,

Gui Add, Text, x200 y96 w96 h23, Stash/Chest Click:
Gui Add, Text, x184 y128 w32 h19, Cords:
Gui Add, Edit, x216 y128 w47 h21 ReadOnly vChest_Click,
Gui Add, Button, x274 y128 w89 h20 gCoords, Set Coords

Gui Add, Text, x8 y160 w119 h23, Walking to chest/stash:
Gui Add, Button, x136 y160 w75 h23 grecord1, Record walk
Gui Add, Edit, x8 y184 w298 h21 vStash,

Gui Add, Text, x8 y216 w71 h23, Walking Back:
Gui Add, Button, x136 y216 w75 h23 grecord2, Record Walk
Gui Add, Edit, x8 y240 w298 h21 vBack,

Gui Add, Text, x8 y272 w26 h23 +0x200, Skill:
Gui Add, Edit, x8 y296 w57 h21 vInfo1,

Gui Add, Text, x80 y272 w47 h23 +0x200, Location:
Gui Add, Edit, x80 y296 w80 h21 vInfo2,

Gui Add, Text, x176 y272 w70 h23 +0x200, Requirements:
Gui Add, Edit, x176 y296 w91 h21 vInfo3,

Gui Add, Button, x8 y336 w75 h23 gsave, Save Script

Gui Show, w372 h369, Script Maker and Editor
Return

GuiClose:
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

GuiControl,,Type,%Read_Type%
GuiControl,,Exp,%Read_Exp%
GuiControl,,Stash,%Read_Stash%
GuiControl,,Chest_Click,%Read_Chest_Click%
GuiControl,,Back,%Read_Back%

StringSplit, w, Read_Info, ||,all
GuiControl,,Info1,%w2%
GuiControl,,Info2,%w5%
GuiControl,,Info3,%w8%

GuiControl,,path,%SelectedScript%
return

Coords:
MsgBox, 0, , Set Mouse Coordinates for the Chest/stash`n`nPress OK then mouse your mouse over to the chest and press X key. make sure that the RPG MO window is activated

WinActivate,RPG MO - Early Access
WinActivate,RPG MO - Web Browser Game

KeyWait, X,D
KeyWait, X
MouseGetPos,XX,YY
GuiControl,,Chest_Click, %XX% %YY%
return

Save:
Gui,Submit

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
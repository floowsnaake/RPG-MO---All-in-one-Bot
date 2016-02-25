SetWorkingDir %A_ScriptDir%

Gui Color, White
Gui Add, Button, x8 y272 w75 h23 gStart_Bot, Start Bot
Gui Add, Button, x96 y272 w115 h23 gStart_Script_Maker, Start the Script Maker
Gui Add, GroupBox, x8 y320 w187 h70, Download RPG MO Client
Gui Add, Button, x112 y352 w75 h23 gsteam, Steam
Gui Add, Button, x16 y352 w75 h23 gRpg, Normal
Gui Add, Link, x0 y408 w120 h23, <a href="https://github.com/floowsnaake/RPG-MO---All-in-one-Bot">Bot Development Page</a>
Gui Add, Picture, x8 y40 w32 h32, %A_ScriptDir%\Data\pick-and-shovel (1).png
Gui Add, Text, x40 y48 w120 h23 +0x200, Mining and Digging sand
Gui Add, Text, x0 y0 w193 h23 +0x200, What can RPG MO - All in one Bot do?
Gui Add, Picture, x8 y80 w32 h32, %A_ScriptDir%\Data\campfire (1).png
Gui Add, Text, x40 y88 w46 h23 +0x200, Cooking
Gui Add, Picture, x176 y40 w32 h32, %A_ScriptDir%\Data\cactus.png
Gui Add, Text, x208 y48 w70 h23 +0x200, Woodcutting
Gui Add, Picture, x104 y80 w32 h32, %A_ScriptDir%\Data\still.png
Gui Add, Text, x136 y88 w46 h23 +0x200, Alchemy
Gui Add, Picture, x200 y80 w32 h32, %A_ScriptDir%\Data\native-american-turtle.png
Gui Add, Text, x232 y88 w47 h23 +0x200, Fishing
Gui Add, Text, x40 y152 w100 h23 +0x200, Works with your Pet
Gui Add, Picture, x8 y144 w32 h32, %A_ScriptDir%\Data\circus-llama.png
Gui Add, Text, x8 y200 w227 h23 +0x200, More Skills and Futures will be added soon   `;)
Gui Add, Text, x8 y248 w125 h23 +0x200, What do you want to do?
Gui Add, Text, x248 y400 w39 h23 +0x200, GUI v3
Gui Show, w282 h423, RMAIOB Menu
Return

GuiClose:
ExitApp

Rpg:
Run, http://mo.ee/download.html
return

steam:
Run, http://store.steampowered.com/app/372800
return

Start_Bot:
Run, RPG MO - All in one Bot.exe
ExitApp
return

Start_Script_Maker:
Run, Script Maker.exe
return
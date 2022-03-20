#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; [1]: http://www.autohotkey.com/

; TODO:
; rewrite mousebindings a bit so that the actual bindings are stored in a separate file with structure of:

; layer0: {
;		button1: {
;			program0: [thingToDo0, desc0],
;			program1: [thingToDo1, desc1],
;			default: [thingToDoDefault, descDefault]
;		},
;		button2: {
;			program0: [thingToDo0, desc0],
;			program1: [thingToDo1, desc1],
;			default: [thingToDoDefault, descDefault]
;		},
;		...
;	},
;	layer1: {
;		...
;	}
;	...

If not A_IsAdmin
{
  Run *RunAs "%A_ScriptFullPath%"
  ExitApp
}

#Include, %A_ScriptDir%\FunctionsNavigation.ahk
#Include, %A_ScriptDir%\FunctionsOpeningPnW.ahk
#Include, %A_ScriptDir%\FunctionsYoutube.ahk

ZEROPATH  := "D:\AutoHotKey Files\QoL\Icons\zero_white.ico"
ONEPATH   := "D:\AutoHotKey Files\QoL\Icons\one_white.ico"
TWOPATH   := "D:\AutoHotKey Files\QoL\Icons\two_white.ico"
THREEPATH := "D:\AutoHotKey Files\QoL\Icons\three_white.ico"
FOURPATH  := "D:\AutoHotKey Files\QoL\Icons\four_white.ico"
FIVEPATH  := "D:\AutoHotKey Files\QoL\Icons\five_white.ico"
SIXPATH   := "D:\AutoHotKey Files\QoL\Icons\six_white.ico"
SEVENPATH := "D:\AutoHotKey Files\QoL\Icons\seven_white.ico"
EIGHTPATH := "D:\AutoHotKey Files\QoL\Icons\eight_white.ico"
NINEPATH  := "D:\AutoHotKey Files\QoL\Icons\nine_white.ico"

Menu, Tray, Icon, %ONEPATH%
NUMBERMODE := 0
DEFAULTMODE := 1
VIDEOMODE := 2

AUTOHOTKEYMODE := 9

currentMode := DEFAULTMODE

^!Numpad0::
currentMode := NUMBERMODE
Menu, Tray, Icon, %ZEROPATH%
return

^!Numpad1::
currentMode := DEFAULTMODE
Menu, Tray, Icon, %ONEPATH%
return

^!Numpad2::
currentMode := VIDEOMODE
Menu, Tray, Icon, %TWOPATH%
return

^!Numpad3::
currentMode := DEFAULTMODE
Menu, Tray, Icon, %THREEPATH%
return

^!Numpad4::
currentMode := DEFAULTMODE
Menu, Tray, Icon, %FOURPATH%
return

^!Numpad5::
currentMode := DEFAULTMODE
Menu, Tray, Icon, %FIVEPATH%
return

^!Numpad6::
currentMode := DEFAULTMODE
Menu, Tray, Icon, %SIXPATH%
return

^!Numpad7::
currentMode := DEFAULTMODE
Menu, Tray, Icon, %SEVENPATH%
return

^!Numpad8::
currentMode := DEFAULTMODE
Menu, Tray, Icon, %EIGHTPATH%
return

^!Numpad9::
currentMode := AUTOHOTKEYMODE
Menu, Tray, Icon, %NINEPATH%
return

; Mouse 1
F13::
onButton1(currentMode)
return

; Mouse 2
F14::
onButton2(currentMode)
return


; Mouse 3
F15::
onButton3(currentMode)
return


; Mouse 4
F16::
onButton4(currentMode)
return


; Mouse 5
F17::
onButton5(currentMode)
return


; Mouse 6
F18::
onButton6(currentMode)
return


; Mouse 7
F19::
onButton7(currentMode)
return


; Mouse 8
F20::
onButton8(currentMode)
return


; Mouse 9
F21::
onButton9(currentMode)
return


; Mouse 10
F22::
onButton10(currentMode)
return

; Mouse 11
; activates on key up to make feel nicer 
F23 Up::
onButton11(currentMode)
return


; Mouse 12
; activates on key up to make feel nicer
F24 Up::
onButton12(currentMode)
return

^+Space::reload  ; Ctrl + Shift + Space reloads the script

; automatically generated code


onButton1(currentMode)
{

; button 1
WinGet, procName, ProcessName, A

switch currentMode
{


	case 2: ; VIDEOMODE
		Send {Volume_Mute}
		return


	case 9: ; AUTOHOTKEYMODE
		GUI, MouseHotKeyList:New, , Mouse HotKey List
Gui, Add, Text,, Please enter your name:
Gui, Add, Edit, vName
Gui, Show
		return


	default:
		Send 1
}
}

onButton2(currentMode)
{

; button 2
WinGet, procName, ProcessName, A

switch currentMode
{


	case 2: ; VIDEOMODE
		Send {Volume_Down}
		return


	default:
		Send 2
}
}

onButton3(currentMode)
{

; button 3
WinGet, procName, ProcessName, A

switch currentMode
{


	case 2: ; VIDEOMODE
		Send {Volume_Up}
		return


	default:
		Send 3
}
}

onButton4(currentMode)
{

; button 4
WinGet, procName, ProcessName, A

switch currentMode
{


	case 1: ; DEFAULTMODE
		searchHighlightedText()
		return


	case 2: ; VIDEOMODE
		youtubeSend("k")
		return


	default:
		Send 4
}
}

onButton5(currentMode)
{

; button 5
WinGet, procName, ProcessName, A

switch currentMode
{


	case 1: ; DEFAULTMODE
		switch procName
		{

			case "studio64.exe": Send {Ctrl down}{NumpadSub}{Ctrl up}
		return
			case "idea64.exe": Send {Ctrl down}{NumpadSub}{Ctrl up}
		return
}

	case 2: ; VIDEOMODE
		youtubeSend("{Left}")
		return


	default:
		Send 5
}
}

onButton6(currentMode)
{

; button 6
WinGet, procName, ProcessName, A

switch currentMode
{


	case 1: ; DEFAULTMODE
		switch procName
		{

			case "studio64.exe": Send {Ctrl down}{NumpadAdd}{Ctrl up}
		return
			case "idea64.exe": Send {Ctrl down}{NumpadAdd}{Ctrl up}
		return
}

	case 2: ; VIDEOMODE
		youtubeSend("{Right}")
		return


	default:
		Send 6
}
}

onButton7(currentMode)
{

; button 7
WinGet, procName, ProcessName, A

switch currentMode
{


	case 1: ; DEFAULTMODE
		switch procName
		{

			case "studio64.exe": Send {Ctrl down}{Shift down}{Alt down}{T}{Alt up}{Shift up}{Ctrl up}
		return
			case "idea64.exe": Send {Ctrl down}{Shift down}{Alt down}{T}{Alt up}{Shift up}{Ctrl up}
		return
}

	case 2: ; VIDEOMODE
		youtubeSend("^w")
		return


	default:
		Send 7
}
}

onButton8(currentMode)
{

; button 8
WinGet, procName, ProcessName, A

switch currentMode
{


	case 1: ; DEFAULTMODE
		switch procName
		{

			case "studio64.exe": Send {Ctrl down}{Shift down}{NumpadSub}{Shift up}{Ctrl up}
		return
			case "idea64.exe": Send {Ctrl down}{Shift down}{NumpadSub}{Shift up}{Ctrl up}
		return
}

	case 2: ; VIDEOMODE
		youtubeSend("+<")
		return


	default:
		Send 8
}
}

onButton9(currentMode)
{

; button 9
WinGet, procName, ProcessName, A

switch currentMode
{


	case 1: ; DEFAULTMODE
		switch procName
		{

			case "studio64.exe": Send {Ctrl down}{Shift down}{NumpadAdd}{Shift up}{Ctrl up}
		return
			case "idea64.exe": Send {Ctrl down}{Shift down}{NumpadAdd}{Shift up}{Ctrl up}
		return
}

	case 2: ; VIDEOMODE
		youtubeSend("+>")
		return


	default:
		Send 9
}
}

onButton10(currentMode)
{

; button 10
WinGet, procName, ProcessName, A

switch currentMode
{


	case 1: ; DEFAULTMODE
		switch procName
		{

			case "brave.exe": Send {F5}
		return
}

	case 2: ; VIDEOMODE
		youtubeSend("{F5}")
		return


	case 9: ; AUTOHOTKEYMODE
		WinGetTitle, Title, A
WinGetClass, class, A
WinGet, processName, ProcessName, A
WinGet, processPath, ProcessPath, A
WinGet, uniqueID, ID, A
MsgBox, The active window's class is "%class%". The active window's process name is "%processName%". The active window's process path is "%processPath%". The active window's title is "%Title%". The active window's unique ID is "%uniqueID%".
		return


	default:
		Send 0
}
}

onButton11(currentMode)
{

; button 11
WinGet, procName, ProcessName, A

switch currentMode
{


	case 0: ; NUMBERMODE
		Send -
		return


	case 2: ; VIDEOMODE
		youtubeSend("^+{Tab}")
		return


	default:
		moveVirtualDesktop("LEFT")
}
}

onButton12(currentMode)
{

; button 12
WinGet, procName, ProcessName, A

switch currentMode
{


	case 0: ; NUMBERMODE
		Send =
		return


	case 2: ; VIDEOMODE
		youtubeSend("^{Tab}")
		return


	default:
		moveVirtualDesktop("RIGHT")
}
}


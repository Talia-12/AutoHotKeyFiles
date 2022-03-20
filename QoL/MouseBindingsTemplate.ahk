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


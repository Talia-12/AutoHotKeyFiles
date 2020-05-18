#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; [1]: http://www.autohotkey.com/

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
switch currentMode
{
	case VIDEOMODE:
		Send {Volume_Mute}
		return

	case AUTOHOTKEYMODE:
		GUI, MouseHotKeyList:New, , Mouse HotKey List
		Gui, Add, Text,, Please enter your name:
		Gui, Add, Edit, vName
		Gui, Show
		return

	default:
		Send 1
		return
}
return

; Mouse 2
F14::
switch currentMode
{
	case VIDEOMODE:
		Send {Volume_Down}
		return

	;case DEFAULTMODE:	
	;	return

	default:
		Send 2
		return
}
return


; Mouse 3
F15::
switch currentMode
{
	case VIDEOMODE:
		Send {Volume_Up}
		return

	;case DEFAULTMODE:	
	;	return

	default:
		Send 3
		return
}
return


; Mouse 4
F16::
switch currentMode
{
	case VIDEOMODE:
		youtubeSend("k")
		return

	case DEFAULTMODE:
		searchHighlightedText()
		return

	default:
		Send 4
		return
}
return


; Mouse 5
F17::
switch currentMode
{
	case VIDEOMODE:
		youtubeSend("{Left}")
		return

	case DEFAULTMODE:
		; Default behaviour of 5 for Android Studio
		; Minimise Current Code
		if WinActive("ahk_exe studio64.exe")
		{
			Send {Ctrl down}{NumpadSub}{Ctrl up}
		}
		return

	default:
		Send 5
		return
}
return


; Mouse 6
F18::
switch currentMode
{
	case VIDEOMODE:
		youtubeSend("{Right}")
		return

	case DEFAULTMODE:
		; Default behaviour of 6 for Android Studio
		; Maximise Current Code
		if WinActive("ahk_exe studio64.exe")
		{
			Send {Ctrl down}{NumpadAdd}{Ctrl up}
		}
		return

	default:
		Send 6
		return
}
return


; Mouse 7
F19::
switch currentMode
{
	case VIDEOMODE:
	youtubeSend("^w")
	return

	case DEFAULTMODE:
		; Default behaviour of 7 for Android Studio
		; type refactor selected
		if WinActive("ahk_exe studio64.exe")
		{
			Send {Ctrl down}{Shift down}{F6}{Shift up}{Ctrl up}
		}
		return

	default:
		Send 7
		return
}
return


; Mouse 8
F20::
switch currentMode
{
	case VIDEOMODE:
		youtubeSend("+<")
		return

	case DEFAULTMODE:
		; Default behaviour of 8 for Android Studio
		; Minimise Selected/All Code
		if WinActive("ahk_exe studio64.exe")
		{
			Send {Ctrl down}{Shift down}{NumpadSub}{Shift up}{Ctrl up}
		}
		return

	default:
		Send 8
		return
}
return


; Mouse 9
F21::
switch currentMode
{
	case VIDEOMODE:
		youtubeSend("+>")
		return

	case DEFAULTMODE:
		; Default behaviour of 9 for Android Studio
		; Maximise Selected/All Code
		if WinActive("ahk_exe studio64.exe")
		{
			Send {Ctrl down}{Shift down}{NumpadAdd}{Shift up}{Ctrl up}
		}
		return

	default:
		Send 9
		return
}
return


; Mouse 10
F22::
switch currentMode
{
	case AUTOHOTKEYMODE:
		WinGetTitle, Title, A
		WinGetClass, class, A
		WinGet, processPath, ProcessPath, A
		WinGet, uniqueID, ID, A
		MsgBox, The active window's class is "%class%". The active window's process path is "%processPath%". The active window's title is "%Title%". The active window's unique ID is "%uniqueID%".
		return

	case VIDEOMODE:
		youtubeSend("{F5}")
		return
	
	case DEFAULTMODE:
		; Default behaviour of 10 for Android Studio
		; rename selected
		if WinActive("ahk_exe brave.exe")
		{
			Send {F5}
		}
		if WinActive("ahk_exe studio64.exe")
		{
			Send {Shift down}{F22}{Shift up}
		}
		return

	default:
		Send 0
		return
}
return

; Mouse 11
; activates on key up to make feel nicer 
F23 Up::
switch currentMode
{
	case VIDEOMODE:
		youtubeSend("^+{Tab}")
		return

	default:
		moveVirtualDesktop("LEFT")
		return
}
return


; Mouse 12
; activates on key up to make feel nicer
F24 Up::
switch currentMode
{
	case VIDEOMODE:
		youtubeSend("^{Tab}")
		return
	
	default:
		moveVirtualDesktop("RIGHT")
		return
}
return



^+Space::reload  ; Ctrl + Shift + Space reloads the script
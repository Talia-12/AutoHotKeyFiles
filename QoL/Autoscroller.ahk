#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
^+Space::reload  ; Ctrl + Shift + Space reloads the script

#maxThreadsPerHotkey, 2
setKeyDelay, 50, 50
setMouseDelay, 50

#Include, %A_ScriptDir%\FunctionsNavigation.ahk
#Include, %A_ScriptDir%\FunctionsOpeningPnW.ahk
#Include, %A_ScriptDir%\FunctionsYoutube.ahk

!+Up:: ; Alt + Shift + Up
	While (True)
	{
		MouseClick, WU
		
		Loop, 20
		{
			Sleep 100
			if GetKeyState("Ctrl")
			{
				break
			}
		}
	}
	Return

!+Down:: ; Alt + Shift + Up

	While (True)
	{
		MouseClick, WD

		Loop, 20
		{
			Sleep 100
			if GetKeyState("Ctrl")
			{
				break
			}
		}
	}
	Return
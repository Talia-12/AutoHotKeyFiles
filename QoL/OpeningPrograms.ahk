#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include, %A_ScriptDir%\FunctionsOpeningPnW.ahk

#n::
Run Notepad.exe
return

#c::
Run calc.exe
return

^#s:: ; Ctrl + Win + s
searchHighlightedText()
return

^#Numpad0:: ; Ctrl + Win + Numpad0
openSchoolwork()
return

#+Home:: ; Win + Shift + Home
if (WinExist("ahk_exe Discord.exe"))
{
	WinActivate, ahk_exe Discord.exe
}
else
{
	Run, C:\Users\parad\AppData\Local\Discord\app-0.0.306\Discord.exe
}

#+w:: ; Win + Shift + w
WinClose, A
return

^+Space::reload  ; Ctrl + Shift + Space reloads the script
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory. #IfWinActive Warcraft III

^Numpad1::
WinGetTitle, winTitle, A
if (not(winTitle = "Warcraft III"))
{
	return
}

Send {[ down}
Send {] down}
return

^Numpad2::
WinGetTitle, winTitle, A
if (not(winTitle = "Warcraft III"))
{
	return
}

Send {[ up}
Send {] up}
return
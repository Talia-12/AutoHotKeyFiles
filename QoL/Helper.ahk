#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^+h::
MsgBox , 0, Helper Menu, Left Click Autoclicker: Alt+F1 `nRight Click Autoclicker: Alt+Shift+F1 `nSave open Chrome Tabs: Alt+j `nLoad Chrome Tabs: Alt+k `nToggle Current Window Fullscreen: Ctrl+Shift+f `nPrint Active Window: Ctrl+Alt+Shift+i `nSleep Monitor: Alt+F10 `nLock PC: Alt+Shift+F10 `nOpen Notepad: Window+n `nOepn Calculator: Window+c



^+Space::reload  ; Ctrl + Shift + Space reloads the script
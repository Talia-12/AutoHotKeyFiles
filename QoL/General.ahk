#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include, %A_ScriptDir%\FunctionsWindowinteraction.ahk

; Set toggle default states
SetNumlockState, AlwaysOn
SetScrollLockState, AlwaysOff

; Toggle full screen
^+f::
toggleFullscreen()
Return

; Print name of active window.
^!+i::
winID := "HI"
WinGet, winID, ID, A
WinGet, processID, PID, A
WinGet, winProcessName, ProcessName, A
WinGetTitle, winTitle, A
MsgBox, winTitle: %winTitle%, winID: %winID%, processID %processID%, ProcessName: %winProcessName%
Return

; set current window always on top
^Space:: ; Ctrl + Space
toggleWindowAlwaysOnTop()
Return

^+Space::reload  ; Ctrl + Shift + Space reloads the script
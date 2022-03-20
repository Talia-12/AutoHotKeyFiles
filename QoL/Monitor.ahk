#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; This is part of my AutoHotkey [1] script that turns off my monitor when I
; press alt+F10.

; It also turns the screensaver on at the same time, so that Windows Live
; Messenger (and any other programs) know I am away.

; I don't have a password on my screensaver, so there is a second version
; (Win+Shift+\) that locks the PC as well.

; Note: Sometimes the monitor comes back on after a second and I have to
; press it again. Not sure why. Adding "Sleep" to pause first didn't help.

; [1]: http://www.autohotkey.com/

If not A_IsAdmin
{
  Run *RunAs "%A_ScriptFullPath%"
  ExitApp
}

; Alt+F10
END::
!F10::
    BlockInput On
    SendMessage 0x112, 0xF170, 2, , Program Manager  ; Monitor off
    SendMessage 0x112, 0xF140, 0, , Program Manager  ; Screensaver
    Sleep 2000
    BlockInput Off
    return

; Alt+Shift+F10
!+F10::
    BlockInput On
    Run rundll32.exe user32.dll`,LockWorkStation     ; Lock PC
    Sleep 1000
    SendMessage 0x112, 0xF170, 2, , Program Manager  ; Monitor off
    Sleep 2000
    BlockInput Off
    Return



^+Space::reload  ; Ctrl + Shift + Space reloads the script
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetFormat, Float, 0.2 ;

!j::
WinGet, winID, ProcessName, A
if (not(winID = "chrome.exe"))
{
	return
}

filePath= ""
FileSelectFile, filePath, , select a file path

if ErrorLevel
{
	return
}

send, !a
sleep 500
send, ^a
sleep 100
send, ^c
sleep 100
send, !a

ClipWait
clipboard = %clipboard%
array := StrSplit(clipboard, "`n")
clipboard := ""
array := array[1]
array := StrSplit(array, A_Space)
tabNumber := intparse(array[7])

FileAppend, %tabNumber% `n, %filePath%

sleep 100

send ^1
sleep 100

Loop, %tabNumber% {
	send !d
	sleep 200
	send ^c

	ClipWait
	FileAppend, %clipboard% `n, %filePath%
	clipboard := ""

	send ^{PgDn}
	sleep 100
}
return

!k::
WinGet, winID, ProcessName, A
if (not(winID = "chrome.exe"))
{
	return
}

filePath= ""
FileSelectFile, filePath, , select a file path

if ErrorLevel
{
	return
}

linesToRead := 1
currentLineNumber := 2
currentLine := ""
FileReadline, linesToRead, %filePath%, 1
linesToRead := intparse(linesToRead)
MsgBox % linesToRead

Loop, %linesToRead% {
	send ^t
	sleep 100
	FileReadLine, currentLine, %filePath%, currentLineNumber
	clipboard := currentLine
	send ^v
	send {Enter}
	sleep 100

	currentLineNumber:= currentLineNumber + 1
}
Return

intparse(str) {

	str = %str% ; removes formatting

	Loop, Parse, str ; parse through each character

		If A_LoopField in 0,1,2,3,4,5,6,7,8,9,.,+,-

			int = %int%%A_LoopField% ; build integer

	Return, int + 0.0 ; returns real number

}
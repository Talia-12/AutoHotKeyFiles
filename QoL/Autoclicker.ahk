#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
^+Space::reload  ; Ctrl + Shift + Space reloads the script

#maxThreadsPerHotkey, 2
setKeyDelay, 50, 50
setMouseDelay, 50
shouldLeftClick:=0
shouldRightClick:=0

!f1::
	; shouldLeftClick:=!shouldLeftClick .... This assigns shouldLeftClick to the value of NOT (!) shouldLeftClick. so lets
	; say shouldLeftClick starts out FALSE (0). you then turn shouldLeftClick to NOT FALSE. which is
	; TRUE (1). so now shouldLeftClick is set to TRUE. and then lets say you toggle it again.
	; you set shouldLeftClick to NOT TRUE, which is FALSE. shouldLeftClick is now set to FALSE. 
	; .... 1 is true, 0 is false. ! is NOT.
	shouldLeftClick:=!shouldLeftClick
	shouldRightClick:=0
	
	while (shouldLeftClick=1)
	{
		Click, left
		sleep, 10
	}
	return


!+f1::
	; shouldRightClick:=!shouldRightClick .... This assigns shouldRightClick to the value of NOT (!) shouldRightClick. so lets
	; say shouldRightClick starts out FALSE (0). you then turn shouldRightClick to NOT FALSE. which is
	; TRUE (1). so now shouldRightClick is set to TRUE. and then lets say you toggle it again.
	; you set shouldRightClick to NOT TRUE, which is FALSE. shouldRightClick is now set to FALSE. 
	; .... 1 is true, 0 is false. ! is NOT.
	shouldRightClick:=!shouldRightClick
	shouldLeftClick:=0
	
	while (shouldRightClick=1)
	{
		Click, right
		sleep, 10
	}
	return
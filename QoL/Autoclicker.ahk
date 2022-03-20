#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

If not A_IsAdmin
{
  Run *RunAs "%A_ScriptFullPath%"
  ExitApp
}

#maxThreadsPerHotkey, 2
setKeyDelay, 50, 50
setMouseDelay, 50

shouldLeftClick  := 0
shouldHoldLeft   := 0
shouldRightClick := 0
shouldHoldRight  := 0

shiftDown := 0

!F1::
	; shouldLeftClick:=!shouldLeftClick .... This assigns shouldLeftClick to the value of NOT (!) shouldLeftClick. so lets
	; say shouldLeftClick starts out FALSE (0). you then turn shouldLeftClick to NOT FALSE. which is
	; TRUE (1). so now shouldLeftClick is set to TRUE. and then lets say you toggle it again.
	; you set shouldLeftClick to NOT TRUE, which is FALSE. shouldLeftClick is now set to FALSE. 
	; .... 1 is true, 0 is false. ! is NOT.
	shouldLeftClick:=!shouldLeftClick

	shouldHoldLeft:=0
	shouldRightClick:=0
	shouldHoldRight:=0
	
	while (shouldLeftClick=1)
	{
		Click, left
		sleep, 10
	}
	return


!F2::
	; shouldRightClick:=!shouldRightClick .... This assigns shouldRightClick to the value of NOT (!) shouldRightClick. so lets
	; say shouldRightClick starts out FALSE (0). you then turn shouldRightClick to NOT FALSE. which is
	; TRUE (1). so now shouldRightClick is set to TRUE. and then lets say you toggle it again.
	; you set shouldRightClick to NOT TRUE, which is FALSE. shouldRightClick is now set to FALSE. 
	; .... 1 is true, 0 is false. ! is NOT.
	shouldRightClick:=!shouldRightClick

	shouldLeftClick:=0
	shouldHoldLeft:=0
	shouldHoldRight:=0
	
	while (shouldRightClick=1)
	{
		Click, right
		sleep, 10
	}
	return

!+F1::
	shouldHoldLeft:=!shouldHoldLeft
	
	shouldLeftClick:=0
	shouldRightClick:=0
	shouldHoldRight:=0

	if (shouldHoldLeft)
	{
		Click, Down
	}
	else
	{
		Click, Up
	}
	return

!+F2::
	shouldHoldRight:=!shouldHoldRight
	
	shouldLeftClick:=0
	shouldHoldLeft:=0
	shouldRightClick:=0

	if (shouldHoldRight)
	{
		Click, Down, Right
	}
	else
	{
		Click, Up, Right
	}
	return

^!PgDn::
	shiftDown := !shiftDown

	if (shiftDown)
	{
		Send, {Shift Down}
	}
	else
	{
		Send, {Shift Up}
	}

^+Space::reload  ; Ctrl + Shift + Space reloads the script
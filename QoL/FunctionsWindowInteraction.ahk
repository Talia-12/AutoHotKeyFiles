toggleFullscreen()
{
	WinGetPos, winX, winY, winWidth, winHeight, A  ; "A" to get the active window's pos.
	if ( winX == -8 and winY == -8) {
		WinRestore, A
	} else
	{
		WinMaximize, A
	}
}

toggleWindowAlwaysOnTop()
{
	Winset, AlwaysOnTop, , A
}
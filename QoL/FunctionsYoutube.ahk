youtubeSend(key)
{
	IfWinNotActive, ahk_exe brave.exe
	{
		winGet, uniqueID, ID, A
		WinActivate, ahk_exe brave.exe

		Sleep, 25

		Send %key%

		Sleep, 25

		WinActivate, ahk_id %uniqueID%
	}
	else
	{
		Send %key%
	}
}
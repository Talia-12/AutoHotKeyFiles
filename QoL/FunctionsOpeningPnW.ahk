searchHighlightedText()
{
	Send, ^c
	Sleep 50
	Run, http://www.google.com/search?q=%Clipboard%
}

openSchoolwork()
{
	Run "D:\Schoolwork"
}

focusChrome()
{
	IfWinNotActive, ahk_exe chrome.exe
	WinActivate, ahk_exe chrome.exe
}
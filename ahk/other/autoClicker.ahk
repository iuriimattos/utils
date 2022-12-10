#MaxThreadsPerHotkey 3

XButton2::
Toggle := !Toggle
Loop
{
	If (!Toggle)
		Break
	Click
	Sleep 500 ; Make this number higher for slower clicks, lower for faster.
}
Return
Pause::ExitApp
LButton::
RButton::
	If (A_PriorHotkey=A_ThisHotkey && A_TimeSincePriorHotkey < 150)
		return
	Send {%A_ThisHotkey% down}
	KeyWait %A_ThisHotkey%
	Send {%A_ThisHotkey% up}
Return
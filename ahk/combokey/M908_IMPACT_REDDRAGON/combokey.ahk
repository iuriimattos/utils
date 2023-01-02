Menu, Tray, Icon , Shell32.dll, 1, 1
;Cliente VPN do Azure
;ahk_class ApplicationFrameWindow
;ahk_exe ApplicationFrameHost.exe
;ahk_pid 14612

#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
;Pause::Reload

^+!F1::
	beforeReleaseComboKeys("cofirm_text")
	; foo bar
	afterReleaseComboKeys()
Return

;toggle vpn if connect button is focus
^+!F2::
	beforeReleaseComboKeys("cofirm_text")
	; foo bar
	afterReleaseComboKeys()
Return

;botao de lado atras
^+!F3::
	beforeReleaseComboKeys("cofirm_text")
	; foo bar
	afterReleaseComboKeys()
Return

;teams brb
^+!F4::
	beforeReleaseComboKeys("cofirm_text")
	; foo bar
	afterReleaseComboKeys()
Return

;botao de lado frente
^+!F12::
	beforeReleaseComboKeys("cofirm_text")
	; foo bar
	afterReleaseComboKeys()
Return

afterReleaseComboKeys()
{
	KeyList := "Ctrl|Shift|Alt" ; and so on
	Loop, Parse, KeyList, |
	{
		If GetKeystate(A_Loopfield, "P")
			Send % "{" A_Loopfield " Up}"
	}
}

beforeReleaseComboKeys("cofirm_text")
{
	MsgBox, 4,, %str% ?
	IfMsgBox Yes
		Return
	else
		Reload
}
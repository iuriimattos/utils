Menu, Tray, Icon , Shell32.dll, 101, 1
#IfWinActive, ahk_exe chrome.exe
MButton::
    KeyWait, MButton, T0.1
    If !(ErrorLevel)
    { 
        Sleep, 300
        If (A_PriorHotKey = "MButton Up") ; double click
            Send, ^w
        else                              ; single click
            Send, {MButton}
    }
    else                                  ; push-and-hold
        Send, {F11}
return
MButton Up:: return
#IfWinActive

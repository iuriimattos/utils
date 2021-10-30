; credits
; https://stackoverflow.com/questions/57311941/make-capslock-work-properly-when-single-double-and-combo-pressed/57323509#57323509
Menu, Tray, Icon , Shell32.dll, 75, 1
Capslock::
    If (A_PriorHotKey = "~Capslock Up" AND A_TimeSincePriorHotkey < 400 AND A_TimeSincePriorHotkey > 50) ; double-press
        Send, {Esc} 
    SetTimer, RestoreCapslockState, 50
return

~Capslock Up:: return ; The tilde prefix (~) prevents AHK from blocking the key-down/up events

CapsLock & A::Send {Left}
CapsLock & S::Send {Down}
CapsLock & D::Send {Right}
CapsLock & W::Send {Up}
CapsLock & I::Send {HOME}
CapsLock & L::Send {PGDN}
CapsLock & O::Send {PGUP}
CapsLock & K::Send {END}
CapsLock & J::Send {DEL}
CapsLock & U::Send {INSERT}

RestoreCapslockState:   
    KeyWait, Capslock ; wait for Capslock to be released
    SetTimer, RestoreCapslockState, OFF
    If (A_PriorKey != "Capslock") 
        SetCapsLockState % !GetKeyState("CapsLock", "T") ; Toggles CapsLock to its opposite state, requires [v1.1.30+]
return

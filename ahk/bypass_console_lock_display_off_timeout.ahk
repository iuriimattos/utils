#Persistent
SetTimer, PressTheKey, 60000
esc::ExitApp
Return

PressTheKey:
Send, #d
Sleep, 250
Send, #d
Return
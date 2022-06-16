#IfWinActive, ahk_exe chrome.exe
Esc::ExitApp
F1::
Send, ^{Click}
return
F2::
Toggle := !Toggle
loop
{
    If not Toggle
        break
    SendInput, ^{PgDn}
    Sleep 4000
    Send, {Click}
}
return

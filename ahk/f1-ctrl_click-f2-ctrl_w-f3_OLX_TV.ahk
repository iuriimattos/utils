#IfWinActive, ahk_exe chrome.exe
F1::
Send, {Ctrl Down}{Click}{Ctrl up}
Return
F2::
Send ^w
Return
F4::
Send ^{END}
Return
F5::
Send, Aparece alguma imagem? Se sim, pode me enviar um video? pretendo usar para leitura
Send, {ENTER}
Sleep, 1000
Send, Na OLX tem esta TV com seu numero
Send, {ENTER}
Return
F6::
Send, Aparece alguma imagem? Se sim, pode me enviar um video no WhatsApp?
Send, {ENTER}
Sleep, 1000
Send, 996535215
Send, {ENTER}
Sleep, 1000
Send, pretendo usar para leitura
Send, {ENTER}
Return
#IfWinActive
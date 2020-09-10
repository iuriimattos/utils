;https://stackoverflow.com/a/57325070/7858797
#SingleInstance Force
#installKeybdHook
#Persistent
Menu, Tray, Tip, Medical Alert
SetKeyDelay, 50
Menu, Tray, Icon , Shell32.dll, 145, 1
TrayTip, Medical Alert, Started, 1

Gui +LastFound 
hWnd := WinExist()
DllCall( "RegisterShellHookWindow", UInt,Hwnd )
MsgNum := DllCall( "RegisterWindowMessage", Str,"SHELLHOOK" )
OnMessage( MsgNum, "ShellMessage" )
Return

ShellMessage( wParam ) ; Run on Window switch
{
    If (wParam = 4) ; If Window Changed
    {        
        WinGetActiveTitle, Title
        if instr(Title, "Past Medical History") OR instr(Title, "Allergies Verified") ; TESTED WITH: if instr(Title, "NotePad")
            MsgBox, 1, Allergies Verified, Please verify patient allergies
    }
}
Return
; https://www.autohotkey.com/boards/viewtopic.php?t=99157
#Requires AutoHotkey v2.0-
#Warn
#SingleInstance


;-----------------------------------------------------------------------------------------------------------
; Taken from docs : https://www.autohotkey.com/docs/commands/Run.htm#RunAs

full_command_line := DllCall("GetCommandLine", "str")

if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try
    {
        if A_IsCompiled
            Run '*RunAs "' A_ScriptFullPath '" /restart'
        else
            Run '*RunAs "' A_AhkPath '" /restart "' A_ScriptFullPath '"'
    }
    ExitApp
}
;-----------------------------------------------------------------------------------------------------------

; Use Alt+MouseWheel instead on Alt-tab to switch between windows.
; The following would switch only between unminimized windows. Use WinGetListAlt() to get full control.

Hotkey("!WheelDown", (*) => AltMousewheel("Dn"))
Hotkey("!WheelUp",   (*) => AltMousewheel("Up"))

AltMousewheel(Option)
{
    Static Count    :=  0
         , Counter  :=  0
         , List     :=  []

    Local Hwnd

    If ( Option  =   "Clear" )
         Return ( List     :=  []
                , Count    :=  0
                , Counter  :=  0
                , Tooltip()
                )

    If ( Count = 0 )
         List     :=  WinGetListAlt(,,,,1)
       , Count    :=  List.Length
       , Counter  :=  0
 
    If not Count
       Return

    Counter  :=  Counter + ( Option = "Up" ? 1 :  -1 )
    Counter  :=  Counter > Count ? 1 : Counter < 1 ? Count : Counter


  , Hwnd  :=  DllCall("User32\GetAncestor", "ptr",List[Counter], "int",3, "ptr") ; GA_ROOTOWNER 3
  , Hwnd  :=  DllCall("User32\GetLastActivePopup", "ptr",Hwnd, "ptr")

    Try WinActivate(Hwnd)
    SetTimer((*) => AltMonitor(), 250)

                    AltMonitor(*)
                    {
                        Tooltip Counter "/" Count Chr(10) WinGetTitle(List[Counter])
                        If GetKeyState("Alt", "P") = False
                           SetTimer(, 0)
                         , SetTimer((*) => AltMousewheel("Clear"), -1)
                    }
}

;= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
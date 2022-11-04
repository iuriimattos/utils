Menu, Tray, Icon , Shell32.dll, 75, 1

if !A_IsAdmin
    Run, % "*RunAs " (A_IsCompiled ? "" : A_AhkPath " ") Chr(34) A_ScriptFullPath Chr(34)

; credits
; https://stackoverflow.com/a/57323509
Capslock::
   If (A_PriorHotKey = "~Capslock Up" AND A_TimeSincePriorHotkey < 400 AND A_TimeSincePriorHotkey > 50) ; double-press
   Send, {Esc}
   SetTimer, RestoreCapslockState, 50
return

~Capslock Up:: return ; The tilde prefix (~) prevents AHK from blocking the key-down/up events

RestoreCapslockState:
   KeyWait, Capslock ; wait for Capslock to be released
   SetTimer, RestoreCapslockState, OFF
   If (A_PriorKey != "Capslock")
      SetCapsLockState % !GetKeyState("CapsLock", "T") ; Toggles CapsLock to its opposite state, requires [v1.1.30+]
return
 
CapsLock & A::MoveCursor("{LEFT}")
CapsLock & S::MoveCursor("{DOWN}")
CapsLock & W::MoveCursor("{UP}")
CapsLock & D::MoveCursor("{RIGHT}")
CapsLock & I::MoveCursor("{HOME}")
CapsLock & K::MoveCursor("{END}")
CapsLock & O::MoveCursor("{PGUP}")
CapsLock & L::MoveCursor("{PGDN}")
CapsLock & J::MoveCursor("{DEL}")
CapsLock & U::MoveCursor("{INSERT}")
 
; credits
; https://stackoverflow.com/a/65189128
MoveCursor(key) {
   control := GetKeyState("CONTROL","P")
   shift := GetKeyState("SHIFT","P")
   alt := GetKeyState("ALT","P")
   win := GetKeyState("LWIN","P")
   ctrlShift := control && shift
   ctrlAlt := control && alt
   altShift := alt && shift
   ctrlAltShift := control && alt && shift
   if ctrlAltShift {
      Send, ^!+%key%
   } else if altShift {
   Send, !+%key%
} else if ctrlShift {
   Send, ^+%key%
} else if ctrlAlt {
   Send, ^!%key%
} else if control {
   Send, ^%key%
} else if shift {
   Send, +%key%
} else if alt {
   Send, !%key%
} else if win {
   Send, #%key%
}else  {
   Send, %key%
}}

; credits pretty code
; http://sl5.it/SL5_preg_contentFinder/examples/AutoHotKey/converts_your_autohotkey_code_into_pretty_indented_source_code.php

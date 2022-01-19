XButton2 & LButton::       ZoomIn()
XButton2 & RButton::       ZoomOut()

ZoomIn(){
   Critical
   Send, {Blind}#{NumPadAdd}
   PostMessage, 0x112, 0xF020,,, ahk_class MagUIClass
; This is the line you are looking for! ^^
}

ZoomOut(){
   Critical
   if !WinExist("ahk_class MagUIClass")
      return
   Send, {Blind}#{NumPadSub}
   PostMessage, 0x112, 0xF020,,, ahk_class MagUIClass
   KeyWait, RButton, T0.7                                   ;Waits for key release. If it does not occur, ErrorLevel = 1. 
   if ErrorLevel
      PostMessage, 0x112, 0xF060,,, ahk_class MagUIClass
   return
}
CapsLock & f:: Send, ^f                                              ;|
;=====================================================================o
;                            CapsLock Editor                         ;|
;-----------------------------------o---------------------------------o
;                     CapsLock + z  |  Ctrl + z (Cancel)             ;|
;                     CapsLock + z  |  Ctrl + z (Cancel)             ;|
;                     CapsLock + x  |  Ctrl + x (Cut)                ;|
;                     CapsLock + c  |  Ctrl + c (Copy)               ;|
;                     CapsLock + v  |  Ctrl + v (Paste)              ;|
;                     CapsLock + y  |  Ctrl + y (Yeild)              ;|
;                     CapsLock + a  |  Ctrl + Right(Move as [vim: w]);|
;                     CapsLock + d  |  Ctrl + Left (Move as [vim: b]);|
;-----------------------------------o---------------------------------o
CapsLock & z:: Send, ^z                                              ;|
CapsLock & x:: Send, ^x                                              ;|
CapsLock & c:: Send, ^c                                              ;|
CapsLock & v:: Send, ^v                                              ;|
CapsLock & y:: Send, ^y                                              ;|
CapsLock & w:: Send, ^{Up}                                           ;|
CapsLock & s:: Send, ^{Down}                                         ;|
CapsLock & a:: Send, ^{Left}                                         ;|
CapsLock & d:: Send, ^{Right}                                        ;|
;---------------------------------------------------------------------o

;=====================================================================o
;                    CapsLock Direction Navigator                    ;|
;-----------------------------------o---------------------------------o
;                      CapsLock + h |  Left                          ;|
;                      CapsLock + j |  Down                          ;|
;                      CapsLock + k |  Up                            ;|
;                      CapsLock + l |  Right                         ;|
;                      Ctrl, Alt Compatible                          ;|
;-----------------------------------o---------------------------------o
MoveCursor(key) {                                                    ;|
    control := GetKeyState("CONTROL","P")                            ;|
    shift := GetKeyState("SHIFT","P")                                ;|
    alt := GetKeyState("ALT","P")                                    ;|
    win := GetKeyState("LWIN","P")                                   ;|
    ctrlShift := control && shift                                    ;|
    ctrlAlt := control && alt                                        ;|
    altShift := alt && shift                                         ;|
    ctrlAltShift := control && alt && shift                          ;|
    if ctrlAltShift {                                                ;|
       Send, ^!+%key%                                                ;|
    } else if altShift {                                             ;|
    Send, !+%key%                                                    ;|
 } else if ctrlShift {                                               ;|
    Send, ^+%key%                                                    ;|
 } else if ctrlAlt {                                                 ;|
    Send, ^!%key%                                                    ;|
 } else if control {                                                 ;|
    Send, ^%key%                                                     ;|
 } else if shift {                                                   ;|
    Send, +%key%                                                     ;|
 } else if alt {                                                     ;|
    Send, !%key%                                                     ;|
 } else if win {                                                     ;|
    Send, #%key%                                                     ;|
 }else  {                                                            ;|
    Send, %key%                                                      ;|
 }}                                                                  ;|
;-----------------------------------o---------------------------------o
CapsLock & h::MoveCursor("{LEFT}")                                   ;|
;-----------------------------------o                                ;|
CapsLock & j::MoveCursor("{DOWN}")                                   ;|
;-----------------------------------o                                ;|
CapsLock & k::MoveCursor("{UP}")                                     ;|
;-----------------------------------o                                ;|
CapsLock & l::MoveCursor("{RIGHT}")                                  ;|
;---------------------------------------------------------------------o

;=====================================================================o
;                     CapsLock Mouse Controller                      ;|
;-----------------------------------o---------------------------------o
;                   CapsLock + Up   |  Mouse Up                      ;|
;                   CapsLock + Down |  Mouse Down                    ;|
;                   CapsLock + Left |  Mouse Left                    ;|
;                  CapsLock + Right |  Mouse Right                   ;|
;    CapsLock + Enter(Push Release) |  Mouse Left Push(Release)      ;|
;-----------------------------------o---------------------------------o
CapsLock & Up::    MouseMove, 0, -10, 0, R                           ;|
CapsLock & Down::  MouseMove, 0, 10, 0, R                            ;|
CapsLock & Left::  MouseMove, -10, 0, 0, R                           ;|
CapsLock & Right:: MouseMove, 10, 0, 0, R                            ;|
;-----------------------------------o                                ;|
CapsLock & Enter::                                                   ;|
SendEvent {Blind}{LButton down}                                      ;|
KeyWait Enter                                                        ;|
SendEvent {Blind}{LButton up}                                        ;|
return                                                               ;|
;---------------------------------------------------------------------o
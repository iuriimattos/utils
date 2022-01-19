LB = VK0E   ;pick some unused virtual codes:
RL = VK0F   ;http://msdn2.microsoft.com/en-us/library/ms645540.aspx

Loop
{
   Input,key,L1 V,{%LB%}{%RB%}{LControl}{RControl}{LAlt}{RAlt}{LWin}{RWin}{RShift}{LShift}{AppsKey}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BS}{Capslock}{Numlock}{PrintScreen}{Pause}
   IfInString,ErrorLevel,EndKey:	;if endkey exists, convert to key
   {	key := RegExReplace(ErrorLevel,"EndKey:","")
   }
   keyDN := GetKeyState("down","P")	;get physical state of down and up keys
   keyUP := GetKeyState("up","P")	;must do this because rightclick remap yields "down" and "up" - don't know why
   
   If(key = "down") and (!keyDN) ;right mouse button clicked
   {	key = RButton
   }
   If(key = "up") and (!keyUP)	;right mouse released
   {	key = RButton
   }
   If(key = "not found") and (LB_Flag)    ;left mouse button clicked - leftclick remap yields "not found" - probably because VK0E is undefined
   {	key = LButton
   }

   tooltip,Key pressed or mouse clicked!`nwhat you pressed: %key%

}


~*LButton::  	;map left click to the Virtual Keywait
   LB_Flag = 1
   SetKeyDelay -1
   Send {Blind}{%LB% Down} 
Return
~*LButton up::
   SetKeyDelay -1
   Send {Blind}{%LB% Up} 
   LB_Flag = 0
Return

~*RButton::  	;map right click to the Virtual Key
   RB_Flag = 1
   SetKeyDelay -1
   Send {Blind}{%RB% Down} 
Return
~*RButton up::
   SetKeyDelay -1
   Send {Blind}{%RB% Up} 
   RB_Flag = 0
Return

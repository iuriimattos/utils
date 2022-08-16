Menu, Tray, Icon , Shell32.dll, 57, 1
;https://autohotkey.com/board/topic/113555-the-mystery-of-windows-magnifier/?p=663173
/*
===========================
WINDOW RESIZING
===========================
*/


Resize(x, y, width, height)
{
WinGetTitle, title, A
WinMove, %title%, , x,y,width,height
Click 0,0,0
return
}


mouseMove(hotkeyValue)
{
if (hotkeyValue = 4)
{
click 360,180,0
return
}
else
{
click 60,180,0
return
}
}


magnifyChecker(hotkeyValue)
{
static previousResize


if (previousResize = hotkeyValue)
{
;MsgBox, in equal than - previousResize = %previousResize% - hotkeyValue = %hotkeyValue%
return
}
else if (previousResize > hotkeyValue)
{
loopLength := previousResize - hotkeyValue
Loop, %loopLength%
{
Send #=
Sleep, 200
}
previousResize = %hotkeyValue%
return
}
else if (previousResize < hotkeyValue)
{
loopLength := hotkeyValue - previousResize
Loop, %loopLength%
{
Send #-
Sleep, 200
}
;MsgBox, in less than - previousResize = %previousResize% - hotkeyValue = %hotkeyValue%
previousResize = %hotkeyValue%
return
}
else
{
;MsgBox, in neither than - previousResize = %previousResize% - hotkeyValue = %hotkeyValue%
previousResize = %hotkeyValue%
return
}
}

;XButton2 & LButton::
;esize(0,0,965,545)
;magnifyChecker(0)
;mouseMove(0)
;return
;+F10::
;Resize(0,0,1102,622)
;magnifyChecker(1)
;mouseMove(1)
;return
;+F11::
;Resize(0,0,1285,725)
;magnifyChecker(2)
;mouseMove(2)
;return
;+F12::
;Resize(0,0,1545,870)
;magnifyChecker(3)
;mouseMove(3)
;return
;XButton2 & RButton::
;Resize(0,0,1928,1050)
;magnifyChecker(4)
;mouseMove(4)
;return

+F1::
Resize(0,0,965,545)
magnifyChecker(0)
mouseMove(0)
return


+F2::
Resize(0,0,1102,622)
magnifyChecker(1)
mouseMove(1)
return


+F3::
Resize(0,0,1285,725)
magnifyChecker(2)
mouseMove(2)
return


+F4::
Resize(0,0,1545,870)
magnifyChecker(3)
mouseMove(3)
return


+F5::
Resize(0,0,1928,1050)
magnifyChecker(4)
mouseMove(4)
return
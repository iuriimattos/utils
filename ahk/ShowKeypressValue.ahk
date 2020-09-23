;https://stackoverflow.com/a/53738082
#SingleInstance force
Gui, +AlwaysOnTop -MaximizeBox ; -Caption +Resize -MinimizeBox +Disabled -SysMenu -Owner +OwnDialogs
Gui, Add, Text, center y10 h50 w300 vVar,  %KeypressValue%
Gui, Color, White
Gui, show
size=20
Gui, Font, s%size%
GuiControl, Font, var

;run KeypressValueToREG.ahk - together with ShowKeypressValue.ahk
;The Features Are:
; - It will Show On your Screen, [All your Mouse Movements] and [All Keyboard Shortcuts Movement]
; - You can Make Scripts, that can do actions with MultiClicks on All Keyboard Shortcuts Clicks, How Cool Is that. 

loop
{
RegRead, KeypressValue, HKEY_CURRENT_USER,software\GetKeypressValue,KeypressValue ; read KeypressValue
sleep 50
GuiControl,, var, %KeypressValue%



if (KeypressValue="Alt ( * 2 )") ;use this for [1x=Alt][2x=Alt ( * 2 )][3x=Alt ( * 3 )] [and many more]
{
;Here you can put any AHK CODE 
msgbox you did click Alt 2x Times
}

if (KeypressValue="Alt ( * 3 )") ;use this for [1x=Alt][2x=Alt ( * 2 )][3x=Alt ( * 3 )] [and many more]
{
;Here you can put any AHK CODE 
msgbox you did click Alt 3x Times
}


} ;End Loop

~esc::exitapp
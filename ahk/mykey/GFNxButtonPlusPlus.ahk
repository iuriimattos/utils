;Core™ no GeForce NOW
;ahk_class CEFCLIENT
;ahk_exe GeForceNOW.exe
;ahk_pid 7012

#MaxThreadsPerHotkey 1
MButton::Reload
'::'
Pause::Reload

set() {
    Send, {TAB}
    Sleep, 200
}
reset() {
    Send, {TAB}
    Sleep, 200
    Send, {TAB}
    Sleep, 200    
}

#IfWinActive ahk_exe GeForceNOW.exe ahk_class CEFCLIENT
    '::NumLock
    	
    XButton1::LClickTime := A_TickCount
    XButton1 Up::
        if (A_TickCount - RClickTime < 300) {                    
                Send, {LButton}
                Sleep 750
                set()
                Send, {LButton}
                Reload
        }       
    return

    XButton2::RClickTime := A_TickCount
    XButton2 Up::
        if (A_TickCount - RClickTime < 300) {
                reset()
                Send, 1
                Sleep 750
                Send, {RButton}
                Reload
        }
        if (A_TickCount - RClickTime > 600) {
            Loop {            
    	    reset()
                Send, {RButton}
                Sleep, 500
            }        
        }                
    return
#IfWinActive ; turn off context sensitivity

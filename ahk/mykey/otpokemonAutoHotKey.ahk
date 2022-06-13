Return
Esc::Suspend
; 1 If Tibia window is active then apply hotkeys.

#IfWinActive, otPokemon | Casadocomcristo

; 2 Apply movement keys and chat binding.

^Enter::Suspend
w::Up
a::Left
s::Down
d::Right
q::NumpadHome
e::NumpadPgUp
z::NumpadEnd
c::NumpadPgDn

; 3 Swap modifier key bindings

CapsLock::LShift
LShift::LCtrl

; 4 Function Key Bindings

Space::F12
r::F11
f::F10

; 5 Bind X to Mount Hotkey (change '^R' to FKey if you would prefer a extra hotkey binding)

x::^R

;6 Modify client shortcuts to keys

;p::^p ;Vip List
;i::^s ;Skills
;k::^k ;Hotkeys
;g::^g ;Change Character
;l::^l ;Logout Character

#MaxThreadsPerHotkey 3
#z::  ; Win+Z hotkey (change this hotkey to suit your preferences).
#MaxThreadsPerHotkey 1
if KeepWinZRunning  ; This means an underlying thread is already running the loop below.
{
    KeepWinZRunning := false  ; Signal that thread's loop to stop.
    SendInput {F1 up}{F1 down}  
    SendInput {F2 up}{F2 down}  
    SendInput {F3 up}{F3 down}
    SendInput {F4 up}{F4 down}
    SendInput {F5 up}{F5 down}
    return  ; End this thread so that the one underneath will resume and see the change made by the line above.
}
; Otherwise:
KeepWinZRunning := true
Loop
{
    ; The next four lines are the action you want to repeat (update them to suit your preferences):
    ToolTip, Press Win-Z again to stop this from flashing.
    Sleep 1000
    ToolTip
    Sleep 1000
    ; But leave the rest below unchanged.
    if not KeepWinZRunning  ; The user signaled the loop to stop by pressing Win-Z again.
        break  ; Break out of this loop.
}
KeepWinZRunning := false  ; Reset in preparation for the next press of this hotkey.
return
#MaxThreadsPerHotkey 2
#IfWinActive, otPokemon | Casadocomcristo
    '::
        {
        Toggle:=!Toggle

        While, Toggle
            {
                ToolTip, Macro Ativado.
                Sleep 100
                SendInput {F1}  
                Sleep 100
                SendInput {F2}  
                Sleep 100
                SendInput {F3}
                Sleep 100
                SendInput {F4}
                Sleep 100
                SendInput {F5}
                Sleep 100
                SendInput {F6}                
                ToolTip
                Sleep 2000
            }
        }
        return
    Esc::
        Suspend
        return
    Pause::
        Pause
        return
        ; 1 If Tibia window is active then apply hotkeys.
        ; 2 Apply movement keys and chat binding.
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
        r::F12
        f::F11
        v::F10
        ; 5 Bind X to Mount Hotkey (change '^R' to FKey if you would prefer a extra hotkey binding)
        ;x::^R
        ;6 Modify client shortcuts to keys
        ;p::^p ;Vip List
        ;i::^s ;Skills
        ;k::^k ;Hotkeys
        ;g::^g ;Change Character
        ;l::^l ;Logout Character

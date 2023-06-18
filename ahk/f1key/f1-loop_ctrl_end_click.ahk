Pause::ExitApp
#MaxThreadsPerHotkey 2
F1::
Toggle := !Toggle
loop
{
    If not Toggle
        break

	Send, ^{End}
	MouseClick, left
}
return
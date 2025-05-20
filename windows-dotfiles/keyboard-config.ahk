#Requires AutoHotkey v2.0

; --- CAPSLOCK: Tap = Esc, Hold (150ms) = Ctrl ---
capsIsDown := false

*CapsLock::
{
    capsIsDown := true
    t := A_TickCount

    while GetKeyState("CapsLock", "P")
    {
        if (A_TickCount - t > 120)
        {
            Send("{Blind}{Ctrl Down}")
            while GetKeyState("CapsLock", "P")
                Sleep(10)
            Send("{Blind}{Ctrl Up}")
            capsIsDown := false
            return  ; Prevent default CapsLock behavior
        }
        Sleep(10)
    }

    if capsIsDown {
        Send("{Esc}")
    }
    return
}

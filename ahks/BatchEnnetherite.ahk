Sleep, 10000

Loop, 64
{
    SetTitleMatchMode, 2
    CoordMode, Mouse, Screen

    tt = Minecraft 1.16.5 - ATM-6 - Multiplayer (3rd-party ahk_class GLFW30
    WinWait, %tt%
    IfWinNotActive, %tt%,, WinActivate, %tt%
        Sleep, 1367

    ; Select the Netherite
    MouseClick, L, 1902, 965
    Sleep, 500
    ; Release the Netherite
    MouseClick, L, 1902, 965
    ; Shift-click the result into the inventory
    Send, {Blind}{Shift Down}
    MouseClick, L, 2069, 972
    Send, {Blind}{Shift Up}
}

^x::
    If (rtoggle := !rtoggle) {
        Send {RButton Down}
        SoundBeep, 1000, 20
    } Else {
        Send {RButton Up}
        SoundBeep, 1500, 20
    }
Return

^y::
    If (ltoggle := !ltoggle) {
        Send {LButton Down}
        SoundBeep, 1000, 20
    } Else {
        Send {LButton Up}
        SoundBeep, 1500, 20
    }
Return
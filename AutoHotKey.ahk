; Natural rolling
WheelUp::WheelDown
WheelDown::WheelUp
WheelLeft::WheelRight
WheelRight::WheelLeft
; Empty recycler
#c:: FileRecycleEmpty
; Stick window
#s:: WinSet, Topmost,, A
; Transparent window
~LShift & WheelUp:: WinSet, Transparent, 255, A
~LShift & WheelDown:: WinSet, Transparent, 200, A


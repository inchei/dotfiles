; Natural rolling
WheelUp::WheelDown
WheelDown::WheelUp
WheelLeft::WheelRight
WheelRight::WheelLeft
; Empty recycler
#c::
FileRecycleEmpty
MsgBox,0x40,　提示,回收站已清空。,
return
; Stick window
#s:: WinSet, Topmost,, A
; Transparent window
~LShift & WheelUp:: WinSet, Transparent, 255, A
~LShift & WheelDown:: WinSet, Transparent, 200, A
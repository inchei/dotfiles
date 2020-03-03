; 屏蔽 win 键弹出菜单
~LWin::Send {Blind}{vk07}
return

; 移除 ToolTip
RemoveToolTip:
ToolTip
return

; 快捷左右滑動
Alt & WheelDown:: WheelRight
Alt & WheelUp:: WheelLeft

; 清空回收站
LWin & C::
FileRecycleEmpty
MsgBox,0x40,　提示,回收站已清空。,
return

; 置頂窗口
LWin & S::
WinSet, AlwaysOnTop, Toggle, A
return

; 複製文件路徑
^+c::
send ^c
sleep,200
Clipboard=%clipboard%
ToolTip, %clipboard%
SetTimer, RemoveToolTip, -1000
return

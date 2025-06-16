; 屏蔽 win 键弹出菜单
~LWin::Send {Blind}{vk07}
return

; 清空回收站
LWin & C::
FileRecycleEmpty
MsgBox,0x40,　提示,回收站已清空。,
return

; Shift + 鼠標滾輪 窗口透明度漸變
; Shift + 鼠標中鍵 透明度為100%

; 移除 ToolTip
RemoveToolTip:
ToolTip
return

~LShift & WheelUp::
; 增加透明度
WinGet, Transparent, Transparent, A
If (Transparent="")
    Transparent=255
    Transparent_New:=Transparent+10  ; 速度
    If (Transparent_New > 254)
        Transparent_New =255
    WinSet,Transparent, %Transparent_New%, A
 
    ToolTip, 透明度: %Transparent_New%  ; 查看當前透明度
    SetTimer, RemoveToolTip, -300
return
 
~LShift & WheelDown::
; 減少透明度
WinGet, Transparent, Transparent, A
If (Transparent="")
    Transparent=255
    Transparent_New:=Transparent-10  ; 速度
    If (Transparent_New < 125)  ; 最小透明度
        Transparent_New = 125
    WinSet,Transparent,%Transparent_New%, A

    ToolTip, 透明度: %Transparent_New%  ; 查看當前透明度
    SetTimer, RemoveToolTip, -300
return
 
~Lshift & Mbutton::
; 直接恢復不透明
WinGet, Transparent, Transparent, A
WinSet, Transparent, 255, A

ToolTip, 透明度: 255  ; 查看當前透明度
SetTimer, RemoveToolTip, -300
return
#Requires AutoHotkey v2.0
; 用于跟踪侧键1的点击次数
sideButtonCount := 0
sideButtonTime := 0

; 侧键1点击事件
XButton1::
{
    global sideButtonTime, sideButtonCount  ; 声明全局变量

    ; 检查时间间隔，判断是单击还是双击
    currentTime := A_TickCount
    if (currentTime - sideButtonTime < 300) {
        sideButtonCount++  ; 如果在300毫秒内再次点击，增加计数
    } else {
        sideButtonCount := 1  ; 重置计数
    }
    sideButtonTime := currentTime  ; 更新最后点击时间

    if (sideButtonCount = 2) {
        ; 执行剪切操作
        Send("^x")  ; Ctrl+X 剪切
        sideButtonCount := 0  ; 重置计数
    } else {
        ; 单击侧键1时复制选中的文本
        Send("^c")  ; Ctrl+C 复制选中的文本
    }

    return
}

; 侧键2点击事件
XButton2::
{
    ; 单击侧键2时执行粘贴操作
    Send("^v")  ; Ctrl+V 粘贴
    return
}

; 设置定时器以重置计数
SetTimer ResetSideButtonCount, 300  ; 300毫秒后重置计数

ResetSideButtonCount() {
    global sideButtonCount  ; 声明全局变量
    sideButtonCount := 0  ; 重置侧键点击计数
}

#Persistent
SetTitleMatchMode, 2
DetectHiddenWindows, Off

SetTimer, CheckWindow, 1000
return

CheckWindow:
    WinGet, winList, List, ahk_class MozillaWindowClass
    Loop % winList {
        hWnd := winList%A_Index%
        WinGetTitle, title, ahk_id %hWnd%
        if (InStr(title, "开发者工具 —") || InStr(title, "浏览器工具箱")) {
            WinGet, ExStyle, ExStyle, ahk_id %hWnd%
            if !(ExStyle & 0x8) {
                WinSet, AlwaysOnTop, On, ahk_id %hWnd%
            }
        }
    }
return

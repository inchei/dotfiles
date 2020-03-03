/* 鼠標移到底欄，滾輪進行音量調節
作者：「已註銷」
鏈接：https://www.zhihu.com/question/19645501/answer/251954144
來源：知乎
著作權歸作者所有。商業轉載請聯繫作者獲得授權，非商業轉載請註明出處。
*/
~lbutton & enter::
exitapp
~WheelUp::
if (existclass("ahk_class Shell_TrayWnd")=1)  
Send,{Volume_Up}
Return  
~WheelDown::  
if (existclass("ahk_class Shell_TrayWnd")=1)
Send,{Volume_Down}
Return
~MButton::
if (existclass("ahk_class Shell_TrayWnd")=1)
Send,{Volume_Mute}
Return

Existclass(class)
{
MouseGetPos,,,win
WinGet,winid,id,%class%
if win = %winid%
Return,1
Else
Return,0
}

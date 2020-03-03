/* 鼠標移到底欄，滾輪進行音量調節
作者：「已注销」
链接：https://www.zhihu.com/question/19645501/answer/251954144
来源：知乎
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
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

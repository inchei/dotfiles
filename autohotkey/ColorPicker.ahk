; Ctrl + Alt + Z 獲取指針所在顔色（RGB HEX）

; 移除 ToolTip
RemoveToolTip:
ToolTip
return

^!z::
MouseGetPos, MouseX, MouseY
PixelGetColor, color, %MouseX%, %MouseY%, RGB
color := "#" + SubStr(Format("{}", color), 3)
Clipboard = %color%
ToolTip, %color%
SetTimer, RemoveToolTip, -1000
return
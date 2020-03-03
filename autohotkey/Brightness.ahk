; CapsLock + 鼠標滾輪控制屏幕亮度
; 來源：https://autohotkey.com/board/topic/83100-laptop-screen-brightness/
; 有修改
;#NoEnv
;#AllowSameLineComments
;#SingleInstance force
;#InstallKeybdHook
;#NoTrayIcon

;SetWorkingDir %A_ScriptDir%
;SendMode, Input

~CapsLock & WheelUp::
	MoveBRightness(1)
return

~CapsLock & WheelDown::
	MoveBRightness(-1)
return

MoveBrightness(IndexMove)
{

	VarSetCapacity(SupportedBRightness, 256, 0)
	VarSetCapacity(SupportedBRightnessSize, 4, 0)
	VarSetCapacity(BRightnessSize, 4, 0)
	VarSetCapacity(BRightness, 3, 0)

	hLCD := DllCall("CreateFile"
		, Str, "\\.\LCD"
		, UInt, 0x80000000 | 0x40000000 ;Read | Write
		, UInt, 0x1 | 0x2  ; File Read | File Write
		, UInt, 0
		, UInt, 0x3        ; open any existing file
		, UInt, 0
		, UInt, 0)

	if hLCD != -1
	{
		DevVideo := 0x00000023, BuffMethod := 0, Fileacces := 0
		NumPut(0x03, BRightness, 0, "UChar")      ; 0x01 = Set AC, 0x02 = Set DC, 0x03 = Set both
		NumPut(0x00, BRightness, 1, "UChar")      ; The AC bRightness level
		NumPut(0x00, BRightness, 2, "UChar")      ; The DC bRightness level
		DllCall("DeviceIoControl"
			, UInt, hLCD
			, UInt, (DevVideo<<16 | 0x126<<2 | BuffMethod<<14 | Fileacces) ; IOCTL_VIDEO_QUERY_DISPLAY_BRIGHTNESS
			, UInt, 0
			, UInt, 0
			, UInt, &Brightness
			, UInt, 3
			, UInt, &BrightnessSize
			, UInt, 0)

		DllCall("DeviceIoControl"
			, UInt, hLCD
			, UInt, (DevVideo<<16 | 0x125<<2 | BuffMethod<<14 | Fileacces) ; IOCTL_VIDEO_QUERY_SUPPORTED_BRIGHTNESS
			, UInt, 0
			, UInt, 0
			, UInt, &SupportedBrightness
			, UInt, 256
			, UInt, &SupportedBrightnessSize
			, UInt, 0)

		ACBRightness := NumGet(BRightness, 1, "UChar")
		ACIndex := 0
		DCBRightness := NumGet(BRightness, 2, "UChar")
		DCIndex := 0
		BufferSize := NumGet(SupportedBRightnessSize, 0, "UInt")
		MaxIndex := BufferSize-1

		loop, %BufferSize%
		{
			ThisIndex := A_Index-1
			ThisBRightness := NumGet(SupportedBRightness, ThisIndex, "UChar")
			if ACBRightness = %ThisBRightness%
				ACIndex := ThisIndex
			if DCBRightness = %ThisBRightness%
				DCIndex := ThisIndex
		}

		if DCIndex >= %ACIndex%
			BRightnessIndex := DCIndex
		else
			BRightnessIndex := ACIndex

		BRightnessIndex += IndexMove

		if BRightnessIndex > %MaxIndex%
			BRightnessIndex := MaxIndex

		if BRightnessIndex < 0
			BRightnessIndex := 0

		NewBRightness := NumGet(SupportedBRightness, BRightnessIndex, "UChar")

		NumPut(0x03, BRightness, 0, "UChar")               ; 0x01 = Set AC, 0x02 = Set DC, 0x03 = Set both
		NumPut(NewBRightness, BRightness, 1, "UChar")      ; The AC bRightness level
		NumPut(NewBRightness, BRightness, 2, "UChar")      ; The DC bRightness level

		DllCall("DeviceIoControl"
			, UInt, hLCD
			, UInt, (DevVideo<<16 | 0x127<<2 | BuffMethod<<14 | Fileacces) ; IOCTL_VIDEO_SET_DISPLAY_BRIGHTNESS
			, UInt, &Brightness
			, UInt, 3
			, UInt, 0
			, UInt, 0
			, UInt, 0
			, Uint, 0)

		DllCall("CloseHandle", UInt, hLCD)

	}

}

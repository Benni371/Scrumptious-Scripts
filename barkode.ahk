#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force
Chars = 0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
Loop, Parse, Chars
  Hotkey, % "$~" A_LoopField, BarCodeHandler, on
BarCodeHandler:
Accu .= SubStr(A_ThisHotkey, 0)
If (Strlen(Accu) > 4 && A_TimeSincePriorHotkey < 60)
  SetTimer, BarToUrl, -60
If (A_TimeSincePriorHotkey > 100)
  Accu := SubStr(A_ThisHotkey, 0)
return
BarToUrl:
If Accu
  url = CN%Accu%
  Run "http://infobase.arrowheaddental.com/touch/kase/%url%"
return
InstallDirectorySuffix:= "\KeyBuddy\Valheim\"
UniqueShortcutString:= "KeyBuddy - Valheim" ; This should match KeyBuddy_Subtype
#Include Lib\Initialize_Defaults.ahk
FileInstall, resources/robo-viking.ico, robotic-48.ico, 1

Sleep, 800
KeyBuddy_Subtype = KeyBuddy - Valheim 
KeyBuddy_Version = 0.16 ;Used for display in application
; KeyBuddyThisVersionNote=A new version of KeyBuddy (0.16) is available. Also found at
LogAppTitle = %KeyBuddy_Subtype%
LogAppVer = %KeyBuddy_Version%
App1Name:= "Valheim"
RunLogFileAndPath:= A_ScriptDir . "ValheimRun.txt"
InvokeLogFileAndPath:= A_ScriptDir . "ValheimInvoke.txt"
; latestversionexplorerpath:= A_ScriptDir . "KeyBuddy\KeyBuddy-Valheim\"
Avatar_TT := ""

  ; Start CompilerDirectives for this version
version := "0.16", company := "Wrongtown"    ; Keep these lines together
;@Ahk2Exe-Let KeyBuddy_Version=%A_PriorLine~U)^(.+"){1}(.+)".*$~$2% ; Keep these lines together
;@Ahk2Exe-Let cy=%A_PriorLine~U)^(.+"){3}(.+)".*$~$2% ; Keep these lines together
;@Ahk2Exe-ExeName %A_ScriptDir%\KeyBuddy-Valheim\KeyBuddy - Valheim
;@Ahk2Exe-AddResource *24 %A_ScriptDir%\resources\Valheim.ahk.manifest, 1
;@Ahk2Exe-Let var = KeyBuddy - Valheim, var1 = Copyright`, Troy Hall
;@Ahk2Exe-SetOrigFilename %A_ScriptName%
;@Ahk2Exe-AddResource resources\robo-viking.ico
;@Ahk2Exe-SetMainIcon resources\robo-viking.ico
 ; End CompilerDirectives for this version
#Include Lib\DefaultCompilerDirectives.ahk

IniRead, GamePath, %A_ScriptDir%\KB.txt, Game, Path, Game Path not provided - will not offer to run
IniRead, ReportLogs, %A_ScriptDir%\KB.txt, Rep, Enable, Could Not Find Valid Enabler Flag - please report this error.
IniRead, IpPort, %A_ScriptDir%\KB.txt, Server, IP1, Could Not Find Valid IP:Port value - can't do much to help you there.
IniRead, Log, %A_ScriptDir%\KB.txt, Log, Val1, Could Not Find Valid Log value - can't do much to help you there.  
IniRead, IpPort2, %A_ScriptDir%\KB.txt, Server, IP2, Could Not Find Valid IP:Port value - can't do much to help you there.
IniRead, Log2, %A_ScriptDir%\KB.txt, Log, Val2, Could Not Find Valid Log2 value - can't do much to help you there.

If GamePath is Not space
{
  If Not WinExist("Valheim")
    {
    MsgBox, 4, Run Valheim?, Do you want to start Valheim?
    IfMsgBox, Yes
      Run, explorer %GamePath%
    }
}

#Include Lib\MovemberAvatar.ahk

; Only bother installing images if they're not available
if !FileExist(A_ScriptDir . "vh-splash.png")
{
; MsgBox, 0, PR-FAIL, Failure to find unexpected file successful.
  FileInstall, resources/vh-splash.png, vh-splash.png, 1
}

SplashImage, vh-splash.png, b fs18, %KeyBuddy_Subtype% v%KeyBuddy_Version% `n by Wrongtown 2021 `n `n To stop the script`nfrom Valheim press`nCtrl+F10`n
SetTimer, SplashOff, 2000

; #Include Lib\Run_Only_If_Compiled.ahk

#Include Lib\Initialize_Short_Timer.ahk

#Include Lib\ForceSingleInstance_check.ahk

#Include Lib\GuiMainGeneric.ahk

#Include Lib\MovemberSupport.ahk

#Include Lib\ToolTipSupport.ahk

;When gButtonAbout_Pressed is triggered by the user display the About window.
ButtonAbout_Pressed:
Gui, About:New, ,About KeyBuddy
Gui +0x400000  +MinimizeBox -SysMenu
; Gui -0xC00000  
Gui, About:Margin, 1, 1
Gui, Color, 0xFFD100

Gui +LastFound  ; Make the GUI window the last found window for use below.

Gui, Add, Button, xp+505 yp+110 w60 h30 Default gEditKbTxt_Pressed, Edit KB.txt 
Gui, Add, Button, xp+65 yp+0 w100 h30 Default gReload_Pressed, Reload to cache new values
Gui, Font, s12 bold q5, MS Sans Serif ; Fallback font last attempt. before default to system default.
Gui, Font,, Arial    ; Fallback font #2 (size 12, bold & quality are all inherited).
Gui, Font,, Verdana  ; Fallback font #1(size 12, bold & quality are all inherited).
Gui, font,, Helvetica ; Preferred font (size, weight & quality are all inherited).
; Gui, Add, Text, xs

Gui, Add, text, xp+100 w1,  ; Establish window width by placing this gui element here
Gui, Add, text, xp-585 yp+5 ; Re-orient controls back to left justified with 20 pixel margin
Gui, font, s8 norm q5, MS Sans Serif ; Ensure we have size 8 font no bold
Gui, Font,, Arial    ; Fallback font #1 (size, weight & quality are all inherited).
Gui, font,, Verdana ; Preferred font (size, weight & quality are all inherited).

; Gui, Add, Picture, x680, robo-viking.ico
Gui, Add, Text, x20 y20 BackgroundTrans section cBlack, I'm your friendly neighbourhood KeyBuddy! I hope you find me useful! `n`nI allow some minor auto-piloting for Valheim.`n`nI check if the game window is active, so any other programs where you use these hotkeys should be unaffected. 
Gui, Add, Link, section xs, `nIf you have any feedback please <a href="https://github.com/Wrongtown/ArkSE-QOL/issues">click here</a> or use the button on the main window to report it on github.
Gui, Add, Tab3, r1 x+20 xp+0 yp+70 y+20, Input Server Info|Other information

Gui, Tab, Input Server Info, , Exact
; Gui, Add, Text, section xp-0 yp+20 w1,

Gui, Font, s12 bold q5, MS Sans Serif ; Fallback font last attempt. before default to system default.
Gui, Font,, Arial    ; Fallback font #2 (size 12, bold & quality are all inherited).
Gui, Font,, Verdana  ; Fallback font #1(size 12, bold & quality are all inherited).
Gui, font,, Helvetica ; Preferred font (size, weight & quality are all inherited).
; Gui, Add, Text, xs
Gui, Add, Text, xs+20 r1 , Input Server IP

Gui, font, s8 norm q5, MS Sans Serif ; Return to size 8 no bold
Gui, Font,, Arial    ; Fallback font #1 (size, weight & quality are all inherited).
Gui, font,, Verdana ; Preferred font (size, weight & quality are all inherited).

Gui, Add, Text, xs+20 , 
(
There are two [Server]IP# strings available in KB.txt (located in the same directory as this application) `nwhich can be edited to trigger on the keys below IF the Valheim window is active. `nWhen you edit KB.txt you must either re-start or reload this application to use the new value.
`nF10 - [Server]IP1
`nF11 - [Server]IP2
`n
)

Gui, Font, s12 bold q5, MS Sans Serif ; Fallback font last attempt. before default to system default.
Gui, Font,, Arial    ; Fallback font #2 (size 12, bold & quality are all inherited).
Gui, Font,, Verdana  ; Fallback font #1(size 12, bold & quality are all inherited).
Gui, font,, Helvetica ; Preferred font (size, weight & quality are all inherited).
; Gui, Add, Text, xs
Gui, Add, Text, xs+20 r1 , Input Server Password

Gui, font, s8 norm q5, MS Sans Serif ; Return to size 8 no bold
Gui, Font,, Arial    ; Fallback font #1 (size, weight & quality are all inherited).
Gui, font,, Verdana ; Preferred font (size, weight & quality are all inherited).

Gui, Add, Text, xs+20 , 
(
There are two [Log]Val# strings in KB.txt (located in the same directory as this application) `nwhich can be edited to trigger on the keys below IF the Valheim window is active. `nWhen you edit KB.txt you must either re-start or reload this application to use the new value.
`nShift+F10 - [Log]Val1
`nShift+F11 - [Log]Val2
`n
)

Gui, Font, s12 bold q5, MS Sans Serif ; Fallback font last attempt. before default to system default.
Gui, Font,, Arial    ; Fallback font #2 (size 12, bold & quality are all inherited).
Gui, Font,, Verdana  ; Fallback font #1(size 12, bold & quality are all inherited).
Gui, font,, Helvetica ; Preferred font (size, weight & quality are all inherited).

Gui, Add, Text, xs+20 r1 , If you want to shut down the app once you're in the server

Gui, font, s8 norm q5, MS Sans Serif ; Return to size 8 no bold
Gui, Font,, Arial    ; Fallback font #1 (size, weight & quality are all inherited).
Gui, font,, Verdana ; Preferred font (size, weight & quality are all inherited).

Gui, Add, Text, xs+20 , 
(
Press Ctrl+F10 to shut down the script from the Valheim window, avoiding the need to find this window and select Exit.`n
`n
)


Gui, Tab, Other information, , Exact
Gui, Add, Text, section xp-0 yp-320 w1,
Gui, Font, s12 bold q5, MS Sans Serif ; Fallback font last attempt. before default to system default.
Gui, Font,, Arial    ; Fallback font #2 (size 12, bold & quality are all inherited).
Gui, Font,, Verdana  ; Fallback font #1(size 12, bold & quality are all inherited).
Gui, font,, Helvetica ; Preferred font (size, weight & quality are all inherited).
; Gui, Add, Text, xs
Gui, Add, Text, xs r1 , `nAbout KeyBuddy

Gui, font, s8 norm q5, MS Sans Serif ; Return to size 8 no bold
Gui, Font,, Arial    ; Fallback font #1 (size, weight & quality are all inherited).
Gui, font,, Verdana ; Preferred font (size, weight & quality are all inherited).

Gui, Add, Link, section xs,
(
`nThis program was created using <a href="https://autohotkey.com/">AutoHotKey</a> which is free and <a href="https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html">open-source `(GNU GPLv2`)</a>.
Initial development by Troy Hall AKA Wrongtown based off a similar tool for Ark: Survival Evolved.
Source code available at <a href="https://github.com/Wrongtown/ArkSE-QOL">https://github.com/Wrongtown/ArkSE-QOL</a>.
Sound effects (where present) are simply utilizing existing media available on your Windows 10 PC.
)

Gui, Font, s12 bold q5, MS Sans Serif ; Fallback font last attempt. before default to system default.
Gui, Font,, Arial    ; Fallback font #2 (size 12, bold & quality are all inherited).
Gui, Font,, Verdana  ; Fallback font #1(size 12, bold & quality are all inherited).
Gui, font,, Helvetica ; Preferred font (size, weight & quality are all inherited).

Gui, Add, Text, xs yp+80 r1 , `nFurther Options

Gui, font, s8 norm q5, MS Sans Serif ; Return to size 8 no bold
Gui, Font,, Arial    ; Fallback font #1 (size, weight & quality are all inherited).
Gui, font,, Verdana ; Preferred font (size, weight & quality are all inherited).

Gui, Add, Link, section xs, 
(
If you add a [Game]Path string to KB.txt (located in the same directory as this application) then this app will offer to run it 
for you if it isn't already running. This path should be the same as you see in a Desktop Shortcut created by Steam, for 
example: steam://rungameid/892970
)

Gui, Add, Text, xp+00 yp+160 w1, 

Gui, Tab ; End tabbed GUI section


; Second Button to invoke gButtonHideAbout_Pressed, Closing the About window
Gui, font, s8 norm q5, MS Sans Serif ; Return to size 8 no bold
Gui, Font,, Arial    ; Fallback font #1 (size, weight & quality are all inherited).
Gui, font,, Verdana ; Preferred font (size, weight & quality are all inherited).
; Gui, Add, Text, section xp-0 yp+40 w1, ; Start a new section down the screen to anchor the Close button on.
Gui, Add, Button, xp+336 yp+400 w40 h20 Default gButtonHideAbout_Pressed, Close ; Static position set to center ; TODO - Dynamic centering?
Gui, Add, Text, xp-336 yp+20 w1, ; Provide a bit of buffer beneath the Close button.

Gui, Show
; This section and the WM_MOUSEMOVE section below allow the user to click anywhere on this window and move it around.
WinSet, Transparent , 235, About KeyBuddy, , , 
WinSet, Enable ,, About KeyBuddy, , , 
OnMessage( 0x200, "WM_MOUSEMOVE" ) 

WM_MOUSEMOVE( wparam, lparam, msg, hwnd )
{
  if wparam = 1 ; LButton
    PostMessage, 0xA1, 2,,, A ; WM_NCLBUTTONDOWN
}
Return

; **** HotKeys - Customize below for your preferences ****


#IfWinActive ahk_exe Valheim.exe
; #IfWinActive Untitled - Notepad ; Debug only
^F10::Gosub, ButtonDie_Pressed ; Ctrl+F10 shut down this app
F10:: Gosub, InputIpPort ; Input the string retrieved from KB.txt under [Server]IP
F11:: Gosub, InputIpPort2 ; Input the string retrieved from KB.txt under [Server]IP2
+F10:: Gosub, Log ; input the string retrieved from KB.txt under [Log]Val
+F11:: Gosub, Log2 ; input the string retrieved from KB.txt under [Log]Val2

Reload_Pressed:
Reload
Sleep 1000
Return

CC_Active:
Send % "{w " . ( GetKeyState("w") ? "Up}" : "Down}" ) 
SplashImage, robotic-48.ico, b fs8, Script Toggle 
SetTimer, SplashOff, 300
Return

;no need, use right shift instead
;XButton2:: Send % "{shift " . ( GetKeyState("shift") ? "Up}" : "Down}" )

InputIpPort:
send {Text}%IpPort%
Return

Log:
send {Text}%Log%
Sleep, 400
send {Enter}
Return

InputIpPort2:
send {Text}%IpPort2%
Return

Log2:
send {Text}%Log2%
Sleep, 400
send {Enter}
Return

EditKbTxt_Pressed:
Run, notepad %A_ScriptDir%\KB.txt
Return

SplashOff() {
	SplashImage, Off
}

ReminderNotification:


;*** Dev/Debug ***
;f12::reload

#Include Lib\GuiActionsGeneric.ahk

ButtonRemoveKeyBuddy:
MsgBox, 0, Manual deletion required, To remove this script entirely you just need to delete the files from %A_ScriptDir%`n`nI'll attempt to open that directory now, and then shut myself down after 5 seconds.`nThe rest is up to you.
Run, explorer %A_ScriptDir%
Sleep, 5000
Gosub, ButtonDie_Pressed 

GuiClose:
ButtonDie_Pressed:
GuiEscape:
SplashImage, vh-splash.png, b fs18, Script Shutting Down
  SetTimer,, Off ; Turn off the pulse.
  Gui, Destroy
  FileDelete, Hat-30.ico
SoundPlay, %A_WinDir%\Media\Windows Information Bar.wav
  sleep, 500 ;(wait 0.7 seconds)
  ExitApp
InstallDirectorySuffix:= "\KeyBuddy\ARK\"
UniqueShortcutString:= "KeyBuddy - Ark" ; This should match KeyBuddy_Subtype
#Include Lib\Initialize_Defaults.ahk
#Include Lib\defaultAvatar.ahk

Sleep, 800
KeyBuddy_Subtype = KeyBuddy - ARK:SE 
KeyBuddy_Version = 0.09 ;Used for display in application
; KeyBuddyThisVersionNote=A new version of KeyBuddy (0.09) is available. Also found at
LogAppTitle = %KeyBuddy_Subtype%
LogAppVer = %KeyBuddy_Version%
App1Name:= "Ark: Survival Evolved"
RunLogFileAndPath:= A_ScriptDir . "ARKRun.txt"
InvokeLogFileAndPath:= A_ScriptDir . "ARKInvoke.txt"
; latestversionexplorerpath:= A_ScriptDir . "KeyBuddy\KeyBuddy-ARK\"
Avatar_TT := ""

  ; Start CompilerDirectives for this version
version := "0.09", company := "Wrongtown"    ; Keep these lines together
;@Ahk2Exe-Let KeyBuddy_Version=%A_PriorLine~U)^(.+"){1}(.+)".*$~$2% ; Keep these lines together
;@Ahk2Exe-Let cy=%A_PriorLine~U)^(.+"){3}(.+)".*$~$2% ; Keep these lines together
;@Ahk2Exe-ExeName %A_ScriptDir%\KeyBuddy-Ark\KeyBuddy - ARK
;@Ahk2Exe-AddResource *24 %A_ScriptDir%\resources\ARK.ahk.manifest, 1
;@Ahk2Exe-Let var = KeyBuddy - ARK, var1 = Copyright`, Troy Hall
;@Ahk2Exe-SetOrigFilename %A_ScriptName%
;@Ahk2Exe-AddResource resources\robotic-48.ico
;@Ahk2Exe-SetMainIcon resources\robotic-48.ico
 ; End CompilerDirectives for this version
#Include Lib\DefaultCompilerDirectives.ahk

IniRead, ReportLogs, %A_ScriptDir%\KB.txt, Rep, Enable, Could Not Find Valid Enabler Flag - please report this error.
IniRead, LogVal, %A_ScriptDir%\KB.txt, Log, Val, No LogVal found in KB.txt

#Include Lib\MovemberAvatar.ahk

; Only bother installing images if they're not available
if !FileExist(A_ScriptDir . "pr-splash.jpg")
{
; MsgBox, 0, PR-FAIL, Failure to find unexpected file successful.
  FileInstall, resources/pr-splash.jpg, pr-splash.jpg, 1
}

if !FileExist(A_ScriptDir . "pr-togg.jpg")
{
; MsgBox, 0, PR-FAIL, Failure to find unexpected file successful.
  FileInstall, resources/pr-togg.jpg, pr-togg.jpg, 1
}



SplashImage, pr-splash.jpg, b fs18, %KeyBuddy_Subtype% v%KeyBuddy_Version% `n by Wrongtown 2021 `n `n To stop the script at any time`npress Ctrl+F10`n
SetTimer, SplashOff, 3000

Contact_Email = troy.hall@rac.com.au
#Include Lib\Email_Feedback_Generic.ahk

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

Gui, Add, text, xp+740 w1,  ; Establish window width by placing this gui element here
Gui, Add, text, xp-720 yp+5 ; Re-orient controls back to left justified with 20 pixel margin
Gui, font, s8 norm q5, MS Sans Serif ; Ensure we have size 8 font no bold
Gui, Font,, Arial    ; Fallback font #1 (size, weight & quality are all inherited).
Gui, font,, Verdana ; Preferred font (size, weight & quality are all inherited).


; Gui, Add, Picture, x1035, C:\Users\hall1t\Documents\GitHub\automation-testing-experiments\AHK-Common Underwriting Messages\resources\robotic-48-debug.ico
; Gui, Add, Picture, x680, robotic-48.ico
Gui, Add, Text, x20 y20 BackgroundTrans section cBlack, I'm your friendly neighbourhood KeyBuddy! I hope you find me useful! `n`nI allow some minor auto-piloting for Ark: Survival Evolved and probably most other stuff built with the same engine.`n`nI check if the game window is active, so any other programs where you use these hotkeys should be unaffected. 
Gui, Add, Link, section xs, `nIf you have any feedback please <a href="mailto:%Contact_Email%%Email_Subject%%Email_Body%">click here</a> or use the button on the main window.
Gui, Add, Tab3, r1 x+20 xp+0 yp+70 y+20, %App1Name%|Other information

Gui, Tab, %App1Name%, , Exact
Gui, Add, Text, section xp-0 yp+40 w1,

Gui, Font, s12 bold q5, MS Sans Serif ; Fallback font last attempt. before default to system default.
Gui, Font,, Arial    ; Fallback font #2 (size 12, bold & quality are all inherited).
Gui, Font,, Verdana  ; Fallback font #1(size 12, bold & quality are all inherited).
Gui, font,, Helvetica ; Preferred font (size, weight & quality are all inherited).
; Gui, Add, Text, xs
Gui, Add, Text, xs+20 y+30 r1 , Middle Mouse Button

Gui, font, s8 norm q5, MS Sans Serif ; Return to size 8 no bold
Gui, Font,, Arial    ; Fallback font #1 (size, weight & quality are all inherited).
Gui, font,, Verdana ; Preferred font (size, weight & quality are all inherited).

Gui, Add, Text, xs+20 , 
(
Toggle Cruise Control on or off for the W key (walking/flying/swimming forward at normal pace)`n
   * Please note that if you want to toggle Sprinting this is already available with the Right Shift key.`n
)

Gui, Font, s12 bold q5, MS Sans Serif ; Fallback font last attempt. before default to system default.
Gui, Font,, Arial    ; Fallback font #2 (size 12, bold & quality are all inherited).
Gui, Font,, Verdana  ; Fallback font #1(size 12, bold & quality are all inherited).
Gui, font,, Helvetica ; Preferred font (size, weight & quality are all inherited).
; Gui, Add, Text, xs
Gui, Add, Text, xs+20 r1 , F2

Gui, font, s8 norm q5, MS Sans Serif ; Return to size 8 no bold
Gui, Font,, Arial    ; Fallback font #1 (size, weight & quality are all inherited).
Gui, font,, Verdana ; Preferred font (size, weight & quality are all inherited).

Gui, Add, Text, xs+20 , 
(
	Toggle Cruise Control for the Left Mouse Button (swinging axes, pickaxes etc) `n
)

Gui, Font, s12 bold q5, MS Sans Serif ; Fallback font last attempt. before default to system default.
Gui, Font,, Arial    ; Fallback font #2 (size 12, bold & quality are all inherited).
Gui, Font,, Verdana  ; Fallback font #1(size 12, bold & quality are all inherited).
Gui, font,, Helvetica ; Preferred font (size, weight & quality are all inherited).
; Gui, Add, Text, xs
Gui, Add, Text, xs+20 r1 , F4

Gui, font, s8 norm q5, MS Sans Serif ; Return to size 8 no bold
Gui, Font,, Arial    ; Fallback font #1 (size, weight & quality are all inherited).
Gui, font,, Verdana ; Preferred font (size, weight & quality are all inherited).

Gui, Add, Text, xs+20 , 
(
  Toggle Cruise Control for the E (gathering berries) `n   * CAUTION MUST BE EXERCISED TO AVOID CATASTROPHIC DISMOUNT`n
)

Gui, Font, s12 bold q5, MS Sans Serif ; Fallback font last attempt. before default to system default.
Gui, Font,, Arial    ; Fallback font #2 (size 12, bold & quality are all inherited).
Gui, Font,, Verdana  ; Fallback font #1(size 12, bold & quality are all inherited).
Gui, font,, Helvetica ; Preferred font (size, weight & quality are all inherited).
; Gui, Add, Text, xs
Gui, Add, Text, xs+20 r1 , Ctrl+F10

Gui, font, s8 norm q5, MS Sans Serif ; Return to size 8 no bold
Gui, Font,, Arial    ; Fallback font #1 (size, weight & quality are all inherited).
Gui, font,, Verdana ; Preferred font (size, weight & quality are all inherited).

Gui, Add, Text, xs+20 , 
(
Shut down the script without having to find the window and select Exit.`n
`n
)


Gui, Tab, Other information, , Exact
Gui, Add, Text, section xp-0 yp-235 w1,
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
Initial development by Troy Hall AKA Wrongtown.
Sound effects (where present) are simply utilizing existing media available on your Windows 10 PC.
)
Gui, Add, Text, xp+680 yp+20 w10, 

Gui, Tab ; End tabbed GUI section


; Second Button to invoke gButtonHideAbout_Pressed, Closing the About window
Gui, font, s8 norm q5, MS Sans Serif ; Return to size 8 no bold
Gui, Font,, Arial    ; Fallback font #1 (size, weight & quality are all inherited).
Gui, font,, Verdana ; Preferred font (size, weight & quality are all inherited).
; Gui, Add, Text, section xp-0 yp+40 w1, ; Start a new section down the screen to anchor the Close button on.
Gui, Add, Button, xp+336 yp+330 w40 h20 Default gButtonHideAbout_Pressed, Close ; Static position set to center ; TODO - Dynamic centering?
Gui, Add, Text, xp-530 yp+20 w10, ; Provide a bit of buffer beneath the Close button.

Gui, Show
; This section and the WM_MOUSEMOVE section below allow the user to click anywhere on this window and move it around.
WinSet, Transparent , 235, About KeyBuddy, , , 
WinSet, Enable ,, About KeyBuddy, , , 
OnMessage( 0x200, "WM_MOUSEMOVE" ) 
return

WM_MOUSEMOVE( wparam, lparam, msg, hwnd )
{
  if wparam = 1 ; LButton
    PostMessage, 0xA1, 2,,, A ; WM_NCLBUTTONDOWN
}
Return

; **** HotKeys - Customize below for your preferences ****


; #IfWinActive ahk_exe ShooterGame.exe
#IfWinActive Untitled - Notepad ; Debug only
^F10::Gosub, ButtonDie_Pressed ; Ctrl+F10 shut down app
MButton:: Gosub, WCC_Active ; Middle Mouse Button will hold down W key to move foward
F2:: Gosub, Hold_LeftClick_Active ; F2 holds down left mouse button
F4:: Gosub, Hold_E_Active ; F4 holds down E key 
F11:: Gosub, InputLogVal ; Input the string retrieved from KB.txt under LogVal
;no need, use right shift instead
;XButton2:: Send % "{shift " . ( GetKeyState("shift") ? "Up}" : "Down}" )

WCC_Active:
Send % "{w " . ( GetKeyState("w") ? "Up}" : "Down}" ) 
SplashImage, pr-togg.jpg, b fs8, Script Toggle 
SetTimer, SplashOff, 300
Return

Hold_LeftClick_Active:
Send % "{Click " . ( GetKeyState("LButton") ? "Up}" : "Down}" )
SplashImage, pr-togg.jpg, b fs8, Script Toggle 
SetTimer, SplashOff, 300
Return

Hold_E_Active:
Send % "{e " . ( GetKeyState("e") ? "Up}" : "Down}" ) 
SplashImage, pr-togg.jpg, b fs8, Script Toggle 
SetTimer, SplashOff, 300
Return

InputLogVal:
send {Text}%LogVal%
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
SplashImage, pr-splash.jpg, b fs18, Script Shutting Down
  SetTimer,, Off ; Turn off the pulse.
  Gui, Destroy
  FileDelete, Hat-30.ico
SoundPlay, %A_WinDir%\Media\Windows Information Bar.wav
  sleep, 500 ;(wait 0.7 seconds)
  ExitApp
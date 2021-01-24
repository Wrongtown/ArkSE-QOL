Gui New, +0x400000, %KeyBuddi_Subtype% v%KeyBuddi_Version%  ; Create a new GUI
Gui, Margin, 5, 10
Gui, Color, 0x244560
Gui +LastFound

If EggDay = True
{
  Gui, Add, Picture, x209 y25, robotic-48.ico
  Gui, Add, Picture, x218 y-2, Hat-30.ico
}
If EggDay != True
{
  Gui, Add, Picture, x209 y14 gAvatar vAvatar, robotic-48.ico
}

;Button to invoke ButtonAbout_Pressed  
Gui, Font, s8 q5, MS Sans Serif ; Fallback font last attempt. before default to system default
Gui, Font, s8 q5, Arial    ; Fallback font #1.
gui, font, s8 q5, Verdana ; Preferred font.
Gui, Add, Button, x10 y20 w50 h40 gButtonAbout_Pressed vButtonAbout_Pressed, &About ; 
ButtonAbout_Pressed_TT := ""
;Button to invoke ButtonFeedback_Pressed opening email message with address and Subject pre-filled
gui, font, s8 q5, Verdana
Gui, Add, Button, xp+60 yp+0 w80 h40 gButtonFeedback_Pressed vButtonFeedback_Pressed, &Report issue via email
ButtonFeedback_Pressed_TT := ""
; Button to invoke ButtonDie_Pressed, halting the KeyBuddi and Closing the UI. 
gui, font, s8 q5, Verdana
Gui, Add, Button, xp+230 yp+20 w40 h20 gButtonDie_Pressed vButtonDie_Pressed, Exit 
ButtonDie_Pressed_TT := ""

Gui, Show
OnMessage(0x200, "WM_MOUSEOVER")
Return
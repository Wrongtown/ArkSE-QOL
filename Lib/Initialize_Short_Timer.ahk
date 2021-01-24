#Persistent
#SingleInstance off   ; Don't use the #SingleInstance functionality, we're going to explicitly handle this with ForceSingleInstance 

SetTimer, ReminderNotification, 3000 ; Take Action as specified in ReminderNotification after approximately this many milliseconds (e.g. 270000 = 270 seconds, 300000 = 5 minutes)

SoundPlay, %A_WinDir%\Media\Windows Message Nudge.wav  ; Jingly keys make everything nicer right?
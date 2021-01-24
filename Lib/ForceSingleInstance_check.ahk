If ForceSingleInstance() {
LogRun("ForceSingleInstance simulating user shutdown of %KeyBuddi_Subtype% %KeyBuddi_Version% for %A_UserName% (see next line in log for " . A_UserName . ").")
            
  MsgBox, 4,,
             ( LTRIM ; Remove leading spaces and end all but the last line with `n
               Another copy of this program was already running and has been closed.
               Do you wish to close this one, too?
             )
  IfMsgBox Yes
            {
             LogRun("ForceSingleInstance shutting down this instance of " . KeyBuddi_Subtype . KeyBuddi_Version . " after " . A_UserName . " accepted prompt.")
              
            Gosub, ButtonDie_Pressed
            }
  IfMsgBox, No
            {
             LogRun("ForceSingleInstance offer to shut down not accepted by " . A_UserName . ".")
              
            }
}

ForceSingleInstance() {
 
  ; Get the pid from the 1st instance that is in the ErrorLevel
  Process, Exist, %A_ScriptName%
 
  ; Store the pid of the instance
  FirstInstancePID := ErrorLevel
 
  ; If the first instance is this script ...
  if ( FirstInstancePID = DllCall( "GetCurrentProcessId" ) )
 
    return false
 
  else {
  
    ; Show the window if hidden
    winshow, ahk_pid %FirstInstancePID% ahk_class AutoHotkeyGUI

    ; Activate the first instance 
    winactivate, ahk_pid %FirstInstancePID% ahk_class AutoHotkeyGUI
 
    ; Send an Escape to the active window to close it
    Send {Escape}
    
    ; We have a return for the first instance so exit the app
    return true
  }
}
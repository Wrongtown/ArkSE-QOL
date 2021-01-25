LogInvoke(LogMessage) {
  global LogAppTitle
  global LogAppVer
  global InvokeLogFileAndPath
  global ReportLogs
  if ReportLogs != NEGATIVE
  {
     LogInvokeDate = %A_YYYY%%A_MM%%A_DD%
     LogInvokeTime = %A_Hour%:%A_Min%:%A_Sec%
     FileAppend, `n%LogInvokeDate%|%LogInvokeTime%|%A_UserName%|%LogAppTitle%|%LogAppVer%|%LogMessage%|%A_ScriptDir%|, %InvokeLogFileAndPath%
   }
}
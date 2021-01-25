LogRun(LogMessage) {
  global LogAppTitle
  global LogAppVer
  global RunLogFileAndPath
  global ReportLogs
  global LocalVersion
  if ReportLogs != NEGATIVE
  {
     LogRunDate = %A_YYYY%%A_MM%%A_DD%
     LogRunTime = %A_Hour%:%A_Min%:%A_Sec%
     FileAppend, `n%LogRunDate%|%LogRunTime%|%A_UserName%|%LogAppTitle%|%LogAppVer%|%LogMessage%|%A_ScriptDir%|, %RunLogFileAndPath%
   }
}
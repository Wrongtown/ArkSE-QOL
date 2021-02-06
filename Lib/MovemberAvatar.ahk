IniRead, Mo, %A_ScriptDir%\KB.txt, Avatar, Mo
if Mo = Go
{
  FileDelete, robotic-48.ico
  Sleep, 300
  FileInstall, resources/robotic-moBro-48.ico, robotic-48.ico, 1
  LogRun("EggDay=" . EggDay . " EggDate=" . EggDate . " EggMonth=" . EggMonth . " - Deploying moustache. - Simulated Movember")
  Avatar_TT := "KeyBuddy Supports Movember!`n`nClick him to offer your support."
}

If EggMonth = 11
{
  FileDelete, robotic-48.ico
  Sleep, 300
  FileInstall, resources/robotic-moBro-48.ico, robotic-48.ico, 1
  LogRun("EggDay=" . EggDay . " EggDate=" . EggDate . " EggMonth=" . EggMonth . " - Deploying moustache.")
  Avatar_TT := "KeyBuddy Supports Movember!`n`nClick him to offer your support."
}

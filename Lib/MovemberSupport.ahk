Avatar:
IniRead, Mo, %A_ScriptDir%\KB.txt, Avatar, Mo
if Mo = Go
{
	Run, chrome.exe https://moteam.co/rac-wa-move-with-a-mo
	LogMovember("User clicked on MoBuddi Avatar - Simulated Movember","\\rac.com.au\files\RACI\KeyBuddi\operations\LogMovemberEngagement.txt")
}

If EggMonth = 11
{
	Run, chrome.exe https://moteam.co/rac-wa-move-with-a-mo
	LogMovember("User clicked on MoBuddi Avatar","\\rac.com.au\files\RACI\KeyBuddi\operations\LogMovemberEngagement.txt")
}
Return

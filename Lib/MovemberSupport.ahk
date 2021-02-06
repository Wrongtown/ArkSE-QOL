Avatar:
IniRead, Mo, %A_ScriptDir%\KB.txt, Avatar, Mo
if Mo = Go
{
	Run, chrome.exe https://moteam.co/rac-wa-move-with-a-mo
	LogMovember("User clicked on MoBuddi Avatar - Simulated Movember",A_ScriptDir . "KeyBuddi\operations\LogMovemberEngagement.txt")
}

If EggMonth = 11
{
	Run, chrome.exe https://moteam.co/rac-wa-move-with-a-mo
	LogMovember("User clicked on MoBuddi Avatar",A_ScriptDir . "KeyBuddi\operations\LogMovemberEngagement.txt")
}
Return

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

FileDelete, Hat-30.ico ; Delete any stray Hat-30.ico sitting around from crashes etc.

EggDate = %A_MM%%A_DD%
EggMonth = %A_MM%
EggDay = False

FileInstall, resources/KB.ini, %A_ScriptDir%\KB.txt, 0

LocalVersion=0
Message=Default Message on Init
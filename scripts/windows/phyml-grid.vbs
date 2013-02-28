Set oShell = CreateObject ("Wscript.Shell") 
Dim strArgs
strArgs = "cmd /c phyml-grid.bat"
oShell.Run strArgs, 0, false
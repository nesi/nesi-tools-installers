Set oShell = CreateObject ("Wscript.Shell") 
Dim strArgs
strArgs = "cmd /c nesi-setup.bat"
oShell.Run strArgs, 0, false
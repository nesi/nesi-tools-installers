Set oShell = CreateObject ("Wscript.Shell")
Dim strArgs
strArgs = "cmd /c idrop.bat"
oShell.Run strArgs, 0, false

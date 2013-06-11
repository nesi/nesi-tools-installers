Set oShell = CreateObject ("Wscript.Shell")
Dim strArgs
strArgs = "cmd /c envtest.bat"
oShell.Run strArgs, 0, false

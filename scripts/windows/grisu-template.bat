@ECHO OFF

CALL prepare.bat


REM @echo Using proxy path: "%X509_USER_PROXY%"

%JAVA_EXE% -Dconnect_timeout=12 -jar "..\resources\getdown-client.jar" "%dir%" template


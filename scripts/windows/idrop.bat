@ECHO OFF

CALL prepare_idrop.bat


REM @echo Using proxy path: "%X509_USER_PROXY%"

%JAVA_EXE% -jar "..\resources\getdown-client.jar" "%dir%"


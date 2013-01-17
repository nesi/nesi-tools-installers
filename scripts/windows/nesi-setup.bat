@ECHO OFF

CALL prepare.bat

@echo Using proxy path: "%X509_USER_PROXY%"

%JAVA_EXE% -jar "..\resources\getdown-client.jar" "%dir%" setup


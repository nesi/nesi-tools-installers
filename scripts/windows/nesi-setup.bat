@ECHO OFF

CALL prepare.bat


set X509_USER_PROXY=%USERPROFILE%\.grid\grid.proxy

@echo Using proxy path: "%X509_USER_PROXY%"

"%JAVA_EXE%" -jar "..\resources\getdown-client.jar" "%dir%" setup


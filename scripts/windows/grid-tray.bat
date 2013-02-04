@ECHO OFF

CALL prepare.bat

@echo Using proxy path: "%X509_USER_PROXY%"

%JAVA_EXE% -jar "%GRISU_HOME%\resources\getdown-client.jar" "%dir%" tray

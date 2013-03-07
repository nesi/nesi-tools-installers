@ECHO OFF

CALL prepare.bat

@echo Checking for updates. This might take a while...
%JAVA_EXE% -Dsilent -jar "%GRISU_HOME%\resources\getdown-client.jar" "%dir%"

@echo Using proxy path: "%X509_USER_PROXY%"
	

%JAVA_EXE% -cp "%dir%\grid-client-core.jar;%dir%\grid-client-dependencies.jar;%dir%\local-backend.jar" grisu.Grython %*


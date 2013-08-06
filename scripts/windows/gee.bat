@ECHO OFF

CALL prepare_gee.bat

REM @echo Checking for updates. This might take a while...
%JAVA_EXE% -Dsilent -jar "%GEE_HOME%\resources\getdown-client.jar" "%dir%"

REM @echo Using proxy path: "%X509_USER_PROXY%"

%JAVA_EXE% %JAVA_OPTS% -cp "%GRID_CLIENT_CLASSPATH%"  grisu.frontend.gee.Gee %*


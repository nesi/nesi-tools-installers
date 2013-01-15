@ECHO OFF

CALL prepare.bat

set dir=%APPDATA%\NeSI\MobaXTerm
set grisu_dir=%APPDATA%\NeSI\Grisu



if NOT EXIST "%dir%" (
	MD "%dir%"
)


if NOT EXIST "%dir%\mobaxterm.exe" (
	COPY ..\bin\mobaxterm.exe "%dir%\mobaxterm.exe"
)

@echo Checking for updates. This might take a while...
"%JAVA_EXE%" -jar "%GRISU_HOME%\resources\getdown-client.jar" "%grisu_dir%" update

REM if NOT EXIST "%dir%\MobaXterm.ini" (

REM	set MOBAXTERM_LOCATION=%dir%
	
REM	"%JAVA_EXE%" -cp "%grisu_dir%\grid-client-core.jar;%grisu_dir%\grid-client-dependencies.jar" "grisu.frontend.view.swing.utils.ssh.wizard.NesiSetupWizard"

REM )

"%dir%\mobaxterm.exe"



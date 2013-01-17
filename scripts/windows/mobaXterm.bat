@ECHO OFF

CALL prepare.bat

set moba_dir=%APPDATA%\NeSI\MobaXTerm
set grisu_dir=%APPDATA%\NeSI\Grisu



if NOT EXIST "%moba_dir%" (
	MD "%moba_dir%"
)

set moba_exe_location_target=%moba_dir%\mobaxterm.exe
set moba_exe_location_source=..\bin\mobaxterm.exe
if NOT EXIST "%moba_exe_location_target%" (
	COPY "%moba_exe_location_source%" "%moba_exe_location_target%"
)

@echo Checking for updates. This might take a while...
%JAVA_EXE% -jar "%GRISU_HOME%\resources\getdown-client.jar" "%grisu_dir%" update

REM if NOT EXIST "%dir%\MobaXterm.ini" (

REM	set MOBAXTERM_LOCATION=%dir%
	
REM	"%JAVA_EXE%" -cp "%grisu_dir%\grid-client-core.jar;%grisu_dir%\grid-client-dependencies.jar" "grisu.frontend.view.swing.utils.ssh.wizard.NesiSetupWizard"

REM )

"%moba_exe_location_target%"



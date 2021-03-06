@ECHO OFF

set dir=%APPDATA%\NeSI\Grisu

if NOT EXIST "%dir%" (
	MD "%dir%"
)

set grid_dir=%USERPROFILE%\.grid
if NOT EXIST "%grid_dir%" (
	MD "%grid_dir%"
)

set getdown_txt=..\resources\getdown.txt

if EXIST "%getdown_txt%" (
    set GRISU_HOME=..
)

set getdown_txt_target=%dir%\getdown.txt
set getdown_txt_source=%GRISU_HOME%\resources\getdown.txt

if NOT EXIST "%getdown_txt_target%" (
    COPY "%getdown_txt_source%" "%getdown_txt_target%"
)

set nesi_png=%dir%\nesi.png
set nesi_png_source=%GRISU_HOME%\resources\nesi.png

if NOT EXIST "%nesi_png%" (
    COPY "%nesi_png_source%" "%dir%\nesi.png"
)

set java_vm_location=%dir%\java_vm

if NOT EXIST "%java_vm_location%" (
	set JAVA_EXE="%GRISU_HOME%\java_vm\bin\java.exe"
) else (
	set JAVA_EXE="%java_vm_location%\bin\java.exe"
)


if NOT EXIST %JAVA_EXE% (
	set JAVA_EXE=java
)
	

set GRID_CLIENT_CLASSPATH=%dir%\grid-client-core.jar;%dir%\grid-client-dependencies.jar;%dir%\local-backend.jar

set GETDOWN_DIR=%dir%

REM if EXIST "%dir%\local-backend.dat" (
REM 	set JAVA_OPTS=-Xmx512m
REM ) else (
REM	set JAVA_OPTS=-Xmx128m
REM )

set JAVA_OPTS=-Dconnect_timeout=12


set X509_USER_PROXY=%USERPROFILE%\.grid\grid.proxy

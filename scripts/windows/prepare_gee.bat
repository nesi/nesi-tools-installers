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
    set GRISU_HOME=..\
)

set getdown_txt_target=%dir%\getdown.txt
set getdown_txt_source=%GEE_HOME%\resources\getdown.txt

if NOT EXIST "%getdown_txt_target%" (
    COPY "%getdown_txt_source%" "%getdown_txt_target%"
)

set nesi_png=%dir%\nesi.png
set nesi_png_source=%GEE_HOME%\resources\nesi.png
if NOT EXIST "%nesi_png%" (
    COPY "%nesi_png_source%" "%dir%\nesi.png"
)
set java_vm_location=..\java_vm

if NOT EXIST %java_vm_location% (
		set JAVA_EXE="%GEE_HOME%java_vm\bin\java.exe"
	) else (
		set JAVA_EXE="%java_vm_location%\bin\java.exe"
	)

set X509_USER_PROXY=%USERPROFILE%\.grid\grid.proxy





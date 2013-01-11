@ECHO OFF

set dir=%APPDATA%\NeSI\Grisu

if NOT EXIST "%dir%" (
	MD "%dir%"
)

if EXIST "..\resources\getdown.txt" (
    set GRISU_HOME=..\
)

if NOT EXIST "%dir%\getdown.txt" (
    COPY %GRISU_HOME%\resources\getdown.txt "%dir%\getdown.txt"
)

if NOT EXIST "%dir%\nesi.png" (
    COPY %GRISU_HOME%\resources\nesi.png "%dir%\nesi.png"
)


if NOT EXIST "..\java_vm" (
	set GRISU_JAVA_HOME=%GRISU_HOME%java_vm
) ELSE (
	set GRISU_JAVA_HOME=..\java_vm
)

set JAVA_EXE=%GRISU_JAVA_HOME%\bin\java.exe

set X509_USER_PROXY=%USERPROFILE%\.grid\grid.proxy





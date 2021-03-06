@ECHO OFF

pushd %~dp0

REM Command file for Sphinx documentation

if "%SPHINXBUILD%" == "" (
	set SPHINXBUILD=sphinx-build
)
set SOURCEDIR=source
set BUILDDIR=build

if "%1" == "" goto help


if "%1" == "clean" (
    REM override the default `make clean` behavior of sphinx-build;
    REM this lets us clean out the various build files in sphinx/source/
	for /d %%i in (%BUILDDIR%\*) do rmdir /q /s %%i
	rmdir /q /s %SOURCEDIR%\reference\generated >nul 2>&1
	rmdir /q /s %SOURCEDIR%\gallery >nul 2>&1
	rmdir /q /s %SOURCEDIR%\savefig >nul 2>&1
	goto end
)

%SPHINXBUILD% >NUL 2>NUL
if errorlevel 9009 (
	echo.
	echo.The 'sphinx-build' command was not found. Make sure you have Sphinx
	echo.installed, then set the SPHINXBUILD environment variable to point
	echo.to the full path of the 'sphinx-build' executable. Alternatively you
	echo.may add the Sphinx directory to PATH.
	echo.
	echo.If you don't have Sphinx installed, grab it from
	echo.http://sphinx-doc.org/
	exit /b 1
)

%SPHINXBUILD% -M %1 %SOURCEDIR% %BUILDDIR% %SPHINXOPTS% %O%
goto end

:help
%SPHINXBUILD% -M help %SOURCEDIR% %BUILDDIR% %SPHINXOPTS% %O%

:end
popd

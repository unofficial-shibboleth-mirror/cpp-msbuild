rem clean and create target dirs

rd/s/q %1%\Release %1%\Debug
mkdir %1%\Release
mkdir %1%\Debug

rem Release: Clean. Make. Clean

nmake /f win32\Makefile.shib clean
@if errorlevel 1 goto end
nmake /f win32\Makefile.shib
@if errorlevel 1 goto end
copy %ZLIB_SHAREDLIB%.dll %1%\Release
copy %ZLIB_IMPLIB%.* %1%\Release
nmake /f win32\Makefile.shib clean
@if errorlevel 1 goto end

rem Debug: Clean. Make. Clean


nmake /f win32\Makefile.shib.debug clean
@if errorlevel 1 goto end
nmake /f win32\Makefile.shib.debug 
@if errorlevel 1 goto end
copy %ZLIB_SHAREDLIB%D.dll %1%\Debug
copy %ZLIB_IMPLIB%D.* %1%\Debug
nmake /f win32\Makefile.shib.debug clean

:end
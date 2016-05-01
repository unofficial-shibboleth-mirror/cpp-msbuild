cd src

del *.obj
nmake -f Makefile.shib.64 release CFG=release-dll-ssl-dll-zlib-dll.x64 LIB_NAME=%LIBCURL_NAME% OPENSSL_PATH=..\..\%OPENSSL_DIR% ZLIB_DIR=..\..\%ZLIB_DIR% MACHINE=x64
@if errorlevel 1 goto end

del *.obj
nmake -f Makefile.shib.64.d release CFG=debug-dll-ssl-dll-zlib-dll.x64 LIB_NAME=%LIBCURL_NAME% OPENSSL_PATH=..\..\%OPENSSL_DIR% ZLIB_DIR=..\..\%ZLIB_DIR% MACHINE=x64
@if errorlevel 1 goto end

cd ..

:end
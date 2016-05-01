cd src
del *.obj
nmake -f Makefile.shib.32 release CFG=release-dll-ssl-dll-zlib-dll LIB_NAME=%LIBCURL_NAME% OPENSSL_PATH=..\..\%OPENSSL_DIR% ZLIB_DIR=..\..\%ZLIB_DIR%
@if errorlevel 1 goto end

del *.obj
nmake -f Makefile.shib.32.d debug CFG=debug-dll-ssl-dll-zlib-dll LIB_NAME=%LIBCURL_NAME% OPENSSL_PATH=..\..\%OPENSSL_DIR% ZLIB_DIR=..\..\%ZLIB_DIR%
@if errorlevel 1 goto end
cd ..

:end
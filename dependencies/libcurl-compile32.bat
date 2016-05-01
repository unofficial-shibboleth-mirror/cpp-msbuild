
cd lib\
nmake -f Makefile.shib.32 CFG=release-dll-ssl-dll-zlib-dll LIB_NAME_DYN_REL=%LIBCURL_NAME% OPENSSL_PATH=..\..\%OPENSSL_DIR% ZLIB_DIR=..\..\%ZLIB_DIR%
@if errorlevel 1 goto end

nmake -f Makefile.shib.32.d CFG=debug-dll-ssl-dll-zlib-dll LIB_NAME_DYN_REL=%LIBCURL_NAME% OPENSSL_PATH=..\..\%OPENSSL_DIR% ZLIB_DIR=..\..\%ZLIB_DIR%
@if errorlevel 1 goto end

cd ..
:end

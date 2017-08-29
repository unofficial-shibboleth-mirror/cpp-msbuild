cls
date /t > build.log
Time /t >> build.log

call config.bat

cd %ZLIB_DIR%
call ..\zlib.bat
echo Zlib Config Status: %errorLevel% >> ..\build.log
@if errorlevel 1 goto end

CD ..\%LOGSHIB_DIR%
call ..\log4shib.bat
echo Log4Shib Config Status: %errorLevel% >> ..\build.log
@if errorlevel 1 goto end

cd ..\%XERCES_DIR%
call ..\xerces.bat
echo Xerces Config Status: %errorLevel% >> ..\build.log
@if errorlevel 1 goto end

cd ..\%OPENSSL_DIR%
call ..\openssl.bat
echo OpenSSL Config Status: %errorLevel% >> ..\build.log
@if errorlevel 1 goto end

cd ..\%XSEC_DIR%
call ..\xmlsec.bat
echo XML Security (c) Config Status: %errorLevel% >> ..\build.log
@if errorlevel 1 goto end

cd ..

REM
REM Compile 32 and MsBuild
REM

call "%VS_DIR%vcvarsall.bat"  x86
@echo on

REM 32 bit compiles and MSBUILD compiles

cd %ZLIB_DIR%
call ..\zlib-compile.bat .
echo Zlib Compile 32 Status: %errorLevel% >> ..\build.log
@if errorlevel 1 goto end

CD ..\%LOGSHIB_DIR%
call ..\log4shib-compile.bat Win32
echo Log4Shib Compile 32 Status: %errorLevel% >> ..\build.log
@if errorlevel 1 goto end
call ..\log4shib-compile.bat x64
echo Log4Shib Compile 64 Status: %errorLevel% >> ..\build.log
@if errorlevel 1 goto end

cd ..\%XERCES_DIR%
call ..\xerces-compile.bat  Win32
echo Xerces Compile 32 Status: %errorLevel% >> ..\build.log
@if errorlevel 1 goto end
call ..\xerces-compile.bat  x64
echo Xerces Compile 64 Status: %errorLevel% >> ..\build.log
@if errorlevel 1 goto end

cd ..\%OPENSSL_DIR%
call ..\openssl-compile32.bat
echo OpenSSL Compile 32 Status: %errorLevel% >> ..\build.log
@if errorlevel 1 goto end

cd ..\%LIBCURL_DIR%
call ..\libcurl-new.bat
echo LibCurl Compile 32 Status: %errorLevel% >> ..\build.log
rem call ..\execurl-compile32.bat
rem echo ExeCurl Compile 32 Status: %errorLevel% >> ..\build.log
@if errorlevel 1 goto end

cd ..\%XSEC_DIR%
call ..\xmlsec-compile.bat  Win32
echo XML Security Compile 32 Status: %errorLevel% >> ..\build.log
@if errorlevel 1 goto end

cd ..

REM
REM Compile X64
REM

call "%VS_DIR%\vcvarsall.bat"  x64
@echo on

@if errorlevel 1 goto end
cd %ZLIB_DIR%

call ..\zlib-compile.bat x64
echo Zlib Compile 64 Status: %errorLevel% >> ..\build.log
@if errorlevel 1 goto end

cd ..\%LOGSHIB_DIR%
REM Done in x86

cd ..\%XERCES_DIR%
REM Done in x86

cd ..\%OPENSSL_DIR%
call ..\openssl-compile64.bat
echo Open SSL (64) Compile Status: %errorLevel% >> ..\build.log
@if errorlevel 1 goto end

cd ..\%LIBCURL_DIR%
call ..\libcurl-new-x64.bat
echo Libcurl (64) Compile Status: %errorLevel% >> ..\build.log
@if errorlevel 1 goto end

cd ..\%XSEC_DIR%
REM back to 32 bit tools.  Who knows why.
call "%VS_DIR%\vcvarsall.bat"  x86
@echo on
call ..\xmlsec-compile.bat  Win64
echo XML Security Compile 64 Status: %errorLevel% >> ..\build.log
@if errorlevel 1 goto end


cd ..
Time /t >> build.log

:end

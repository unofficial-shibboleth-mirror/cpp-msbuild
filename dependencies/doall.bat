cls
call config.bat

date /t >  %ROOT_DIR%build.log
Time /t >> %ROOT_DIR%build.log


cd %ROOT_DIR%\%ZLIB_DIR%
call %ROOT_DIR%cpp-msbuild\dependencies\zlib.bat
echo Zlib Config Status: %errorLevel% >> %ROOT_DIR%build.log
@if errorlevel 1 goto end

CD ..\%LOGSHIB_DIR%
call %ROOT_DIR%cpp-msbuild\dependencies\log4shib.bat
echo Log4Shib Config Status: %errorLevel% >> %ROOT_DIR%build.log
@if errorlevel 1 goto end

cd %ROOT_DIR%\%XERCES_DIR%
call %ROOT_DIR%cpp-msbuild\dependencies\xerces.bat
echo Xerces Config Status: %errorLevel% >> %ROOT_DIR%build.log
@if errorlevel 1 goto end

cd %ROOT_DIR%\%LIBCURL_DIR%
call %ROOT_DIR%cpp-msbuild\dependencies\libcurl.bat
echo libcurl Config Status: %errorLevel% >> %ROOT_DIR%build.log
@if errorlevel 1 goto end

cd %ROOT_DIR%\%OPENSSL_DIR%
call %ROOT_DIR%cpp-msbuild\dependencies\openssl.bat
echo OpenSSL Config Status: %errorLevel% >> %ROOT_DIR%build.log
@if errorlevel 1 goto end

cd %ROOT_DIR%\%XSEC_DIR%
call %ROOT_DIR%cpp-msbuild\dependencies\xmlsec.bat
echo XML Security (c) Config Status: %errorLevel% >> %ROOT_DIR%build.log
@if errorlevel 1 goto end

cd ..

REM
REM Compile 32 and MsBuild
REM

call "%VS_DIR%vcvarsall.bat"  x86
@echo on

REM 32 bit compiles and MSBUILD compiles

cd %ROOT_DIR%\%ZLIB_DIR%
call %ROOT_DIR%cpp-msbuild\dependencies\zlib-compile.bat .
echo Zlib Compile 32 Status: %errorLevel% >> %ROOT_DIR%build.log
@if errorlevel 1 goto end

CD %ROOT_DIR%\%LOGSHIB_DIR%
call %ROOT_DIR%cpp-msbuild\dependencies\log4shib-compile.bat Win32
echo Log4Shib Compile 32 Status: %errorLevel% >> %ROOT_DIR%build.log
@if errorlevel 1 goto end
call %ROOT_DIR%cpp-msbuild\dependencies\log4shib-compile.bat x64
echo Log4Shib Compile 64 Status: %errorLevel% >> %ROOT_DIR%build.log
@if errorlevel 1 goto end

cd %ROOT_DIR%\%XERCES_DIR%
call %ROOT_DIR%cpp-msbuild\dependencies\xerces-compile.bat
echo Xerces Compile 32 Status: %errorLevel% >> %ROOT_DIR%build.log
@if errorlevel 1 goto end

cd %ROOT_DIR%\%OPENSSL_DIR%
call %ROOT_DIR%cpp-msbuild\dependencies\openssl-compile32.bat
echo OpenSSL Compile 32 Status: %errorLevel% >> %ROOT_DIR%build.log
@if errorlevel 1 goto end

cd %ROOT_DIR%\%LIBCURL_DIR%
call %ROOT_DIR%cpp-msbuild\dependencies\libcurl-new.bat
echo LibCurl Compile 32 Status: %errorLevel% >> %ROOT_DIR%build.log
@if errorlevel 1 goto end

cd %ROOT_DIR%\%XSEC_DIR%
call %ROOT_DIR%cpp-msbuild\dependencies\xmlsec-compile.bat  Win32
echo XML Security Compile 32 Status: %errorLevel% >> %ROOT_DIR%build.log
@if errorlevel 1 goto end

cd ..

REM
REM Compile X64
REM

call "%VS_DIR%\vcvarsall.bat"  x64
@echo on

@if errorlevel 1 goto end
cd %ROOT_DIR%\%ZLIB_DIR%

call %ROOT_DIR%cpp-msbuild\dependencies\zlib-compile.bat x64
echo Zlib Compile 64 Status: %errorLevel% >> %ROOT_DIR%build.log
@if errorlevel 1 goto end

cd %ROOT_DIR%\%LOGSHIB_DIR%
REM Done in x86

cd %ROOT_DIR%\%XERCES_DIR%
REM Done in x86

cd %ROOT_DIR%\%OPENSSL_DIR%
call %ROOT_DIR%cpp-msbuild\dependencies\openssl-compile64.bat
echo Open SSL (64) Compile Status: %errorLevel% >> %ROOT_DIR%build.log
@if errorlevel 1 goto end

cd %ROOT_DIR%\%LIBCURL_DIR%
call %ROOT_DIR%cpp-msbuild\dependencies\libcurl-new-x64.bat
echo Libcurl (64) Compile Status: %errorLevel% >> %ROOT_DIR%build.log
@if errorlevel 1 goto end

cd %ROOT_DIR%\%XSEC_DIR%
REM back to 32 bit tools.  Who knows why.
call "%VS_DIR%\vcvarsall.bat"  x86
@echo on
call %ROOT_DIR%cpp-msbuild\dependencies\xmlsec-compile.bat  Win64
echo XML Security Compile 64 Status: %errorLevel% >> %ROOT_DIR%build.log
@if errorlevel 1 goto end


cd ..
Time /t >> %ROOT_DIR%build.log

:end

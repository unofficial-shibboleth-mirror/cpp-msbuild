rem GOTTA HAVE TRAILING SLASH

set ROOT_DIR=H:\Perforce\VS2017\

set VS_DIR=d:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\VC\Auxiliary\Build\

set ZLIB_DIR=zlib-1.2.11
set ZLIB_IMPLIB=zlib1
set ZLIB_SHAREDLIB=zlib1_2

set LOGSHIB_DIR=log4shib-1.0.10

set XERCES_DIR=xerces-c-3.2.0

set OPENSSL_DIR=openssl-1.1.0f

set SSLLib=libcrypto.lib;libssl.lib
set SSLLib_space=libcrypto.lib libssl.lib
set SSLLibD=libcrypto.lib;libssl.lib
set SSLLibD_space=libcrypto.lib libssl.lib

set LIBCURL_DIR=curl-7.55.1
set LIBCURL_NAME=libcurl5

set XSEC_DIR=xml-security-c-1.8.0

SET MsVCVersionNum=15

REM
REM Should not need to change anything
REM 

set MsVCVersion=VC%MsVCVersionNum%
set ForceImportBeforeCppTargets=%SCRIPTS_DIR%\xsec.props
set SCRIPTS_DIR=%ROOT_DIR%cpp-msbuild\dependencies


rem 
rem The following is only needed if you want to run things.
rem set path=%PATH%;%ROOT_DIR%%OPENSSL_DIR%\out32dll.dbg;%ROOT_DIR%%XERCES_DIR%\BUILD\WIN32\VC10\DEBUG;%ROOT_DIR%%XSEC_DIR%\Build\Win32\VC10\Debug No Xalan;%ROOT_DIR%%libcurl_dir%\lib\debug-dll-ssl-dll-zlib-dll;%ROOT_DIR%%LOGSHIB_DIR%\msvc10\Debug;%ROOT_DIR%%ZLIB_DIR%\Debug


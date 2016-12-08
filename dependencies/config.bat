rem GOTTA HAVE TRAILING SLASH

set ROOT_DIR=H:\Perforce\devel\

set SCRIPTS_DIR=%ROOT_DIR%cpp-msbuild\dependencies
set VS14_DIR=c:\Program Files (x86)\Microsoft Visual Studio 14.0\

set ZLIB_DIR=zlib-1.2.8
set ZLIB_IMPLIB=zlib1
set ZLIB_SHAREDLIB=zlib1_2

set LOGSHIB_DIR=log4shib-1.0.10

set XERCES_DIR=xerces-c-3.1.3

set OPENSSL_DIR=openssl-1.1

rem set SSLLib=ssleay32.lib;libeay32.lib
rem set SSLLib_space=ssleay32.lib libeay32.lib
rem set SSLLibD=ssleay32D.lib;libeay32D.lib
rem set SSLLibD_space=ssleay32D.lib libeay32D.lib

set SSLLib=libcrypto.lib;libssl.lib
set SSLLib_space=libcrypto.lib libssl.lib

set SSLLibD=libcrypto.lib;libssl.lib
set SSLLibD_space=libcrypto.lib libssl.lib

set LIBCURL_DIR=curl-7.49.99
set LIBCURL_NAME=libcurl5

set XSEC_DIR=xml-security-c-1.7.99-X

SET MsVCVersionNum=10
set MsVCVersion=VC%MsVCVersionNum%


set ForceImportBeforeCppTargets=%SCRIPTS_DIR%\xsec.props

set path=%PATH%;%ROOT_DIR%%OPENSSL_DIR%\out32dll.dbg;%ROOT_DIR%%XERCES_DIR%\BUILD\WIN32\VC10\DEBUG;%ROOT_DIR%%XSEC_DIR%\Build\Win32\VC10\Debug No Xalan;%ROOT_DIR%%libcurl_dir%\lib\debug-dll-ssl-dll-zlib-dll;%ROOT_DIR%%LOGSHIB_DIR%\msvc10\Debug;%ROOT_DIR%%ZLIB_DIR%\Debug


rem ROOT_DIR HAS TO HAVE TRAILING SLASH

if "%1" NEQ "" goto %1%
set ROOT_DIR=C:\Users\cantor.2\Shibboleth\
set VS_DIR=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build
set SED=C:\cygwin64\bin\sed.exe
goto path_done

:ROD
set ROOT_DIR=H:\Perforce\VS2017\
set VS_DIR=d:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\VC\Auxiliary\Build\
set SED=sed

##
## Apache Config
##
SET APACHE_13_ROOT=%ROOT_DIR%apache\VC10\Apache
SET APACHE_20_ROOT=%ROOT_DIR%apache\VC10\Apache2.0.63\Apache
SET APACHE_22_ROOT=%ROOT_DIR%apache\VC10\Apache2
SET APACHE_22_ROOT64=%ROOT_DIR%apache\VC10\Apache22-64
SET APACHE_24_ROOT=%ROOT_DIR%apache\VC10\Apache24
SET APACHE_24_ROOT64=%ROOT_DIR%apache\VC10\Apache24-64
goto path_done

:ROD_LAPTOP
set ROOT_DIR=H:\Perforce\VS2017\
set SED=D:\downloads\cygwin\bin\sed.exe
set PERL=C:\Strawberry\perl\bin\perl.exe

##
## Apache Config
##
SET APACHE_13_ROOT=%ROOT_DIR%apache\VC10\Apache
SET APACHE_20_ROOT=%ROOT_DIR%apache\VC10\Apache2.0.63\Apache
SET APACHE_22_ROOT=%ROOT_DIR%apache\VC10\Apache2
SET APACHE_22_ROOT64=%ROOT_DIR%apache\VC10\Apache22-64
SET APACHE_24_ROOT=%ROOT_DIR%apache\VC10\Apache24
SET APACHE_24_ROOT64=%ROOT_DIR%apache\VC10\Apache24-64
goto path_done

:path_done

set ZLIB_DIR=zlib-1.2.11
set ZLIB_IMPLIB=zlib1
set ZLIB_SHAREDLIB=zlib1_2_11

set LOGSHIB_DIR=cpp-log4shib

set XERCES_DIR=xerces-c-3.2.0

##
## OPENSSL CONFIG
##
## OPENSSL_DIR          is the directory name
## OPENSSL_MM_VERSION   is the Merge Module version (and so have to be 4 dir separated numbers)
## OPENSSL_FILE_VERSION is the distinction on the name of the DLLS
##                      if it changes you *MUST* change Version.props
set OPENSSL_DIR=openssl-1.1.0g
set OPENSSL_MM_VERSION=1.1.0.7
set OPENSSL_FILE_VERSION=1_1

set LIBCURL_DIR=curl-7.57.0
set LIBCURL_NAME=libcurl5

set XSEC_DIR=xml-security-cpp

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


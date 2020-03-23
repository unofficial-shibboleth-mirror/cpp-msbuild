@echo off
rem ROOT_DIR HAS TO HAVE TRAILING SLASH

if "%1" NEQ "" goto %1%

REM
REM DEFAULT SETTINGS (for Scott)
REM

set ROOT_DIR=C:\Users\scantor\Shibboleth\

REM CPP_MM_DIR need not be set if vcvars is called prior to loading Visual studio or running msbuild
rem set CPP_MM_DIR=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Redist\MSVC\14.14.26405\MergeModules
set SED="C:\Program Files\Git\usr\bin\sed.exe"
rem set DEBUG_INSTALLER=YES

REM
REM Apache Config
REM
SET APACHE_13_ROOT=C:\Apache
SET APACHE_20_ROOT=C:\Apache2.0.63\Apache
SET APACHE_22_ROOT=C:\Apache2
SET APACHE_22_ROOT64=C:\Apache2-64
SET APACHE_24_ROOT=C:\Apache24
SET APACHE_24_ROOT64=C:\Apache24-64

goto path_done

:BUILDVM

set ROOT_DIR=C:\Users\Administrator\Shibboleth\
REM CPP_MM_DIR need not be set if vcvars is called prior to loading Visual studio or running msbuild
rem set CPP_MM_DIR=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Redist\MSVC\14.14.26405\MergeModules
set SED="C:\Program Files\Git\usr\bin\sed.exe"
rem set DEBUG_INSTALLER=YES

REM
REM Apache Config
REM
SET APACHE_13_ROOT=C:\Apache
SET APACHE_20_ROOT=C:\Apache2.0.63\Apache
SET APACHE_22_ROOT=C:\Apache2
SET APACHE_22_ROOT64=C:\Apache2-64
SET APACHE_24_ROOT=C:\Apache24
SET APACHE_24_ROOT64=C:\Apache24-64

goto path_done

:ROD
set ROOT_DIR=H:\Perforce\VS2017\
set SED=S:\cygwin64\bin\sed.exe
REM CPP_MM_DIR need not be set if vcvars is called prior to loading Visual studio or running msbuild
rem set CPP_MM_DIR=D:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\VC\Redist\MSVC\14.14.26405\MergeModules
set DEBUG_INSTALLER=YES
set PERL=c:\Strawberry\perl\bin\perl.exe
set PATH=%PATH%;D:\Downloads\nasm-2.13.01\

REM
REM Apache Config
REM
SET APACHE_13_ROOT=%ROOT_DIR%apache\VC10\Apache
SET APACHE_20_ROOT=%ROOT_DIR%apache\VC10\Apache2.0.63\Apache2
SET APACHE_22_ROOT=%ROOT_DIR%apache\VC10\Apache2
SET APACHE_22_ROOT64=%ROOT_DIR%apache\VC10\Apache22-64
SET APACHE_24_ROOT=%ROOT_DIR%apache\VC15\Apache24-32\Apache24
SET APACHE_24_ROOT64=%ROOT_DIR%apache\VC15\Apache24-64\Apache24
goto path_done

:ROD_LAPTOP
set ROOT_DIR=H:\Perforce\VS2017\
set SED=D:\downloads\cygwin\bin\sed.exe
set PERL=C:\Strawberry\perl\bin\perl.exe
REM CPP_MM_DIR need not be set if vcvars is called prior to loading Visual studio or running msbuild
rem set CPP_MM_DIR=C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\VC\Redist\MSVC\14.11.25325\MergeModules

REM
REM Apache Config
REM
SET APACHE_13_ROOT=%ROOT_DIR%apache\VC10\Apache
SET APACHE_20_ROOT=%ROOT_DIR%apache\VC10\Apache2.0.63\Apache2
SET APACHE_22_ROOT=%ROOT_DIR%apache\VC10\Apache2
SET APACHE_22_ROOT64=%ROOT_DIR%apache\VC10\Apache22-64
SET APACHE_24_ROOT=%ROOT_DIR%apache\VC15\Apache24-32\Apache24
SET APACHE_24_ROOT64=%ROOT_DIR%apache\VC15\Apache24-64\Apache24
goto path_done

:path_done

REM
REM OPENSSL CONFIG
REM
REM OPENSSL_DIR          is the directory name
REM OPENSSL_MM_VERSION   is the Merge Module version (and so have to be 3 or 4 dot separated numbers)
REM OPENSSL_FILE_VERSION is the distinction on the name of the DLLS
REM                      if it changes you *MUST* change Version.props
set OPENSSL_DIR=openssl-1.1.1e
set OPENSSL_MM_VERSION=1.1.1.5
set OPENSSL_FILE_VERSION=1_1_1_5

REM
REM CURL CONFIG
REM
REM CURL_DIR             is the directory name
REM CURL_VERSION         is the version
REM
Set LIBCURL_VERSION=7.68.0
set LIBCURL_DIR=curl-%LIBCURL_VERSION%
set LIBCURL_FILE_VERSION=7

REM
REM XML SECURITY CONFIG
REM
REM XSEC_DIR              is the directory name
REM XSEC_MM_VERSION       is the Merge Module version (and so have to be 3 or 4 dot separated numbers)
REM XSEC_FILE_VERSION     is the distinction on the name of the DLLS
REM                       if it changes you *MUST* change Version.props
set XSEC_DIR=xml-security-c-2.0.2
SET XSEC_FILE_VERSION=2_0
SET XSEC_MM_VERSION=2.0.2

REM
REM ZLIB CONFIG
REM
set ZLIB_DIR=zlib-1.2.11
set ZLIB_MM_VERSION=1.2.11
set ZLIB_IMPLIB=zlib1
set ZLIB_FILE_VERSION=1_2_11

REM
REM LOG4SHIB CONFIG
REM
set LOG4SHIB_DIR=log4shib-2.0.0
set LOG4SHIB_MM_VERSION=2.0.0
set LOG4SHIB_FILE_VERSION=2_0

REM
REM XERCES CONFIG
REM
set XERCES_DIR=xerces-c-3.2.2
set XERCES_FILE_VERSION=3_2
set XERCES_MM_VERSION=3.2.2


SET MsVCVersionNum=15

REM
REM Should not need to change anything
REM 

set MsVCVersion=VC%MsVCVersionNum%
set ForceImportBeforeCppTargets=%SCRIPTS_DIR%\xsec.props
set SCRIPTS_DIR=%ROOT_DIR%cpp-msbuild\dependencies

rem 
rem The following is only needed if you want to run things.
rem set path=%PATH%;%ROOT_DIR%%OPENSSL_DIR%\out32dll.dbg;%ROOT_DIR%%XERCES_DIR%\BUILD\WIN32\VC15\DEBUG;%ROOT_DIR%%XSEC_DIR%\Buildx86\Win32\VC15\Debug No Xalan;%ROOT_DIR%%libcurl_dir%\lib\debug-dll-ssl-dll-zlib-dll;%ROOT_DIR%%LOG4SHIB_DIR%\msvc15\Debug;%ROOT_DIR%%ZLIB_DIR%\Debug;%ROOT_DIR%\cpp-xmltooling\debug

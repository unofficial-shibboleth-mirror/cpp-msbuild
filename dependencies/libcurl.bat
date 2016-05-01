REM https://wiki.shibboleth.net/confluence/display/OpenSAML/libcurl/

REM Clean

rd/s/q lib\debug-dll-ssl-dll-zlib-dll lib\debug-dll-ssl-dll-zlib-dll.x64 lib\release-dll-ssl-dll-zlib-dll  lib\release-dll-ssl-dll-zlib-dll.x64

mkdir lib\debug-dll-ssl-dll-zlib-dll lib\debug-dll-ssl-dll-zlib-dll.x64 lib\release-dll-ssl-dll-zlib-dll  lib\release-dll-ssl-dll-zlib-dll.x64


REM 32/Release

echo s/^ZLIBLIBSDLL .*$/ZLIBLIBSDLL = Release\\%ZLIB_IMPLIB%.lib/ > curl.32.r1
sed lib\makefile.vc14 -f curl.32.r1 > lib\makefile.shib.32

REM 32/Debug

echo s/^ZLIBLIBSDLL .*$/ZLIBLIBSDLL = Debug\\%ZLIB_IMPLIB%D.lib/ > curl.32.d.r1
copy /y %SCRIPTS_DIR%\curl.32.d.r2
copy /y %SCRIPTS_DIR%\curl.32.d.r3
sed lib\makefile.vc14 -f curl.32.d.r1  -f curl.32.d.r2  -f curl.32.d.r3 > lib\makefile.shib.32.d

REM 64/Release

echo s/^ZLIBLIBSDLL .*$/ZLIBLIBSDLL = x64\\Release\\%ZLIB_IMPLIB%.lib/ > curl.64.r1
copy /y %SCRIPTS_DIR%\curl.64.r2
copy /y %SCRIPTS_DIR%\curl.64.r3
copy /y %SCRIPTS_DIR%\curl.64.r4
copy /y %SCRIPTS_DIR%\curl.64.r5
sed lib\makefile.vc14 -f curl.64.r1 -f curl.64.r2 -f curl.64.r3 -f curl.64.r4  -f curl.64.r5 > lib\makefile.shib.64

REM 64/Debug

echo s/^ZLIBLIBSDLL .*$/ZLIBLIBSDLL = x64\\Debug\\%ZLIB_IMPLIB%D.lib/ > curl.64.d.r1
copy /y %SCRIPTS_DIR%\curl.64.d.r2
copy /y %SCRIPTS_DIR%\curl.64.d.r3
copy /y %SCRIPTS_DIR%\curl.64.d.r4
copy /y %SCRIPTS_DIR%\curl.64.d.r5
copy /y %SCRIPTS_DIR%\curl.64.d.r6
sed lib\makefile.vc14 -f curl.64.d.r1 -f curl.64.d.r2 -f curl.64.d.r3 -f curl.64.d.r4 -f curl.64.d.r5 -f curl.64.d.r6 > lib\makefile.shib.64.d




REM Clean

rd/s/q src\Release src\Release.x64 src\Debug src\Debug.x64
mkdir src\Release src\Release.x64 src\Debug src\Debug.x64


REM 32/Release
echo s/^ZLIB_IMP_LIBS .*$/ZLIB_IMP_LIBS = Release\\%ZLIB_IMPLIB%.lib/ > execurl.32.r1
copy /y %SCRIPTS_DIR%\execurl.32.r2
copy /y %SCRIPTS_DIR%\execurl.32.r3
sed src\makefile.vc14 -f execurl.32.r1 -f execurl.32.r2 -f execurl.32.r3 > src\makefile.shib.32


REM 32/Debug

echo s/^ZLIB_IMP_LIBS .*$/ZLIB_IMP_LIBS = Debug\\%ZLIB_IMPLIB%D.lib/ > execurl.32.d.r1
copy /y %SCRIPTS_DIR%\execurl.32.d.r2
copy /y %SCRIPTS_DIR%\execurl.32.d.r3
copy /y %SCRIPTS_DIR%\execurl.32.d.r4
copy /y %SCRIPTS_DIR%\execurl.32.d.r5
copy /y %SCRIPTS_DIR%\execurl.32.d.r6
sed src\makefile.vc14 -f execurl.32.d.r1 -f execurl.32.d.r2 -f execurl.32.d.r3 -f execurl.32.d.r4 -f execurl.32.d.r5 -f execurl.32.d.r6 > src\makefile.shib.32.d


REM 64/Release
echo s/^ZLIB_IMP_LIBS .*$/ZLIB_IMP_LIBS = x64\\Release\\%ZLIB_IMPLIB%.lib/ > execurl.64.r1
copy /y %SCRIPTS_DIR%\execurl.64.r2
copy /y %SCRIPTS_DIR%\execurl.64.r3
copy /y %SCRIPTS_DIR%\execurl.64.r4
rem copy /y %SCRIPTS_DIR%\execurl.64.r5
copy /y %SCRIPTS_DIR%\execurl.64.r6
copy /y %SCRIPTS_DIR%\execurl.64.r7
sed src\makefile.vc14 -f execurl.64.r1 -f execurl.64.r2 -f execurl.64.r3 -f execurl.64.r4 -f execurl.64.r6 -f execurl.64.r7 > src\makefile.shib.64

REM 64/DEBUG
echo s/^ZLIB_IMP_LIBS .*$/ZLIB_IMP_LIBS = x64\\Debug\\%ZLIB_IMPLIB%D.lib/ > execurl.64.d.r1
copy /y %SCRIPTS_DIR%\execurl.64.d.r2
copy /y %SCRIPTS_DIR%\execurl.64.d.r3
copy /y %SCRIPTS_DIR%\execurl.64.d.r4
copy /y %SCRIPTS_DIR%\execurl.64.d.r5
copy /y %SCRIPTS_DIR%\execurl.64.d.r6
copy /y %SCRIPTS_DIR%\execurl.64.d.r7
sed src\makefile.vc14 -f execurl.64.d.r1 -f execurl.64.d.r2 -f execurl.64.d.r3 -f execurl.64.d.r4 -f execurl.64.d.r5 -f execurl.64.d.r6 -f execurl.64.d.r7 > src\makefile.shib.64.d

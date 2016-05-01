perl ms\uplink-x86_64.pl nasm > ms\uptable.asm
nasm -f win64 -o ms\uptable.obj ms\uptable.asm
@if errorlevel 1 goto end

nmake -f 64-dll.mak reallyclean
@if errorlevel 1 goto end
copy /y ms\libeay32.x64.def.nodebug ms\libeay32.def
copy /y ms\ssleay32.x64.def.nodebug ms\ssleay32.def

nmake -f 64-dll.mak
@if errorlevel 1 goto end

nmake -f 64-dll-debug.mak reallyclean
@if errorlevel 1 goto end
copy /y ms\libeay32.x64.def.debug ms\libeay32.def
copy /y ms\ssleay32.x64.def.debug ms\ssleay32.def

nmake -f 64-dll-debug.mak
@if errorlevel 1 goto end

:end

del ms\uptable.obj

nmake -f 32-dll.mak reallyclean
copy /y ms\libeay32.win32.def.nodebug ms\libeay32.def
copy /y ms\ssleay32.win32.def.nodebug ms\ssleay32.def
@if errorlevel 1 goto end
nmake -f 32-dll.mak
@if errorlevel 1 goto end

nmake -f 32-dll-debug.mak reallyclean
copy /y ms\libeay32.win32.def.debug ms\libeay32.def
copy /y ms\ssleay32.win32.def.debug ms\ssleay32.def
@if errorlevel 1 goto end
nmake -f 32-dll-debug.mak
@if errorlevel 1 goto end

:end
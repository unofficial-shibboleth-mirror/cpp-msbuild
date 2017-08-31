if exist makefile nmake distclean
perl Configure VC-WIN32 --prefix=%ROOT_DIR%\%OPENSSL_DIR%\x86
@if errorlevel 1 goto done
nmake install_sw
@if errorlevel 1 goto done


nmake distclean
perl ConfigureD debug-VC-WIN32 --prefix=%ROOT_DIR%\%OPENSSL_DIR%\x86Debug
@if errorlevel 1 goto done
nmake install_sw

:done
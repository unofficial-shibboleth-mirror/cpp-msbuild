if exist makefile nmake distclean
perl Configure VC-WIN64A --prefix=%ROOT_DIR%\%OPENSSL_DIR%\x64
@if errorlevel 1 goto done
nmake install_sw
@if errorlevel 1 goto done

nmake distclean
perl ConfigureD debug-VC-WIN64A --prefix=%ROOT_DIR%\%OPENSSL_DIR%\x64Debug
@if errorlevel 1 goto done
nmake install_sw

:done
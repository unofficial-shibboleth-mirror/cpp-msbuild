nmake clean
cls
nmake /f Makefile.vc mode=dll WITH_DEVEL=H:\Perforce\devel\x86-dbg WITH_SSL=dll WITH_ZLIB=dll ENABLE_WINSSL=no VC=10 DEBUG=yes MAKE="NMAKE /e" ZLIB_LFLAGS=/libpath:H:\Perforce\devel\zlib-1.2.8\DEBUG ZLIB_CFLAGS="/DHAVE_ZLIB_H /DHAVE_ZLIB /DHAVE_LIBZ /IH:\Perforce\devel\zlib-1.2.8" ZLIB_LIBS=zlib1D.lib SSL_LIBS="libssl.lib libcrypto.lib" BASE_NAME=LIBCURL5 BASE_NAME_DEBUG=libcurl5d_imp

goto done

nmake /f Makefile.vc mode=dll WITH_DEVEL=H:\Perforce\devel\x86 WITH_SSL=dll WITH_ZLIB=dll ENABLE_WINSSL=no VC=10 DEBUG=no MAKE="NMAKE /e" ZLIB_LFLAGS=/libpath:H:\Perforce\devel\zlib-1.2.8\Release ZLIB_CFLAGS="/DHAVE_ZLIB_H /DHAVE_ZLIB /DHAVE_LIBZ /IH:\Perforce\devel\zlib-1.2.8" ZLIB_LIBS=zlib1.lib SSL_LIBS="libssl.lib libcrypto.lib" BASE_NAME=LIBCURL5 BASE_NAME_DEBUG=libcurl5d_imp

:done
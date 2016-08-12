perl ConfigureD debug-VC-WIN32 --prefix=h:\perforce\devel\x86-dbg\
nmake distclean
rd/s/q h:\perforce\devel\x86-dbg h:\perforce\devel\x86

perl ConfigureD debug-VC-WIN32 --prefix=h:\perforce\devel\x86-dbg
nmake install_sw

nmake distclean 
perl Configure VC-WIN32 --prefix=h:\perforce\devel\x86
nmake install_sw

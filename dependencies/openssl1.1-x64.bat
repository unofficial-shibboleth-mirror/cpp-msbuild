perl ConfigureD debug-VC-WIN64A --prefix=h:\perforce\devel\x64-dbg\
nmake distclean
rd/s/q h:\perforce\devel\x64-dbg h:\perforce\devel\x64

perl ConfigureD debug-VC-WIN64A --prefix=h:\perforce\devel\x64-dbg
nmake install_sw

nmake distclean 
perl Configure VC-WIN64A --prefix=h:\perforce\devel\x64
nmake install_sw

goto end


rd /s /q out64dll
rd /s /q out64dll.dbg
rd /s /q inc64
rd /s /q inc64.dbg
perl Configure VC-WIN64A
nmake
mkdir out64dll
copy lib*dll out64dll
copy lib*lib out64dll
copy lib*pdb out64dll
copy apps\openssl.exe out64dll
copy apps\openssl.pdb out64dll
xcopy /s include inc64\
nmake distclean
perl ConfigureD debug-VC-WIN64A
nmake
mkdir out64dll.dbg
copy lib*dll out64dll.dbg
copy lib*lib out64dll.dbg
copy lib*pdb out64dll.dbg
copy apps\openssl.exe out64dll.dbg
copy apps\openssl.pdb out64dll.dbg
xcopy /s include inc64.dbg\
nmake distclean

:end
rd/s/q Release x64 debug

echo s/SHAREDLIB =.*$/SHAREDLIB=%ZLIB_SHAREDLIB%.dll/>zlib1.sed
echo s/IMPLIB .*$/IMPLIB=%ZLIB_IMPLIB%.lib/>zlib2.sed
sed win32\makefile.msc -f zlib1.sed -f zlib2.sed  > win32\makefile.shib

echo s/SHAREDLIB =.*$/SHAREDLIB=%ZLIB_SHAREDLIB%D.dll/>zlib1.sed
echo s/IMPLIB .*$/IMPLIB=%ZLIB_IMPLIB%D.lib/>zlib2.sed
copy /y %SCRIPTS_DIR%\zlib3.sed
copy /y %SCRIPTS_DIR%\zlib4.sed

sed win32\makefile.msc -f zlib1.sed -f zlib2.sed -f zlib3.sed -f zlib4.sed > win32\makefile.shib > win32\makefile.shib.debug


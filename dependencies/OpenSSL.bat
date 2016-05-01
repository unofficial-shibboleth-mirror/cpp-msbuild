rem https://wiki.shibboleth.net/confluence/display/OpenSAML/OpenSSL

perl Configure VC-WIN32
perl util\mkfiles.pl >MINFO
perl util\mk1mf.pl INC=inc32     OUT=out32dll     TMP=tmp32dll           nasm dll VC-WIN32 >32-dll.mak.in
perl util\mk1mf.pl INC=inc32.dbg OUT=out32dll.dbg TMP=tmp32dll.dbg debug nasm dll VC-WIN32 >32-dll-debug.mak.in

rem Release: Append version to dll name

echo s/^O_SSL.*dll$/O_SSL=     $(LIB_D)\\\$(SSL)_%OPENSSL_NAME%.dll/ > openssl_o_ssl.sed
echo s/^O_CRYPTO.*dll$/O_CRYPTO=  $(LIB_D)\\\$(CRYPTO)_%OPENSSL_NAME%.dll/ > openssl_o_crypto.sed
copy /y %SCRIPTS_DIR%\openssl_I_ssl.sed
copy /y %SCRIPTS_DIR%\openssl_I_crypto.sed

sed 32-dll.mak.in -f openssl_o_ssl.sed -f openssl_o_crypto.sed -f openssl_I_ssl.sed -f openssl_I_crypto.sed > 32-dll.mak

rem Debug: Append versionD to dll name, D to Lib name

echo s/^O_SSL.*dll$/O_SSL=     $(LIB_D)\\\$(SSL)_%OPENSSL_NAME%D.dll/ > openssl_o_sslD.sed
echo s/^O_CRYPTO.*dll$/O_CRYPTO=  $(LIB_D)\\\$(CRYPTO)_%OPENSSL_NAME%D.dll/ > openssl_o_cryptoD.sed
copy/y %SCRIPTS_DIR%\openssl_l_sslD.sed 
copy /y %SCRIPTS_DIR%\openssl_l_cryptoD.sed

sed 32-dll-debug.mak.in -f openssl_o_sslD.sed -f openssl_o_cryptoD.sed -f openssl_I_ssl.sed -f openssl_I_crypto.sed -f openssl_l_sslD.sed -f openssl_l_cryptoD.sed > 32-dll-debug.mak 


perl util\mkdef.pl 32 libeay > ms\libeay32.def.master

rem Release: Append version to library name, Debug: Append versionD to library name

echo s/^LIBRARY .*$/LIBRARY LIBEAY32_%OPENSSL_NAME%/ > openssl.lib
echo s/^LIBRARY .*$/LIBRARY LIBEAY32_%OPENSSL_NAME%D/ > openssl.libd
sed ms\libeay32.def.master -f openssl.lib >  ms\libeay32.win32.def.nodebug
sed ms\libeay32.def.master -f openssl.libd > ms\libeay32.win32.def.debug


perl util\mkdef.pl 32 ssleay > ms\ssleay32.def.master
echo s/^LIBRARY .*$/LIBRARY SSLEAY32_%OPENSSL_NAME%/ > openssl.ssl
echo s/^LIBRARY .*$/LIBRARY SSLEAY32_%OPENSSL_NAME%D/ > openssl.ssld
sed ms\ssleay32.def.master -f openssl.ssl > ms\ssleay32.win32.def.nodebug
sed ms\ssleay32.def.master -f openssl.ssld > ms\ssleay32.win32.def.debug

Rem now do it all again for 64

perl Configure VC-WIN64A
perl util\mkfiles.pl >MINFO
perl util\mk1mf.pl INC=inc64     OUT=out64dll     TMP=tmp64dll           dll VC-WIN64A >64-dll.mak.in
sed 64-dll.mak.in -f openssl_o_ssl.sed -f openssl_o_crypto.sed -f openssl_I_ssl.sed -f openssl_I_crypto.sed > 64-dll.mak

perl util\mk1mf.pl INC=inc64.dbg OUT=out64dll.dbg TMP=tmp64dll.dbg debug dll VC-WIN64A >64-dll-debug.mak.in
sed 64-dll-debug.mak.in -f openssl_o_sslD.sed -f openssl_o_cryptoD.sed -f openssl_I_ssl.sed -f openssl_I_crypto.sed -f openssl_l_sslD.sed -f openssl_l_cryptoD.sed > 64-dll-debug.mak

nasm -f win64 -o ms\uptable.obj.64 ms\uptable.asm

perl util\mkdef.pl 64 libeay > ms\libeay32.def.master

sed ms\libeay32.def.master -f openssl.lib > ms\libeay32.x64.def.nodebug
sed ms\libeay32.def.master -f openssl.libd > ms\libeay32.x64.def.debug

rem perl util\mkdef.pl 32 ssleay > ms\ssleay32.def.master

sed ms\ssleay32.def.master -f openssl.ssl > ms\ssleay32.x64.def.nodebug
sed ms\ssleay32.def.master -f openssl.ssld > ms\ssleay32.x64.def.debug


@if NOT EXIST Configure (
              Echo Could not find Configure.  Check this is an OpenSSL Build >> %ROOT_DIR%build.log
              exit /b 1
)

@if NOT EXIST ConfigureD (
              Echo Could not find ConfigureD.  Apply customizations as per https://wiki.shibboleth.net/confluence/display/OpenSAML/OpenSSL >> %ROOT_DIR%build.log
              exit /b 1
)

@if EXIST x64 rd/s/q x64
@if EXIST x64Debug rd/s/q x64Debug
@if EXIST x86 rd/s/q x86
@if EXIST x86Debug rd/s/q x86Debug

exit /b 0
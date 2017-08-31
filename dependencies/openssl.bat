
@if NOT EXIST Configure (
              Echo Could not find Configure.  Check this is an OpenSSL Build >> %ROOT_DIR%build.log
              exit /b 1
)

@if NOT EXIST ConfigureD (
              Echo Could not find ConfigureD.  Apply custimzations as per https://wiki.shibboleth.net/confluence/display/OpenSAML/OpenSSL >> %ROOT_DIR%build.log
              exit /b 1
)

exit /b 0
!Include env.make
#
# Short cuts to make things easier
#

SPROOT=$(ROOT_DIR)\cpp-sp
XMLROOT=$(ROOT_DIR)\cpp-xmltooling
SAMLROOT=$(ROOT_DIR)\cpp-opensaml
VCVERSION=VC15

!if "$(DEBUG_INSTALLER)" != ""
!if "$(DEBUG_INSTALLER)" != "YES"
!error DEBUG_INSTALLER must be "YES" or not present: value $(DEBUG_INSTALLER)
!endif
!endif

NSAPI_MODULE="Server Modules\nsapi_shib"

SERVER_MODULES_32=shibd;"Server Modules\isapi_shib";"Server Modules\iis7_shib";"Server Modules\mod_shib_22";"Server Modules\mod_shib_24";$(NSAPI_MODULE)
SERVER_MODULES_64=shibd;"Server Modules\isapi_shib";"Server Modules\iis7_shib";"Server Modules\mod_shib_22";"Server Modules\mod_shib_24"
# fastCGI: "Server Modules\fastcgi\shibauthorizer";"Server Modules\fastcgi\shibresponder"


#
# The targets.  We want to build the two installers
#
all: msi32 msi64
     title Build Complete

clean: cleanxmltooling cleansaml cleansp cleanmsi

cleansp:
	cd $(SPROOT)\Build\$(VCVERSION)
	del/s *.dll *.exe *.lib *.obj *.pdb *.lib

cleanmsi:
	cd $(SPROOT)\MSI\WIX
	del/s *.wixobj *.wixlib *.wixpdb *.wixlib  *.msi *.msm

cleanxmltooling:
	cd $(XMLROOT)\Build\$(VCVERSION)
	del/s *.dll *.exe *.msm *.lib *.obj

cleansaml:
	cd $(SAMLROOT)\Build\$(VCVERSION)
	del/s *.dll *.exe *.msm *.lib *.obj


msi32: exe32 mergemodules32 msi32only

msi64: exe64 mergemodules64 exe32 mergemodules32 msi64only

msi32only:
	cd $(SPROOT)\Projects\$(VCVERSION)
        title MSI Build 32 bit
	msbuild  /property:Platform=Win32;Configuration=Release /maxcpucount .\Shibboleth.sln /t:Installers\MergeModules;Installers\Installer

msi64only:
	cd $(SPROOT)\Projects\$(VCVERSION)
        title MSI Build 64 bit
	msbuild  /property:Platform=x64;Configuration=Release /maxcpucount .\Shibboleth.sln /t:Installers\MergeModules;Installers\Installer

mergemodules32: xmltooling32 saml32 shibsp32
        title MSM Build 32 bit
	msbuild  /property:Platform=Win32;Configuration=Release /maxcpucount .\Shibboleth.sln /t:Installers\Installer

mergemodules64: xmltooling64 saml64 shibsp64

shibsp32: saml32
	cd $(SPROOT)\Projects\$(VCVERSION)
        title SP-Dll Release Build - 32 bit
	msbuild  /property:Platform=Win32;Configuration=Release /maxcpucount .\shibboleth.sln /t:shibsp;shibsp-lite
!if "$(DEBUG_INSTALLER)" != ""
        title SP-Dll Debug Build - 32 bit
	msbuild  /property:Platform=Win32;Configuration=Debug /maxcpucount .\shibboleth.sln /t:shibsp;shibsp-lite
!endif

shibsp64: saml64
	cd $(SPROOT)\Projects\$(VCVERSION)
        title SP-Dll Release Build - 64 bit
	msbuild  /property:Platform=x64;Configuration=Release /maxcpucount .\shibboleth.sln /t:shibsp;shibsp-lite
!if "$(DEBUG_INSTALLER)" != ""
        title SP-Dll Debug Build - 64 bit
	msbuild  /property:Platform=x64;Configuration=Debug /maxcpucount .\shibboleth.sln /t:shibsp;shibsp-lite
!endif

saml32: xmltooling32
        title SAML Release Build - 32 bit
	cd $(SAMLROOT)\Projects\$(VCVERSION)
	msbuild  /property:Platform=Win32;Configuration=Release /maxcpucount cpp-opensaml2.sln /t:saml;samlsign
        title SAML Debug Build - 32 bit
	msbuild  /property:Platform=Win32;Configuration=Debug /maxcpucount cpp-opensaml2.sln /t:saml;samlsign


saml64: xmltooling64
	cd $(SAMLROOT)\Projects\$(VCVERSION)
        title SAML Release Build - 64 bit
	msbuild  /property:Platform=x64;Configuration=Release /maxcpucount cpp-opensaml2.sln /t:saml;samlsign
!if "$(DEBUG_INSTALLER)" != ""
        title SAML Debug Build - 64 bit
	msbuild  /property:Platform=x64;Configuration=Debug /maxcpucount cpp-opensaml2.sln /t:saml;samlsign
!endif

xmltooling32:
	cd $(XMLROOT)\Projects\$(VCVERSION)
        title XMLTooling Release Build - 32 bit
	msbuild  /property:Platform=Win32;Configuration=Release /maxcpucount cpp-xmltooling.sln /t:xmltooling;xmltooling-lite
!if "$(DEBUG_INSTALLER)" != ""
        title XMLTooling Debug Build - 32 bit
	msbuild  /property:Platform=Win32;Configuration=Debug /maxcpucount cpp-xmltooling.sln /t:xmltooling;xmltooling-lite
!endif

xmltooling64:
	cd $(XMLROOT)\Projects\$(VCVERSION)
        title XMLTooling Release Build - 64 bit
	msbuild  /property:Platform=x64;Configuration=Release /maxcpucount cpp-xmltooling.sln /t:xmltooling;xmltooling-lite
!if "$(DEBUG_INSTALLER)" != ""
        title XMLTooling Debug Build - 64 bit
	msbuild  /property:Platform=x64;Configuration=Debug /maxcpucount cpp-xmltooling.sln /t:xmltooling;xmltooling-lite
!endif

exe32: shibsp32
	cd $(SPROOT)\Projects\$(VCVERSION)
        title SP Release Build - 32 bit
	msbuild /property:Platform=Win32;Configuration=Release /maxcpucount .\shibboleth.sln /t:utilities\messages;utilities\resolvertest;utilities\mdquery;Extensions\adfs;Extensions\adfs-lite;Extensions\odbc-store;Extensions\plugins;Extensions\plugins-lite;$(SERVER_MODULES_32)
!if "$(DEBUG_INSTALLER)" != ""
        title SP Release Build - 32 bit
	msbuild   /property:Platform=Win32;Configuration=Debug /maxcpucount .\shibboleth.sln /t:utilities\messages;utilities\resolvertest;utilities\mdquery;Extensions\adfs;Extensions\adfs-lite;Extensions\odbc-store;Extensions\plugins;Extensions\plugins-lite;$(SERVER_MODULES_32)
!endif


exe64: shibsp64
	cd $(SPROOT)\Projects\$(VCVERSION)
        title SP Release Build - 64 bit
	msbuild /property:Platform=x64;Configuration=Release /maxcpucount .\shibboleth.sln /t:utilities\messages;utilities\resolvertest;utilities\mdquery;Extensions\adfs;Extensions\adfs-lite;Extensions\odbc-store;Extensions\plugins;Extensions\plugins-lite;$(SERVER_MODULES_64)
!if "$(DEBUG_INSTALLER)" != ""
        title SP Debug Build - 64 bit
	msbuild   /property:Platform=x64;Configuration=Debug /maxcpucount .\shibboleth.sln /t:utilities\resolvertest;utilities\messages;utilities\mdquery;Extensions\adfs;Extensions\adfs-lite;Extensions\odbc-store;Extensions\plugins;Extensions\plugins-lite;$(SERVER_MODULES_64)
!endif

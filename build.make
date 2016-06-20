#
# Short cuts to make things easier

SPROOT=$(MAKEDIR)\..\cpp-sp
XMLROOT=$(MAKEDIR)\..\cpp-xmltooling
SAMLROOT=$(MAKEDIR)\..\cpp-opensaml
VCVERSION=VC10


#
# The targets.  We want to build the two installers
#
all: msi32 msi64

clean: 
	cd $(SPROOT)\Build\$(VCVERSION)
	del/s *.dll *.exe *.msm *.lib *.obj
	del/s *.wixobj *.lib *.wixlib  *.pdb *.wixpdb *.wixlib  *.msi 
	cd $(XMLROOT)\Build\$(VCVERSION)
	del/s *.dll *.exe *.msm *.lib *.obj
	cd $(SAMLROOT)\Build\$(VCVERSION)
	del/s *.dll *.exe *.msm *.lib *.obj


msi32: exe32 mergemodules32 msi32only

msi64: exe64 mergemodules64 msi64only

msi32only:
	cd $(SPROOT)\Projects\$(VCVERSION)
	msbuild  /property:Platform=Win32;Configuration=Release /maxcpucount .\Shibboleth.sln /t:Installers\MergeModules;Installers\Installer

msi64only:
	cd $(SPROOT)\Projects\$(VCVERSION)
	msbuild  /property:Platform=x64;Configuration=Release /maxcpucount .\Shibboleth.sln /t:Installers\MergeModules;Installers\Installer

mergemodules32: xmltooling32 saml32 shibsp32

mergemodules64: xmltooling64 saml64 shibsp64

shibsp32: saml32
	cd $(SPROOT)\Projects\$(VCVERSION)
	msbuild  /property:Platform=Win32;Configuration=Release /maxcpucount .\shibboleth.sln /t:shibsp;shibsp-lite
	msbuild  /property:Platform=Win32;Configuration=Debug /maxcpucount .\shibboleth.sln /t:shibsp;shibsp-lite

shibsp64: saml64
	cd $(SPROOT)\Projects\$(VCVERSION)
	msbuild  /property:Platform=x64;Configuration=Release /maxcpucount .\shibboleth.sln /t:shibsp;shibsp-lite
	msbuild  /property:Platform=x64;Configuration=Debug /maxcpucount .\shibboleth.sln /t:shibsp;shibsp-lite

saml32: xmltooling32
	cd $(SAMLROOT)\Projects\$(VCVERSION)
	msbuild  /property:Platform=Win32;Configuration=Release /maxcpucount cpp-opensaml2.sln /t:saml;samlsign
	msbuild  /property:Platform=Win32;Configuration=Debug /maxcpucount cpp-opensaml2.sln /t:saml;samlsign


saml64: xmltooling64
	cd $(SAMLROOT)\Projects\$(VCVERSION)
	msbuild  /property:Platform=x64;Configuration=Release /maxcpucount cpp-opensaml2.sln /t:saml;samlsign
	msbuild  /property:Platform=x64;Configuration=Debug /maxcpucount cpp-opensaml2.sln /t:saml;samlsign

xmltooling32:
	cd $(XMLROOT)\Projects\$(VCVERSION)
	msbuild  /property:Platform=Win32;Configuration=Release /maxcpucount cpp-xmltooling.sln /t:xmltooling;xmltooling-lite
	msbuild  /property:Platform=Win32;Configuration=Debug /maxcpucount cpp-xmltooling.sln /t:xmltooling;xmltooling-lite

xmltooling64:
	cd $(XMLROOT)\Projects\$(VCVERSION)
	msbuild  /property:Platform=x64;Configuration=Release /maxcpucount cpp-xmltooling.sln /t:xmltooling;xmltooling-lite
	msbuild  /property:Platform=x64;Configuration=Debug /maxcpucount cpp-xmltooling.sln /t:xmltooling;xmltooling-lite

exe32: shibsp32
	cd $(SPROOT)\Projects\$(VCVERSION)
	msbuild /property:Platform=Win32;Configuration=Release /maxcpucount .\shibboleth.sln /t:utilities\resolvertest;utilities\mdquery;Extensions\adfs;Extensions\adfs-lite;Extensions\odbc-store;Extensions\plugins;Extensions\plugins-lite;"Server Modules\fastcgi\shibauthorizer";"Server Modules\fastcgi\shibresponder";shibd;"Server Modules\isapi_shib";"Server Modules\mod_shib_13";"Server Modules\mod_shib_20";"Server Modules\mod_shib_22";"Server Modules\mod_shib_24";"Server Modules\nsapi_shib"
	msbuild   /property:Platform=Win32;Configuration=Debug /maxcpucount .\shibboleth.sln /t:utilities\resolvertest;utilities\mdquery;Extensions\adfs;Extensions\adfs-lite;Extensions\odbc-store;Extensions\plugins;Extensions\plugins-lite;"Server Modules\fastcgi\shibauthorizer";"Server Modules\fastcgi\shibresponder";shibd;"Server Modules\isapi_shib";"Server Modules\mod_shib_13";"Server Modules\mod_shib_20";"Server Modules\mod_shib_22";"Server Modules\mod_shib_24";"Server Modules\nsapi_shib"

exe64: shibsp64
	cd $(SPROOT)\Projects\$(VCVERSION)
	msbuild /property:Platform=x64;Configuration=Release /maxcpucount .\shibboleth.sln /t:utilities\resolvertest;utilities\mdquery;Extensions\adfs;Extensions\adfs-lite;Extensions\odbc-store;Extensions\plugins;Extensions\plugins-lite;"Server Modules\fastcgi\shibauthorizer";"Server Modules\fastcgi\shibresponder";shibd;"Server Modules\isapi_shib";"Server Modules\mod_shib_22";"Server Modules\mod_shib_24"
	msbuild   /property:Platform=x64;Configuration=Debug /maxcpucount .\shibboleth.sln /t:utilities\resolvertest;utilities\mdquery;Extensions\adfs;Extensions\adfs-lite;Extensions\odbc-store;Extensions\plugins;Extensions\plugins-lite;"Server Modules\fastcgi\shibauthorizer";"Server Modules\fastcgi\shibresponder";shibd;"Server Modules\isapi_shib";"Server Modules\mod_shib_22";"Server Modules\mod_shib_24"

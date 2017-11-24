#
# Makefile to build Shibboleth dependencies.  One architecture only
#

##
## Do all The preprocessor stuff.  Targets follow 
##
!if "$(VSCMD_ARG_TGT_ARCH)" == "x86"
!message Building x86
OpenSSLName=WIN32
ZlibTargetDir=.
!elseif "$(VSCMD_ARG_TGT_ARCH)" == "x64"
!message Building x64
OpenSSLName=WIN64A
ZlibTargetDir=x64
!else
!error "Target architecture must be x86 or x64"
!endif

!if "$(ROOT_DIR)" == ""
!error ROOT_DIR not defined
!endif

!if "$(VISUALSTUDIOVERSION)" != "15.0"
!error this code only known to work with VC15
!endif

!if "$(ZLIB_SHAREDLIB)" == ""
!error ZLIB_SHAREDLIB not defined
!endif

!if "$(ZLIB_IMPLIB)" == ""
!error ZLIB_IMPLIB not defined
!endif


##
## TARGETS
##
help:
	@cls
	@echo "TARGETS: clean all
	@echo "         openssl targets:  openssl, openssl-(clean|debug|release)[-configure]
	@echo "
	@echo "REQUIRED VARIABLES
	@echo "			ROOT_DIR
	@echo "			OPENSSL_DIR

clean: openssl-clean

all: openssl zlib

test-env:

#
# Zlib
#
zlib: zlib-debug zlib-release

zlib-release: zlib-test zlib-release-configure zlib-release-build

zlib-debug: zlib-test zlib-debug-configure zlib-debug-build

zlib-test: test-env $(ROOT_DIR)\$(ZLIB_DIR)\win32\makefile.msc

zlib-clean: zlib-test
	cd $(ROOT_DIR)\$(ZLIB_DIR)
	-2 nmake /f win32\makefile.shib clean
	-2 nmake /f win32\makefile.shib.debug clean
	-2 del zlib1.sed zlib2.sed zlib3.sed zlib4.sed zlib1d.sed zlib2d.sed
	-2 rd /s /q Debug
	-2 rd /s /q Release
	-2 rd /s /q x64
	-2 del win32\makefile.shib
	-2 del win32\makefile.shib.debug

zlib-release-configure: $(ROOT_DIR)\$(ZLIB_DIR)\win32\makefile.shib $(ROOT_DIR)\$(ZLIB_DIR)\$(ZlibTargetDir)\Release

zlib-debug-configure: $(ROOT_DIR)\$(ZLIB_DIR)\win32\makefile.shib.debug $(ROOT_DIR)\$(ZLIB_DIR)\$(ZlibTargetDir)\Debug

zlib-release-build: $(ROOT_DIR)\$(ZLIB_DIR)\$(ZlibTargetDir)\Release\$(ZLIB_SHAREDLIB).dll \
	$(ROOT_DIR)\$(ZLIB_DIR)\$(ZlibTargetDir)\Release\$(ZLIB_IMPLIB).lib

zlib-debug-build: $(ROOT_DIR)\$(ZLIB_DIR)\$(ZlibTargetDir)\Debug\$(ZLIB_SHAREDLIB)D.dll \
	$(ROOT_DIR)\$(ZLIB_DIR)\$(ZlibTargetDir)\Debug\$(ZLIB_IMPLIB)D.lib

$(ROOT_DIR)\$(ZLIB_DIR)\win32\makefile.shib: $(ROOT_DIR)\$(ZLIB_DIR)\zlib1.sed \
	$(ROOT_DIR)\$(ZLIB_DIR)\zlib2.sed \
	$(ROOT_DIR)\$(ZLIB_DIR)\zlib3.sed \
	$(ROOT_DIR)\$(ZLIB_DIR)\zlib4.sed
	cd $(ROOT_DIR)\$(ZLIB_DIR)
	sed win32\makefile.msc -f zlib1.sed -f zlib2.sed  > $@

$(ROOT_DIR)\$(ZLIB_DIR)\win32\makefile.shib.debug: $(ROOT_DIR)\$(ZLIB_DIR)\zlib1d.sed \
	$(ROOT_DIR)\$(ZLIB_DIR)\zlib2d.sed \
	$(ROOT_DIR)\$(ZLIB_DIR)\zlib3.sed \
	$(ROOT_DIR)\$(ZLIB_DIR)\zlib4.sed
	cd $(ROOT_DIR)\$(ZLIB_DIR)
	sed win32\makefile.msc -f zlib1d.sed -f zlib2d.sed -f zlib3.sed -f zlib4.sed > $@

$(ROOT_DIR)\$(ZLIB_DIR)\zlib1.sed:
	echo s/SHAREDLIB =.*$$/SHAREDLIB=$(ZLIB_SHAREDLIB).dll/ > $@

$(ROOT_DIR)\$(ZLIB_DIR)\zlib2.sed:
	echo s/IMPLIB .*$$/IMPLIB=$(ZLIB_IMPLIB).lib/ > $@

$(ROOT_DIR)\$(ZLIB_DIR)\zlib3.sed	$(ROOT_DIR)\$(ZLIB_DIR)\zlib4.sed: $$(@F)
	copy $(@F) $(ROOT_DIR)\$(ZLIB_DIR)

$(ROOT_DIR)\$(ZLIB_DIR)\zlib1d.sed:
	echo s/SHAREDLIB =.*$$/SHAREDLIB=$(ZLIB_SHAREDLIB)D.dll/ > $@

$(ROOT_DIR)\$(ZLIB_DIR)\zlib2d.sed:
	echo s/IMPLIB .*$$/IMPLIB=$(ZLIB_IMPLIB)D.lib/ > $@

$(ROOT_DIR)\$(ZLIB_DIR)\$(ZlibTargetDir)\Release $(ROOT_DIR)\$(ZLIB_DIR)\$(ZlibTargetDir)\Debug:
	mkdir $@

$(ROOT_DIR)\$(ZLIB_DIR)\$(ZlibTargetDir)\Release\$(ZLIB_IMPLIB).lib: $$(@D)\$(ZLIB_SHAREDLIB).dll
	copy $(ROOT_DIR)\$(ZLIB_DIR)\$(ZLIB_IMPLIB).lib $(@D)

$(ROOT_DIR)\$(ZLIB_DIR)\$(ZlibTargetDir)\Debug\$(ZLIB_IMPLIB)D.lib: $$(@D)\$(ZLIB_SHAREDLIB)D.dll
	copy $(ROOT_DIR)\$(ZLIB_DIR)\$(ZLIB_IMPLIB)D.lib $(@D)


$(ROOT_DIR)\$(ZLIB_DIR)\$(ZlibTargetDir)\release\$(ZLIB_SHAREDLIB).dll: $(ROOT_DIR)\$(ZLIB_DIR)\win32\makefile.shib
	cd $(ROOT_DIR)\$(ZLIB_DIR)
	nmake/f win32\makefile.shib clean
	nmake/f win32\makefile.shib
	copy $(@F) $@

$(ROOT_DIR)\$(ZLIB_DIR)\$(ZlibTargetDir)\debug\$(ZLIB_SHAREDLIB)D.dll: $(ROOT_DIR)\$(ZLIB_DIR)\win32\makefile.shib.debug
	cd $(ROOT_DIR)\$(ZLIB_DIR)
	nmake/f win32\makefile.shib.debug clean
	nmake/f win32\makefile.shib.debug
	copy $(@F) $@


#
# OpenSSL
#
openssl: openssl-debug openssl-release

openssl-release: openssl-test openssl-release-configure openssl-build

openssl-debug: openssl-test openssl-debug-configure openssl-build

openssl-test: test-env $(ROOT_DIR)\$(OPENSSL_DIR)

openssl-clean: openssl-test openssl-clean-configure 
	cd $(ROOT_DIR)\$(OPENSSL_DIR)
	-2 nmake distclean
	-2 rd/s/q x64
	-2 rd/s/q x64Debug
	-2 rd/s/q x86
	-2 rd/s/q x86Debug

openssl-clean-configure: openssl-test
	cd $(ROOT_DIR)\$(OPENSSL_DIR)
	-2 nmake distclean

openssl-release-configure: openssl-test $(ROOT_DIR)\$(OPENSSL_DIR)\Configure openssl-clean-configure
	title Build OpenSSL $(VSCMD_ARG_TGT_ARCH) Release
	cd $(ROOT_DIR)\$(OPENSSL_DIR)
	perl Configure VC-$(OpenSSLName) --prefix=%ROOT_DIR%\%OPENSSL_DIR%\$(VSCMD_ARG_TGT_ARCH)

openssl-debug-configure: openssl-test $(ROOT_DIR)\$(OPENSSL_DIR)\ConfigureD openssl-clean-configure
	title Build OpenSSL $(VSCMD_ARG_TGT_ARCH) Debug
	cd $(ROOT_DIR)\$(OPENSSL_DIR)
	perl ConfigureD debug-VC-$(OpenSSLName) --prefix=%ROOT_DIR%\%OPENSSL_DIR%\$(VSCMD_ARG_TGT_ARCH)Debug

openssl-build: $(ROOT_DIR)\$(OPENSSL_DIR)\makefile
	cd $(ROOT_DIR)\$(OPENSSL_DIR)
	nmake install_sw





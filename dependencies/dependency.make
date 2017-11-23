#
# Makefile to build Shibboleth dependencies.  One architecture only
#

##
## Do all The preprocessor stuff.  Targets follow 
##
!if "$(VSCMD_ARG_TGT_ARCH)" == "x86"
!message Building x86
OpenSSLName=WIN32
!elseif "$(VSCMD_ARG_TGT_ARCH)" == "x64"
!message Building x64
OpenSSLName=WIN64A

!else
!error "Target architecture must be x86 or x64"
!endif
!if "$(ROOT_DIR)" == ""
	!error ROOT_DIR not defined
!endif
!if "$(VISUALSTUDIOVERSION)" != "15.0"
	!error this code only known to work with VC15
!endif

help:
	@cls
	@echo "TARGETS: clean all
	@echo "         openssl targets:  openssl, openssl-(clean|debug|release)[-configure]
	@echo "
	@echo "REQUIRED VARIABLES
	@echo "			ROOT_DIR
	@echo "			OPENSSL_DIR

clean: openssl-clean

all: openssl

test-env:

#
# OpenSSL
#
test-openssl: test-env $(ROOT_DIR)\$(OPENSSL_DIR)

openssl-clean: test-openssl openssl-clean-configure 
	cd $(ROOT_DIR)\$(OPENSSL_DIR)
	-2 nmake distclean
	-2 rd/s/q x64
	-2 rd/s/q x64Debug
	-2 rd/s/q x86
	-2 rd/s/q x86Debug

openssl-clean-configure:
	cd $(ROOT_DIR)\$(OPENSSL_DIR)
	-2 nmake distclean

openssl-release-configure: test-openssl $(ROOT_DIR)\$(OPENSSL_DIR)\Configure openssl-clean-configure
	title Build OpenSSL $(VSCMD_ARG_TGT_ARCH) Release
	cd $(ROOT_DIR)\$(OPENSSL_DIR)
	perl Configure VC-$(OpenSSLName) --prefix=%ROOT_DIR%\%OPENSSL_DIR%\$(VSCMD_ARG_TGT_ARCH)

openssl-debug-configure: test-openssl $(ROOT_DIR)\$(OPENSSL_DIR)\ConfigureD openssl-clean-configure
	title Build OpenSSL $(VSCMD_ARG_TGT_ARCH) Debug
	cd $(ROOT_DIR)\$(OPENSSL_DIR)
	perl ConfigureD debug-VC-$(OpenSSLName) --prefix=%ROOT_DIR%\%OPENSSL_DIR%\$(VSCMD_ARG_TGT_ARCH)Debug

openssl-build: $(ROOT_DIR)\$(OPENSSL_DIR)\makefile
	cd $(ROOT_DIR)\$(OPENSSL_DIR)
	nmake install_sw

openssl: openssl-debug openssl-release

openssl-release: test-openssl openssl-release-configure openssl-build

openssl-debug: test-openssl openssl-debug-configure openssl-build



curl-clean:


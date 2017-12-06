##
## Common Include file for Shibboleth nMake.
##
!if "$(VISUALSTUDIOVERSION)" != "15.0"
!error this code only known to work with VC15
!endif


!if "$(ROOT_DIR)" == ""
!error ROOT_DIR not defined
!endif

!if "$(PERL)" == ""
PERL=perl
!endif

!if "$(SED)" == ""
SED=sed
!endif

!if "$(OPENSSL_DIR)" == ""
!error OPENSSL_DIR not defined
!endif

!if "$(OPENSSL_MM_VERSION)" == ""
!error OPENSSL_MM_VERSION not defined
!endif

!if "$(OPENSSL_MM_VERSION)" == ""
!error OPENSSL_FILE_VERSION not defined
!endif



environment:
	@echo ROOT_DIR	 			$(ROOT_DIR)
	@echo SED             		$(SED)
    @echo PERL            		$(PERL)
    @echo
    @echo OPENSSL_DIR			$(OPENSSL_DIR)
    @echo OPENSSL_FILE_VERSION	$(OPENSSL_FILE_VERSION)
    @echo OPENSSL_MM_VERSION	$(OPENSSL_MM_VERSION)
	@echo
	@echo

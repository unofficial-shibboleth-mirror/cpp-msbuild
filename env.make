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

!if $(SED) == ""
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

!if "$(LIBCURL_DIR)" == ""
!error LIBCURL_DIR not defined
!endif

!if "$(LIBCURL_VERSION)" == ""
!error LIBCURL_VERSION not defined
!endif

!if "$(XSEC_DIR)" == ""
!error XSEC_DIR not defined
!endif

!if "$(XSEC_FILE_VERSION)" == ""
!error XSEC_FILE_VERSION not defined
!endif

!if "$(XSEC_MM_VERSION)" == ""
!error XSEC_MM_VERSION not defined
!endif

#!if "$(APACHE_13_ROOT)" == ""
#!error APACHE_13_ROOT not defined
#!endif

!if "$(APACHE_20_ROOT)" == ""
!error APACHE_20_ROOT not defined
!endif

!if "$(APACHE_22_ROOT)" == ""
!error APACHE_22_ROOT not defined
!endif

!if "$(APACHE_22_ROOT64)" == ""
!error APACHE_22_ROOT64 not defined
!endif

!if "$(APACHE_24_ROOT)" == ""
!error APACHE_24_ROOT not defined
!endif

!if "$(APACHE_24_ROOT64)" == ""
!error APACHE_24_ROOT64 not defined
!endif


!if "$(ZLIB_DIR)" == ""
!error ZLIB_DIR not defined
!endif

!if "$(ZLIB_FILE_VERSION)" == ""
!error ZLIB_FILE_VERSION not defined
!endif

!if "$(ZLIB_IMPLIB)" == ""
!error ZLIB_IMPLIB not defined
!endif

!if "$(ZLIB_MM_VERSION)" == ""
!error ZLIB_MM_VERSION not defined
!endif


!if "$(XERCES_DIR)" == ""
!error XERCES_DIR not defined
!endif

!if "$(XERCES_MM_VERSION)" == ""
!error XERCES_MM_VERSION not defined
!endif

!if "$(XERCES_FILE_VERSION)" == ""
!error XERCES_FILE_VERSION not defined
!endif


!if "$(LOG4SHIB_DIR)" == ""
!error LOG4SHIB_DIR not defined
!endif

!if "$(LOG4SHIB_MM_VERSION)" == ""
!error LOG4SHIB_MM_VERSION not defined
!endif

!if "$(LOG4SHIB_FILE_VERSION)" == ""
!error LOG4SHIB_FILE_VERSION not defined
!endif

environment:
	@echo ROOT_DIR			$(ROOT_DIR)
	@echo SED			$(SED)
	@echo PERL			$(PERL)
	@echo OPENSSL_DIR		$(OPENSSL_DIR)
	@echo OPENSSL_FILE_VERSION	$(OPENSSL_FILE_VERSION)
	@echo OPENSSL_MM_VERSION	$(OPENSSL_MM_VERSION)
	@echo LIBCURL_VERSION		$(LIBCURL_VERSION)
	@echo LIBCURL_DIR		$(LIBCURL_DIR)
	@echo XSEC_DIR			$(XSEC_DIR)
	@echo XSEC_FILE_VERSION		$(XSEC_FILE_VERSION)
	@echo XSEC_MM_VERSION		$(XSEC_MM_VERSION)
	@echo APACHE_13_ROOT		$(APACHE_13_ROOT)
	@echo APACHE_20_ROOT		$(APACHE_20_ROOT)
	@echo APACHE_22_ROOT		$(APACHE_22_ROOT)
	@echo APACHE_22_ROOT64		$(APACHE_22_ROOT64)
	@echo APACHE_24_ROOT		$(APACHE_24_ROOT)
	@echo APACHE_24_ROOT64		$(APACHE_24_ROOT64)
	@echo ZLIB_DIR			$(ZLIB_DIR)
	@echo ZLIB_IMPLIB		$(ZLIB_IMPLIB)
	@echo ZLIB_FILE_VERSION		$(ZLIB_FILE_VERSION)
	@echo ZLIB_MM_VERSION		$(ZLIB_MM_VERSION)
	@echo XERCES_DIR		$(XERCES_DIR)
	@echo XERCES_FILE_VERSION	$(XERCES_FILE_VERSION)
	@echo XERCES_MM_VERSION		$(XERCES_MM_VERSION)
	@echo LOG4SHIB_DIR		$(LOG4SHIB_DIR)
	@echo LOG4SHIB_FILE_VERSION	$(LOG4SHIB_FILE_VERSION)
	@echo LOG4SHIB_MM_VERSION	$(LOG4SHIB_MM_VERSION)


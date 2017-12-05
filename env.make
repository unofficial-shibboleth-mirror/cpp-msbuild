##
## Common Include file for Shibboleth nMake.
##

!if "$(ROOT_DIR)" == ""
!error ROOT_DIR not defined
!endif



!if "$(SED)" == ""
SED=sed
!endif


environment:
	@echo	ROOT_DIR 		$(ROOT_DIR)

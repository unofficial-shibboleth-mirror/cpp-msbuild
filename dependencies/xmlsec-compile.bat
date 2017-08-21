rem xmlsec-compile x64 
rem xmlsec-compile Win32

set ForceImportBeforeCppTargets=%SCRIPTS_DIR%\xsec.props
msbuild /m projects\VC%MsVCVersionNum%.0\xsec\xsec.sln /p:Configuration="Debug No Xalan" /m    /t:clean /p:Platform=%1%
@if errorlevel 1 goto end
msbuild /m projects\VC%MsVCVersionNum%.0\xsec\xsec.sln /p:Configuration="Release No Xalan" /m  /t:clean /p:Platform=%1%
@if errorlevel 1 goto end

msbuild /m projects\VC%MsVCVersionNum%.0\xsec\xsec.sln /p:Configuration="Debug No Xalan" /m    /t:Build /p:Platform=%1%
@if errorlevel 1 goto end
msbuild /m projects\VC%MsVCVersionNum%.0\xsec\xsec.sln /p:Configuration="Release No Xalan" /m  /t:Build /p:Platform=%1%
@if errorlevel 1 goto end


:end

set ForceImportBeforeCppTargets=

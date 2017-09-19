rem xmlsec-compile Win64
rem xmlsec-compile Win32

set ForceImportBeforeCppTargets=%SCRIPTS_DIR%\xsec.props
msbuild /m projects\VC%MsVCVersionNum%.0\xsec\xsec.sln /p:Configuration="Debug Minimal" /m    /t:clean /p:Platform=%1%
@if errorlevel 1 goto end
msbuild /m projects\VC%MsVCVersionNum%.0\xsec\xsec.sln /p:Configuration="Release Minimal" /m  /t:clean /p:Platform=%1%
@if errorlevel 1 goto end

msbuild /m projects\VC%MsVCVersionNum%.0\xsec\xsec.sln /p:Configuration="Debug Minimal" /m    /t:Build /p:Platform=%1%
@if errorlevel 1 goto end
msbuild /m projects\VC%MsVCVersionNum%.0\xsec\xsec.sln /p:Configuration="Release Minimal" /m  /t:Build /p:Platform=%1%
@if errorlevel 1 goto end


:end

set ForceImportBeforeCppTargets=

set ForceImportBeforeCppTargets=%SCRIPTS_DIR%\xsec.props
msbuild /m projects\VC%MsVCVersionNum%.0\xsec\xsec.sln /p:Configuration="Debug No Xalan"     /t:clean /p:Platform=%1%
@if errorlevel 1 goto end
msbuild /m projects\VC%MsVCVersionNum%.0\xsec\xsec.sln /p:Configuration="Release No Xalan"   /t:clean /p:Platform=%1%
@if errorlevel 1 goto end

msbuild /m projects\VC%MsVCVersionNum%.0\xsec\xsec.sln /p:Configuration="Debug No Xalan"     /t:xsec_lib:Rebuild /p:Platform=%1%
@if errorlevel 1 goto end
msbuild /m projects\VC%MsVCVersionNum%.0\xsec\xsec.sln /p:Configuration="Release No Xalan"   /t:xsec_lib:Rebuild /p:Platform=%1%
@if errorlevel 1 goto end


:end

set ForceImportBeforeCppTargets=

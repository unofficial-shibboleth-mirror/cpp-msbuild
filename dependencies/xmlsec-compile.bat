set ForceImportBeforeCppTargets=%SCRIPTS_DIR%\xsec.props
msbuild /m projects\VC14.0\xsec\xsec.sln /p:Configuration="Debug No Xalan"     /t:clean /p:Platform=%1%
@if errorlevel 1 goto end
msbuild /m projects\VC14.0\xsec\xsec.sln /p:Configuration="Release No Xalan"   /t:clean /p:Platform=%1%
@if errorlevel 1 goto end


msbuild /m projects\VC14.0\xsec\xsec.sln /p:Configuration="Debug No Xalan"     /t:Rebuild /p:Platform=%1%
@if errorlevel 1 goto end
msbuild /m projects\VC14.0\xsec\xsec.sln /p:Configuration="Release No Xalan"   /t:Rebuild /p:Platform=%1%
@if errorlevel 1 goto end

set ForceImportBeforeCppTargets=

:end
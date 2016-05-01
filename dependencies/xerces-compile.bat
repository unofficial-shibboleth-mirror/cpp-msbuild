msbuild /m projects\Win32\VC14\xerces-all\xerces-all.sln /p:Configuration=Debug     /t:all:clean /p:Platform=%1%
@if errorlevel 1 goto end
msbuild /m projects\Win32\VC14\xerces-all\xerces-all.sln /p:Configuration=Release   /t:all:clean /p:Platform=%1%
@if errorlevel 1 goto end

msbuild /m projects\Win32\VC14\xerces-all\xerces-all.sln /t:all:Rebuild /p:Configuration=Release /p:Platform=%1%
@if errorlevel 1 goto end
msbuild /m projects\Win32\VC14\xerces-all\xerces-all.sln /t:all:Rebuild /p:Configuration=Debug   /p:Platform=%1%
@if errorlevel 1 goto end

:end
msbuild /m msvc14\msvc14.sln /p:Configuration=Debug     /t:clean /p:Platform=%1%
@if errorlevel 1 goto end
msbuild /m msvc14\msvc14.sln /p:Configuration=Release   /t:clean /p:Platform=%1%
@if errorlevel 1 goto end

msbuild /m msvc14\msvc14.sln /t:Rebuild /p:Configuration=Release /p:Platform=%1%  
@if errorlevel 1 goto end
msbuild /m msvc14\msvc14.sln /t:Rebuild /p:Configuration=Debug   /p:Platform=%1%  
@if errorlevel 1 goto end

:end
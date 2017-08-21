cd /d %ROOT_DIR%%XERCES_DIR%
cd buildx86\%MsVCVersion%
cmake --build . --config Debug --clean-first --target install
@if errorlevel 1 goto end
cmake --build . --config Release --clean-first --target install
@if errorlevel 1 goto end
cd ..\..\buildx64\%MsVCVersion%

cmake --build . --config Debug --clean-first --target install
@if errorlevel 1 goto end
cmake --build . --config Release --clean-first --target install
@if errorlevel 1 goto end

:end
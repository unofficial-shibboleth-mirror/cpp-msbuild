cd /d %ROOT_DIR%%XERCES_DIR%
rd/s/q buildx86\%MsVCVersion% buildx64\%MsVCVersion% install32\%MsVCVersion% install64\%MsVCVersion%
mkdir buildx86\%MsVCVersion%
cd buildx86\%MsVCVersion%
set CXXFLAGS=/MP
cmake -G "Visual Studio 15 2017" -DCMAKE_INSTALL_PREFIX=%ROOT_DIR%%XERCES_DIR%\install32\%MsVCVersion% ..\..
cd ..\..
mkdir buildx64\%MsVCVersion%
cd buildx64\%MsVCVersion%
cmake -G "Visual Studio 15 2017 Win64" -DCMAKE_INSTALL_PREFIX=%ROOT_DIR%%XERCES_DIR%\install64\%MsVCVersion% ..\..
cd ..\..
set CXXFLAGS=

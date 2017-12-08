setlocal EnableDelayedExpansion

@echo off


set OLDPATH=%path%
set CMAKE_GENERATOR=Visual Studio 14 2015

call "%VS140COMNTOOLS%../../VC/bin/amd64/vcvars64.bat"
if errorlevel 1 exit /b %errorlevel%

rd /Q /S cmake_temp 2>nul
mkdir cmake_temp
pushd cmake_temp
cmake -G "%CMAKE_GENERATOR%" -DCMAKE_INSTALL_PREFIX=..\artifacts ..\
msbuild OpenCV.sln /t:build /p:Configuration=Release /p:Platform=Win32 /m /toolsversion:14.0
if errorlevel 1 exit /b %errorlevel%

echo "Installing OpenCV in %INSTALL_DIR%"
cmake --build . --config Release --target install -- "/m"
if !errorlevel! neq 0 exit /b !errorlevel!


set PATH=%OLDPATH%
popd

exit /b 0

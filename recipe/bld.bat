setlocal EnableDelayedExpansion

cd CGAL

mkdir build && cd build

set CMAKE_CONFIG="Release"
set CMAKE_GENERATOR="NMake Makefiles"

cmake -LAH -G %CMAKE_GENERATOR%               ^
  -DCMAKE_BUILD_TYPE="%CMAKE_CONFIG%"         ^
  -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%"      ^
  -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%"   ^
  -DWITH_CGAL_ImageIO=OFF -DWITH_CGAL_Qt5=OFF ^
  ..
if errorlevel 1 exit 1

nmake .
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1

cd ..\..

"%PYTHON%" -m pip install . -vv

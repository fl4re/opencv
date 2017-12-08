set -e

echo "TODO Mac Build"
exit 1

export MACOSX_DEPLOYMENT_TARGET="10.12"
ITS_APPLE=1

rm -r -f cmake_temp
mkdir cmake_temp
pushd cmake_temp

echo "invoking cmake"
cmake -G Xcode -DCMAKE_OSX_ARCHITECTURES="x86_64" -DCMAKE_INSTALL_PREFIX=. ..\

echo "Making opencv..."
make -r -j8 


popd

echo "Done!"

#!/bin/sh
. ../build_config.sh

rm -rf tmp
mkdir tmp
cd tmp

echo "Building taglib $TAGLIB_VERSION"

curl -SLO http://taglib.github.io/releases/$TAGLIB_VERSION.tar.gz
tar -xf $TAGLIB_VERSION.tar.gz
cd $TAGLIB_VERSION/

cmake \
    -D CMAKE_CXX_FLAGS="-fPIC" \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=OFF \
	. 
make
make install

cd ../..
rm -r tmp


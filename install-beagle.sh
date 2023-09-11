#!/bin/bash

set -e -o pipefail

lscpu
cat /proc/cpuinfo

cd /opt/docker

# beagle 3.1.2, known working with beast 1.10.5pre
git clone --depth=1 --branch="v4.0.0" https://github.com/beagle-dev/beagle-lib.git
cd beagle-lib

mkdir build
cd build

cmake -DBUILD_OPENCL=ON -DBEAGLE_OPTIMIZE_FOR_NATIVE_ARCH=false -DCMAKE_CXX_FLAGS="-march=haswell -mtune=intel" -DCMAKE_INSTALL_PREFIX:PATH=/usr/local ..

make install

ldconfig # LD_LIBRARY_PATH is also set in the Dockerfile to include /usr/local/lib

#examples/tinytest/tinytest
examples/synthetictest/synthetictest

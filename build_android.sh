#!/usr/bin/env bash

##### android armv7
rm -rf build-android-armv7
mkdir -p build-android-armv7
pushd build-android-armv7
cmake -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake -DANDROID_ABI="armeabi-v7a" -DANDROID_ARM_NEON=ON -DANDROID_PLATFORM=android-24 ..
make
make install
popd

adb push build-android-armv7/install/bin/benchncnn /data/local/tmp/yisongsong/ncnn
adb push benchmark/*.param /data/local/tmp/yisongsong/ncnn

adb shell "cd /data/local/tmp/yisongsong/ncnn; ./benchncnn 30 1 0"

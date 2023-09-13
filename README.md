This is C++ project that using libavcodec, libavutil (FFMpeg), build system is cmake.

## Prerequisites
```bash
sudo apt install cmake g++
```

## How build
Tested on Ubuntu 22 x86_64.
```bash
git clone --recurse-submodules -j8 --remote-submodules https://github.com/AndreiCherniaev/Qt_libav_Universe.git
```
Next step is about how [build](https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu#FFmpeg) FFMpeg
```bash
export MyBaseDir=${PWD}/Qt_libav_Universe && cd Qt_libav_Universe
chmod +x FFMpeg_themself/build_FFMpeg.sh
FFMpeg_themself/build_FFMpeg.sh
```
Build steps:
```bash
echo ${MyBaseDir} #check path
cd ${MyBaseDir}
cmake -S myExample/src/ -B myExample/build-host/ --fresh
```
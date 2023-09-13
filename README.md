This is C++ project that using libavcodec, libavutil (FFMpeg), build system is cmake. Tested on Ubuntu 22 x86_64.

## Prerequisites
```bash
sudo apt install cmake g++
```
```bash
git clone --recurse-submodules -j8 --remote-submodules https://github.com/AndreiCherniaev/FFMpeg_MJPEG-transcode-VP9_CXX_Universe.git && cd FFMpeg_MJPEG-transcode-VP9_CXX_Universe
```
## Build FFMpeg
Next step is about how [build](https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu#FFmpeg) FFMpeg
```bash
chmod +x FFMpeg_themself/build_FFMpeg.sh
FFMpeg_themself/build_FFMpeg.sh
```
## Synthesize MJPEG video
input.yuvj422p video I plan use as input to test my C++ example. This step is optional, you can use myExample/input.yuvj422p This step is if you want to synthesize video again.
```bash
FFMpeg_MJPEG-transcode-VP9_CXX_Universe$ FFMpeg_themself/bin/ffmpeg -y -f lavfi -i testsrc=size=1280x720:rate=1:duration=10 -vcodec mjpeg -pix_fmt yuvj422p -f mjpeg myExample/input.yuvj422p
```
If you get error
"FFMpeg_themself/bin/ffmpeg: error while loading shared libraries: libavdevice.so.60: cannot open shared object file: No such file or directory" then be in root of repo and do
```bash
FFMpeg_MJPEG-transcode-VP9_CXX_Universe$ export LD_LIBRARY_PATH="${PWD}/FFMpeg_themself/lib/"
```
And try again Synthesize MJPEG video.

## Build C++ example
```bash
FFMpeg_MJPEG-transcode-VP9_CXX_Universe$ cmake -G Ninja -DCMAKE_BUILD_TYPE:STRING=Debug -S myExample/src/ -B myExample/build-host/ --fresh
FFMpeg_MJPEG-transcode-VP9_CXX_Universe$ ninja -j16 -C myExample/build-host/
FFMpeg_MJPEG-transcode-VP9_CXX_Universe$ myExample/build-host/myExample
```

In case of error check rpath
```bash
chrpath -l myExample/build-host/myExample
```

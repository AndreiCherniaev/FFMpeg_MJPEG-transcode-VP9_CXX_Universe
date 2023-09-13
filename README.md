This is C++ project that using libavcodec, libavutil (FFMpeg), build system is cmake.

## Prerequisites
```bash
sudo apt install cmake g++
```

## How build
Tested on Ubuntu 22 x86_64.
```bash
git clone --recurse-submodules -j8 --remote-submodules https://github.com/AndreiCherniaev/FFMpeg_MJPEG-transcode-VP9_CXX_Universe.git
```
Next step is about how [build](https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu#FFmpeg) FFMpeg
```bash
chmod +x FFMpeg_themself/build_FFMpeg.sh
FFMpeg_themself/build_FFMpeg.sh
```
## Synthesize MJPEG video
This video i plan use as input for testing.
```bash
FFMpeg_themself/bin/ffmpeg -y -f lavfi -i testsrc=size=1280x720:rate=1:duration=10 -vcodec mjpeg -pix_fmt yuvj422p -f mjpeg myExample/input.yuvj422p
```

Build steps:
```bash
echo ${MyBaseDir} #check path
cd ${MyBaseDir}
cmake -S myExample/src/ -B myExample/build-host/ --fresh
```
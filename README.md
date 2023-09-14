This is C project that using libav (FFMpeg), build system is cmake. Tested on Ubuntu 23 server.

## Prerequisites
```bash
sudo apt install cmake gcc git ninja-build pkg-config
sudo apt-get install libvpx-dev
```
```bash
git clone --recurse-submodules -j8 --remote-submodules https://github.com/AndreiCherniaev/FFMpeg_MJPEG-transcode-VP9_C_Universe.git && cd FFMpeg_MJPEG-transcode-VP9_C_Universe
```
## Build FFMpeg
Next step is about how [build](https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu#FFmpeg) FFMpeg
```bash
FFMpeg_MJPEG-transcode-VP9_C_Universe$ FFMpeg_themself/build_FFMpeg.sh
```
## Build C example
Build example
```bash
FFMpeg_MJPEG-transcode-VP9_C_Universe$ cmake -G Ninja -DCMAKE_BUILD_TYPE:STRING=Debug -S myExample/src/ -B myExample/build-host/ --fresh
FFMpeg_MJPEG-transcode-VP9_C_Universe$ ninja -j16 -C myExample/build-host/
```
Before run example we need copy input video to build folder
```bash
FFMpeg_MJPEG-transcode-VP9_C_Universe$ cp myExample/input.yuvj422p myExample/build-host
```
Before start we should be in folder with input.yuvj422p video file. If no then "Cannot open input file Segmentation fault (core dumped)". LD_LIBRARY_PATH should be /home/username/FFMpeg_MJPEG-transcode-VP9_C_Universe/FFMpeg_themself/FFmpeg_build/lib where "username" is current user's name. This is universal code to run example
```bash
FFMpeg_MJPEG-transcode-VP9_C_Universe$ cd myExample/build-host/
FFMpeg_MJPEG-transcode-VP9_C_Universe/myExample/build-host$ LD_LIBRARY_PATH=${PWD}/../../FFMpeg_themself/FFmpeg_build/lib ./myExample
```
## Run without LD_LIBRARY_PATH
If you want run example without LD_LIBRARY_PATH then you should tell the system about new locations of shared libraries.
```bash
FFMpeg_MJPEG-transcode-VP9_C_Universe$ sudo bash -c 'cat <<EOF > /etc/ld.so.conf.d/myFFMpeg.conf
#My path to my FFMpeg build
#see details https://github.com/AndreiCherniaev/FFMpeg_MJPEG-transcode-VP9_C_Universe
${PWD}/FFMpeg_themself/FFmpeg_build/lib
EOF'
sudo ldconfig -v
```
Now we can run example as usual
```bash
./myExample
```
In case of error check rpath
```bash
chrpath -l myExample/build-host/myExample
```

## Synthesize MJPEG video
input.yuvj422p video I plan use as input to test my C++ example. This step is optional, you can use myExample/input.yuvj422p This step is if you want to synthesize video again.
```bash
FFMpeg_MJPEG-transcode-VP9_C_Universe$ FFMpeg_themself/bin/ffmpeg -y -f lavfi -i testsrc=size=1280x720:rate=1:duration=10 -vcodec mjpeg -pix_fmt yuvj422p -f mjpeg myExample/input.yuvj422p
```
If you get error
"FFMpeg_themself/bin/ffmpeg: error while loading shared libraries: libavdevice.so.60: cannot open shared object file: No such file or directory" then be in root of repo and do
```bash
FFMpeg_MJPEG-transcode-VP9_C_Universe$ export LD_LIBRARY_PATH="${PWD}/FFMpeg_themself/lib/"
```
And try again Synthesize MJPEG video.

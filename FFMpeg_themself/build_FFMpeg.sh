#!/bin/bash

# export MyBaseDir=/home/a/Downloads/myGitHub/FFmpeg_fixing/Qt_libav_Universe/
if [ -z "${MyBaseDir}" ]
then
      echo "err \$MyBaseDir is empty"
else
cd "${MyBaseDir}/FFMpeg_themself"
rm -Rf ${MyBaseDir}/FFMpeg_themself/ffmpeg_build ${MyBaseDir}/FFMpeg_themself/bin && mkdir ${MyBaseDir}/FFMpeg_themself/ffmpeg_build ${MyBaseDir}/FFMpeg_themself/bin
git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg
cd "${MyBaseDir}/FFMpeg_themself/ffmpeg_build"
PATH="${MyBaseDir}/FFMpeg_themself/bin:$PATH" PKG_CONFIG_PATH="${MyBaseDir}/FFMpeg_themself/ffmpeg_build/lib/pkgconfig" ${MyBaseDir}/FFMpeg_themself/ffmpeg/configure \
  --prefix="${MyBaseDir}/FFMpeg_themself/ffmpeg_build" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I${MyBaseDir}/FFMpeg_themself/ffmpeg_build/include" \
  --extra-ldflags="-L${MyBaseDir}/FFMpeg_themself/ffmpeg_build/lib" \
  --extra-libs="-lpthread -lm" \
  --ld="g++" \
  --bindir="${MyBaseDir}/FFMpeg_themself/bin" \
  --enable-gpl \
  --enable-libopenh264 \
  --enable-libvpx \
  --enable-shared \
  #--enable-static \
  --disable-ffplay \
  --disable-ffprobe \
  #--disable-ffmpeg \
  #--disable-swresample \
  #--disable-decoders \
  --disable-doc \
  #--disable-encoders \
  --enable-encoder=libopenh264
  --enable-encoder=libvpx-vp9
PATH="${MyBaseDir}/FFMpeg_themself/bin:$PATH" make -j16
make install
fi

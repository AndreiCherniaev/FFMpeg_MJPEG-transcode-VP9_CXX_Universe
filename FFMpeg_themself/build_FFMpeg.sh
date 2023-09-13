#!/bin/bash

#Based on https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu

rm -Rf FFmpeg_build bin && mkdir FFmpeg_build bin
cd "FFmpeg_build"
PATH="../bin:$PATH" PKG_CONFIG_PATH="FFmpeg_build/lib/pkgconfig" ../FFmpeg/configure \
  --prefix="FFmpeg_build" \
  --pkg-config-flags="--static" \
  --extra-cflags="-IFFmpeg_build/include" \
  --extra-ldflags="-LFFmpeg_build/lib" \
  --extra-libs="-lpthread -lm" \
  --ld="g++" \
  --bindir="../bin" \
  --enable-gpl \
  --enable-libopenh264 \
  --enable-libvpx \
  #--enable-shared \
  --enable-static \
  --disable-ffplay \
  --disable-ffprobe \
  #--disable-ffmpeg \
  #--disable-swresample \
  #--disable-decoders \
  --disable-doc \
  #--disable-encoders \
  --enable-encoder=libopenh264
  --enable-encoder=libvpx-vp9
PATH="../bin:$PATH" make -j16
make install

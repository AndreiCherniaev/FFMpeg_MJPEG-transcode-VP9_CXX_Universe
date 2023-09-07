/*
 *  Include ffmpeg files
 */


// if
// error: libavcodec/avcodec.h: No such file or directory
// then
// sudo apt-get install libavcodec-dev
extern "C"
{
#include "libavcodec/avcodec.h"

#include <libavutil/opt.h>
#include <libavutil/imgutils.h>

#include <libavformat/avformat.h>
}

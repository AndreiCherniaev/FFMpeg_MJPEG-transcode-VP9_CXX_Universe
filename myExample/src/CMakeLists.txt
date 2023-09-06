cmake_minimum_required(VERSION 3.26.4) #3.1 also ok

set(CMAKE_BUILD_TYPE Debug)

project(myExample LANGUAGES CXX C)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# With Environment Variables
#cmake_path(SET pkgconfig_path "${CMAKE_CURRENT_LIST_DIR}/../../FFMpeg_themself/ffmpeg_build/lib/pkgconfig/" NORMALIZE)
#set(ENV{PKG_CONFIG_PATH} ${pkgconfig_path})
#message("I found $ENV{PKG_CONFIG_PATH}")

# Without Environment Variables
cmake_path(SET pkgconfig_path "${CMAKE_CURRENT_LIST_DIR}/../../FFMpeg_themself/ffmpeg_build/" NORMALIZE)
set(CMAKE_PREFIX_PATH ${pkgconfig_path})
message("I found ${CMAKE_PREFIX_PATH}")

find_package(PkgConfig REQUIRED)
pkg_check_modules(LIBAV REQUIRED IMPORTED_TARGET
    libavcodec
)

add_executable(${PROJECT_NAME}
    main.cpp
)

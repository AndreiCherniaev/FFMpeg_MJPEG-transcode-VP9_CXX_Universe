cmake_minimum_required(VERSION 3.24)

project(myExample LANGUAGES CXX C)

set(CMAKE_AUTOMOC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Core Concurrent)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core Concurrent)

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
    libavutil
    #libavformat
)

qt_add_executable(${PROJECT_NAME}
    main.cpp
    ffmpegInclude.h
)

target_include_directories( ${PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/../../FFMpeg_themself/ffmpeg_build/include/
)

target_link_libraries(${PROJECT_NAME} PUBLIC Qt::Core Qt::Concurrent PkgConfig::LIBAV)

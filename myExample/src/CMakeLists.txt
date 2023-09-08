cmake_minimum_required(VERSION 3.24)

project(myExample LANGUAGES C)

set(POW_LIBS "")
include(CheckLibraryExists)
check_library_exists(m pow "" LIBM)
if(LIBM)
    list(APPEND POW_LIBS "m")
endif()

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
    libavformat
    libswresample
    libswscale
)

add_executable(${PROJECT_NAME}
    mux.c
)

target_include_directories( ${PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/../../FFMpeg_themself/ffmpeg_build/include/
)

target_link_libraries(${PROJECT_NAME} PUBLIC PkgConfig::LIBAV)
target_link_libraries(${PROJECT_NAME} PUBLIC ${POW_LIBS})

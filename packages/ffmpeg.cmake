ExternalProject_Add(ffmpeg
    DEPENDS
        amf-headers
        bzip2
        lame
        libass
        libpng
        libsoxr
        libwebp
        libzimg
        libmysofa
        opus
        speex
        vorbis
        libxml2
        libvpl
        libjxl
    GIT_REPOSITORY https://github.com/FFmpeg/FFmpeg.git
    SOURCE_DIR ${SOURCE_LOCATION}
    GIT_CLONE_FLAGS "--filter=tree:0"
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${EXEC} <SOURCE_DIR>/configure
        --cross-prefix=${TARGET_ARCH}-
        --prefix=${MINGW_INSTALL_PREFIX}
        --arch=${TARGET_CPU}
        --target-os=mingw32
        --target-exec=wine
        --pkg-config-flags=--static
        --enable-cross-compile
        --enable-runtime-cpudetect
        --enable-postproc
        --enable-libass
        --enable-libfreetype
        --enable-libfribidi
        --enable-libmp3lame
        --enable-libopus
        --enable-libsoxr
        --enable-libspeex
        --enable-libvorbis
        --enable-libwebp
        --enable-libzimg
        --enable-libxml2
        --enable-libmysofa
        --enable-libvpl
        --enable-libjxl
        --enable-amf
        --disable-doc
        --disable-cuda
        --disable-nvdec
        --disable-nvenc
        --disable-cuvid
        --disable-libuavs3d
        --disable-ffnvcodec
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(ffmpeg)
cleanup(ffmpeg install)

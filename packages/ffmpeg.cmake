ExternalProject_Add(ffmpeg
    DEPENDS
        amf-headers
        nvcodec-headers
        bzip2
        gmp
        lame
        libass
        libpng
        libsoxr
        libbs2b
        libwebp
        libzimg
        libmysofa
        fontconfig
        harfbuzz
        opus
        speex
        vorbis
        libxml2
        libvpl
        shaderc
        libplacebo
        libaribcaption
        aom
        rav1e
        dav1d
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
        --enable-version3
        --enable-postproc
        --enable-libass
        --enable-libfreetype
        --enable-libfribidi
        --enable-libfontconfig
        --enable-libharfbuzz
#        --enable-libmodplug
#        --enable-libopenmpt
        --enable-libmp3lame
        --enable-libsoxr
        --enable-libspeex
        --enable-libbs2b
        --enable-libvpx
        --enable-libwebp
        --enable-libaom
        --enable-librav1e
        --enable-libdav1d
        --enable-libwebp
        --enable-libzimg
        --disable-mbedtls
        --enable-libxml2
        --enable-libmysofa
        --disable-libssh
        --disable-libsrt
        --enable-libvpl
        --enable-libplacebo
        --enable-libshaderc
        --enable-libaribcaption
        --enable-cuda
        --enable-cuvid
        --enable-nvdec
        --enable-nvenc
        --enable-amf
        --disable-doc
        --disable-vaapi
        --disable-vdpau
        --disable-videotoolbox
        --disable-ffplay
        --disable-ffprobe

        # Disable muxers, encoders & filters since we are only targeting playback.

        --disable-muxers
        --disable-encoders
        --disable-filters

        # Enable overlay & equalizer audio filters.

        --enable-filter=overlay
        --enable-filter=equalizer

        --disable-decoder=libaom_av1
        "--extra-libs='-lstdc++'" # needs by libjxl and shaderc
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(ffmpeg)
cleanup(ffmpeg install)

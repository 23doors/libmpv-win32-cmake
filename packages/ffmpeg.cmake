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

        --enable-network

        --disable-iconv 
        --disable-bzlib
        --disable-lzma
        --disable-sdl2
        --disable-schannel
        --disable-securetransport
        --disable-xlib
        --disable-muxers
        --disable-demuxers
        --disable-d3d11va
        --disable-nvenc
        --disable-dxva2
        --disable-bsfs
        --disable-filters
        --disable-parsers
        --disable-indevs
        --disable-outdevs
        --disable-encoders
        --disable-decoders
        --disable-bsfs
        --enable-demuxer=image2
        --enable-demuxer=aac
        --enable-demuxer=ac3
        --enable-demuxer=aiff
        --enable-demuxer=ape
        --enable-demuxer=asf
        --enable-demuxer=au
        --enable-demuxer=avi
        --enable-demuxer=flac
        --enable-demuxer=flv
        --enable-demuxer=matroska
        --enable-demuxer=mov
        --enable-demuxer=m4v
        --enable-demuxer=mp3
        --enable-demuxer=mpc*
        --enable-demuxer=ogg
        --enable-demuxer=pcm*
        --enable-demuxer=rm
        --enable-demuxer=shorten
        --enable-demuxer=tak
        --enable-demuxer=tta
        --enable-demuxer=wav
        --enable-demuxer=wv
        --enable-demuxer=xwma
        --enable-demuxer=dsf
        --enable-demuxer=dts
        --enable-demuxer=truehd
        --enable-decoder=aac*
        --enable-decoder=ac3
        --enable-decoder=alac
        --enable-decoder=als
        --enable-decoder=ape
        --enable-decoder=atrac*
        --enable-decoder=eac3
        --enable-decoder=flac
        --enable-decoder=gsm*
        --enable-decoder=mp1*
        --enable-decoder=mp2*
        --enable-decoder=mp3*
        --enable-decoder=mpc*
        --enable-decoder=opus
        --enable-decoder=ra*
        --enable-decoder=ralf
        --enable-decoder=shorten
        --enable-decoder=tak
        --enable-decoder=tta
        --enable-decoder=vorbis
        --enable-decoder=wavpack
        --enable-decoder=wma*
        --enable-decoder=pcm*
        --enable-decoder=dsd*
        --enable-decoder=truehd

        --enable-decoder=mjpeg
        --enable-decoder=ljpeg
        --enable-decoder=jpegls
        --enable-decoder=jpeg2000
        --enable-decoder=png
        --enable-decoder=gif
        --enable-decoder=bmp
        --enable-decoder=tiff
        --enable-decoder=webp
        --enable-decoder=jpegls

        --enable-parser=aac*
        --enable-parser=ac3
        --enable-parser=cook
        --enable-parser=dca
        --enable-parser=flac
        --enable-parser=gsm
        --enable-parser=mpegaudio
        --enable-parser=tak
        --enable-parser=vorbis
        
        --enable-filter=overlay

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

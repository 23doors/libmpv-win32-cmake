set_property(DIRECTORY PROPERTY EP_STEP_TARGETS download)
list(APPEND ep
    xz
    lzo
    uchardet
    zlib
    bzip2
    libjpeg
    lcms2
    lame
    ogg
    vorbis
    opus
    speex
    libmodplug
    libvpx
    libpng
    libiconv
    luajit
    openal-soft
    fribidi
    expat
    nettle
    libarchive
    freetype2
    libudfread
    harfbuzz
    libsoxr
    graphengine
    libzimg
    libunibreak
    libass
    mbedtls
    libxml2
    libvpl
    amf-headers
    libmysofa
    libwebp
    libbs2b
    libssh
    libsdl2
    libsrt
    libopenmpt
    brotli
    highway
    libjxl
    ffmpeg
    mujs
    glad
    libsixel
    curl
    mpv
    mpv-release
    mpv-packaging
    flac
    opusfile
    libopusenc
    opus-tools
    termcap
    readline
    cryptopp
    sqlite
    libuv
    libsodium
    megasdk
)
foreach(package IN LISTS ep)
    if(NOT ${SINGLE_SOURCE_LOCATION} STREQUAL "")
        set(SOURCE_LOCATION "${SINGLE_SOURCE_LOCATION}/${package}")
    endif()
    include(${CMAKE_CURRENT_SOURCE_DIR}/${package}.cmake)
    set(SOURCE_LOCATION "")

    get_property(_git_repository TARGET ${package} PROPERTY _EP_GIT_REPOSITORY)
    if(_git_repository)
        list(APPEND repo ${package})
    endif()
endforeach()
list(LENGTH ep ep_length)
message(STATUS "Parsing ${ep_length} packages")

# Exclude packages which dont depend on mpv when update
list(APPEND removed "flac" "opusfile" "libopusenc" "opus-tools" "termcap" "readline" "cryptopp" "sqlite" "libuv" "libsodium" "megasdk" "libsixel" "curl")
list(REMOVE_ITEM repo ${removed})
list(REMOVE_ITEM ep ${removed})
list(TRANSFORM repo APPEND "-force-update" OUTPUT_VARIABLE update)
list(TRANSFORM ep APPEND "-download" OUTPUT_VARIABLE download)

add_custom_target(update
    COMMAND ${CMAKE_COMMAND} --build ${CMAKE_BINARY_DIR} --target ${update}
    COMMENT "Updating git repo"
)

add_custom_target(download
    COMMAND ${CMAKE_COMMAND} --build ${CMAKE_BINARY_DIR} --target ${download}
)

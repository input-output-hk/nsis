cmake_minimum_required(VERSION 2.6)
project(nsis)

set(CMAKE_CXX_FLAGS "-DMAKENSIS= -D_UNICODE= -DNSIS_CONFIG_CONST_DATA_PATH=")

add_executable(makenssi Source/makenssi.cpp Source/tokens.cpp Source/util.cpp Source/ResourceEditor.cpp Source/winchar.cpp Source/tstring.cpp Source/utf.cpp Source/build.cpp Source/script.cpp Source/growbuf.cpp Source/strlist.cpp Source/lineparse.cpp Source/dirreader.cpp Source/scriptpp.cpp Source/BinInterop.cpp Source/lang.cpp Source/DialogTemplate.cpp Source/manifest.cpp Source/icon.cpp Source/mmap.cpp Source/ShConstants.cpp Source/fileform.cpp Source/writer.cpp Source/Plugins.cpp Source/ResourceVersionInfo.cpp)

install(TARGETS makenssi DESTINATION bin)
include_directories(. Source nix)

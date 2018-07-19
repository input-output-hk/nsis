{ stdenv, compression }:

let
  extra_files = {
    zlib = [ "../zlib/INFBLOCK.c" ];
  };
in stdenv.mkDerivation {
  name = "${compression}-stub";
  src = ./.;
  buildCommand = ''
    unpackPhase
    cd $sourceRoot
    cd Source/exehead
    mkdir -p $out/bin/
    $WINDRES resource.rc -I../../nix -o resource.o
    $CC -DUNICODE= -D_UNICODE= -DNSIS_COMPRESS_USE_ZLIB= -DWIN32_LEAN_AND_MEAN= -fno-stack-protector -g -gdwarf-2 -D_NSIS_NODEFLIB_CRTMEMCPY= -DZEXPORT=__stdcall -DNSISCALL= -DEXEHEAD= -I../../nix bgbg.c components.c exec.c fileform.c Main.c plugin.c Ui.c util.c ../crc32.c ${toString extra_files.${compression}} resource.o -lole32 -lcomctl32 -lcomdlg32 -luuid -o $out/bin/${compression}-stub.exe -Wl,-eNSISWinMainNOCRT
  '';
}

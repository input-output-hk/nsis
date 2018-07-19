{ stdenv, cmake, zlib-stub }:

stdenv.mkDerivation {
  name = "nsis";
  src = ./.;
  buildInputs = [ cmake ];
  enableParallelBuilding = true;
  NIX_CFLAGS_COMPILE = [
    "-DPREFIX_DATA=\"${builtins.placeholder "out"}\""
    "-DPREFIX_CONF=\"${builtins.placeholder "out"}/etc/\""
  ];
  postInstall = ''
    mkdir -pv $out/Stubs
    cp -vi ../Source/exehead/uninst.ico $out/Stubs/uninst
    cp -vi ${zlib-stub}/bin/zlib-stub.exe $out/Stubs/zlib-x86-ansi
    cp -vi ${zlib-stub}/bin/zlib-stub.exe $out/Stubs/zlib-x86-unicode
    cp -vir ../Include ../Contrib $out/
  '';
}

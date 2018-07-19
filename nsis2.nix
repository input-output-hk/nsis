{ stdenv, scons }:

stdenv.mkDerivation {
  name = "nsis";
  src = ./.;
  buildInputs = [ scons ];
  buildPhase = ''
    scons PREFIX=$out PATH=$PATH CC=$CC CXX=$CXX
  '';
}

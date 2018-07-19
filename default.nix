with import <nixpkgs> {};

let
  crossPkgs = import <nixpkgs> { crossSystem = (import <nixpkgs/lib>).systems.examples.mingw32; };
  packages = self: {
    nsis = self.callPackage ./nsis.nix {};
    zlib-stub = crossPkgs.callPackage ./stub.nix { compression = "zlib"; };
    demo = pkgs.runCommand "demo" { buildInputs = [ self.nsis ]; } ''
      mkdir $out
      cd $out
      cp -vi ${./Examples/example1.nsi} example1.nsi
      makenssi example1.nsi
      ln -sv ${self.nsis} nsis
    '';
    nsis2 = self.callPackage ./nsis2.nix {};
  };
in pkgs.lib.makeScope pkgs.newScope packages

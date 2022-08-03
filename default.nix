{
  pkgs ? import (builtins.fetchTarball {
    name = "nixpkgs-e43cf1748462c81202a32b26294e9f8eefcc3462";
    url = "https://github.com/nixos/nixpkgs/archive/e43cf1748462c81202a32b26294e9f8eefcc3462.tar.gz";
    sha256 = "13xvjdbgjgwd5j7ylyy2f590v0s9ha3zj94kl5x1fwasi0dz3ybq";
  }) {}
}:

pkgs.stdenv.mkDerivation {
  pname = "nethack4";
  version = "16ba325";

  src = pkgs.fetchFromGitHub {
    owner = "tsadok";
    repo = "nethack4";
    rev = "16ba32578f2a614b240ce849923f9053b198946d";
    sha256 = "Ba0vsXup8kZ4LwUHCPtjU+LU1rAFKbkf9ltXvwFBxRA=";
  };

  buildInputs = [
    pkgs.zlib
    pkgs.flex
    pkgs.bison
  ];

  buildPhase = ''
    make BINDIR=$out
  '';

  installPhase = ''
    make install BINDIR=$out
    mkdir $out/bin
    ln -s $out/nethack4 $out/bin/nethack4
  '';
}

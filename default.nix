{
  pkgs ? import <nixpkgs> {}
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

{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
    buildInputs = [ pkgs.haskell-language-server pkgs.haskell.compiler.ghc943 ]; #pkgs.glibc.static pkgs.zlib.static pkgs.gmp ];
}

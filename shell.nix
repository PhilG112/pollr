{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
    buildInputs = [ pkgs.haskell-language-server pkgs.haskell.compiler.ghc902 pkgs.zlib ]; #pkgs.glibc.static pkgs.zlib.static pkgs.gmp ];
}

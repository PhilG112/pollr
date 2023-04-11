{ compiler ? "ghc902" }:

let
    config = {
        packageOverrides = pkgs: rec {
            hls = pkgs.haskell-language-server.override {
                supportedGhcVersions = ["902" ];
            };
            haskell = pkgs.haskell // {
                packages = pkgs.haskell.packages // {
                    "${compiler}" = pkgs.haskell.packages."${compiler}".override {
                        overrides = haskellPackagesNew: haskellPackagesOld: rec {
                            pollr = haskellPackagesNew.callPackage ./pollr.nix {};    
                        };
                    };
                };
            };
        };
    };
    pkgs = import <nixpkgs> { inherit config; };
in
    {
        pollr = pkgs.haskell.packages.${compiler}.pollr;
    }

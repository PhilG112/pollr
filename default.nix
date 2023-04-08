{ compiler ? "ghc943" }:

let
    config = {
        packageOverrides = pkgs: rec {
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
    { pollr = pkgs.haskell.packages.${compiler}.pollr;
    }

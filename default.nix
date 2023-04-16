/* { compiler ? "ghc902" }: */

/* let */
/*     config = { */
/*         packageOverrides = pkgs: rec { */
/*             hls = pkgs.haskell-language-server.override { */
/*                 supportedGhcVersions = ["902" ]; */
/*             }; */
/*             haskell = pkgs.haskell // { */
/*                 packages = pkgs.haskell.packages // { */
/*                     "${compiler}" = pkgs.haskell.packages."${compiler}".override { */
/*                         overrides = haskellPackagesNew: haskellPackagesOld: rec { */
/*                             pollr = haskellPackagesNew.callPackage ./pollr.nix {}; */    
/*                         }; */
/*                     }; */
/*                 }; */
/*             }; */
/*         }; */
/*     }; */
/*     pkgs = import <nixpkgs> { inherit config; }; */
/* in */
/*     { */
/*         pollr = pkgs.haskell.packages.${compiler}.pollr; */
/*     } */

/* let */
/*     pkgs = import <nixpkgs> {}; */
/* in */
/*     { pollr = pkgs.haskellPackages.callPackage ./pollr.nix {}; */
/*     } */

let
    bootstrap = import <nixpkgs> {};

    nixpkgs = builtins.fromJSON (builtins.readFile ./nixpkgs.json);

    src = bootstrap.fetchFromGitHub {
        owner = "NixOS";
        repo = "nixpkgs";
        inherit (nixpkgs) rev sha256;
    };

    pkgs = import src {};
in
    pkgs.haskellPackages.callPackage ./pollr.nix {}


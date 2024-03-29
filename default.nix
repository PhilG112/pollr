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

# { compiler ? "ghc928" }:

# let
#   config = {
#     packageOverrides = pkgs: rec {
#       haskell = pkgs.haskell // {
#         packages = pkgs.haskell.packages // {
#           "${compiler}" = pkgs.haskell.packages."${compiler}".override {
#             overrides = haskellPackagesNew: haskellPackagesOld: rec {
#               pollr =
#                 haskellPackagesNew.callPackage ./pollr.nix { };
#             };
#           };
#         };
#       };
#     };
#   };
let 
    pkgs = import <nixpkgs> { };
in
   { pollr = pkgs.haskellPackages.callPackage ./pollr.nix {};
   }


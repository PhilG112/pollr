/* let */
/*     pkgs = import <nixpkgs> {}; */
/* in */
/*     pkgs.mkShell { */
/*         buildInputs = [ pkgs.haskell-language-server pkgs.haskell.compiler.ghc92 ]; */ 
/*     } */ 

/* { pkgs ? import <nixpkgs> {} }: */
/* pkgs.mkShell { */
/*     buildInputs = [ pkgs.haskell-language-server pkgs.haskell.compiler.ghc902 pkgs.zlib ]; #pkgs.glibc.static pkgs.zlib.static pkgs.gmp ]; */
/* } */

/* with import <nixpkgs> {}; */

/* let */
/*     pkgs = import <nixpkgs> {}; */
/*     project = ./pollr.nix; */
/* in */
/*     pkgs.mkShell { */
/*         buildInputs = [ */
/*             (pkgs.haskell.compiler.ghc902) */
/*             (pkgs.haskellPackages.callPackage project {}) */
/*             (pkgs.haskell-language-server) */
/*         ]; */
/*    } */

/* with import <nixpkgs> {}; */

/* let */
/*   pkgs = import <nixpkgs> {}; */
/*   project = ./pollr.nix; */
/* in */
/*   pkgs.haskellPackages.shellFor { */
/*     # Specify the GHC version here */
/*     ghc = pkgs.haskell.compiler.ghc902; */
/*     packages = p: with p; [ */
/*       # Add any additional dependencies your project requires */
/*       (pkgs.haskellPackages.callPackage project {}) */
/*       pkgs.haskell-language-server */
/*     ]; */
/*   } */


/* with import <nixpkgs> {}; */

/* let */
/*   project = ./default.nix; */
/*   pkgs = import <nixpkgs> {}; */
/* in */
/*   ghc.withPackages (ps: with ps; [ */
/*     # Specify the GHC version here */
/*     (pkgs.haskell.compiler.ghc902.override { */
/*       override = self: super: { */
/*         # Add any additional dependencies your project requires */
/*         haskell-language-server = pkgs.haskell-language-server; */
/*       }; */
/*     }) */
/*     (pkgs.haskellPackages.callPackage project {}) */
/*   ]) */
/*   (haskellPackages.buildCabalProject { */
/*     # Specify the path to your Haskell project */
/*     pname = "pollr"; */
/*     path = project; */
/*   }) */

{pkgs ? import <nixpkgs> {} }:

pkgs.haskellPackages.shellFor {
    packages = hpkgs: [
        (hpkgs.callPackage ./pollr.nix { })
    ];

    nativeBuildInputs = [
        pkgs.haskell-language-server
        pkgs.haskell.compiler.ghc92
        pkgs.libffi
    ];
}


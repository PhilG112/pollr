{ mkDerivation, base, lib }:
mkDerivation {
  pname = "pollr";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base ];
  license = lib.licenses.mit;
  mainProgram = "pollr";
}

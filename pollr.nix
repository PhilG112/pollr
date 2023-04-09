{ mkDerivation, aeson, base, containers, lib, mtl, servant
, servant-server, text, time, warp
}:
mkDerivation {
  pname = "pollr";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    aeson base containers mtl servant servant-server text time warp
  ];
  license = "unknown";
  mainProgram = "pollr";
}

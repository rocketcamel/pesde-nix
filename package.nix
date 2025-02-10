{
  lib,
  stdenv,
  fetchurl,
  pkgs,
}:

stdenv.mkDerivation rec {
  pname = "pesde";
  version = "v0.6.0-rc.4+registry.0.2.0-rc.1";

  nativeBuildInputs = with pkgs; [
    unzip
  ];

  src = fetchurl {
    url = "https://github.com/pesde-pkg/pesde/releases/download/${version}/pesde-0.6.0-rc.4-linux-x86_64.zip";
    sha256 = "sha256-5jUIQzP/nq9r3syZ/d8ZO8mrTLdUyRXspTpBZYLAzdk=";
  };

  unpackPhase = "unzip $src";

  installPhase = ''
    mkdir -p $out/bin
    cp pesde $out/bin
  '';
}

{
  lib,
  stdenv,
  fetchurl,
  pkgs,
}:

let
  rversion = "0.6.0-rc.5";
  registryVersion = "registry.0.2.0-rc.2";
in
stdenv.mkDerivation rec {
  pname = "pesde";
  version = "v${rversion}+${registryVersion}";

  nativeBuildInputs = with pkgs; [
    unzip
  ];

  src = fetchurl {
    url = "https://github.com/pesde-pkg/pesde/releases/download/${version}/${pname}-${rversion}-linux-x86_64.zip";
    sha256 = "sha256-aAPUoZLyvPLmng8GfSfXbMmZdlJPjkqNXbFZWwtGvhU=";
  };

  unpackPhase = "unzip $src";

  installPhase = ''
    mkdir -p $out/bin
    cp pesde $out/bin
  '';
}

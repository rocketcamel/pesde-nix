{
  lib,
  stdenv,
  fetchurl,
  pkgs,
}:

let
  rversion = "0.6.2";
  registryVersion = "registry.0.2.2";
in
stdenv.mkDerivation rec {
  pname = "pesde";
  version = "v${rversion}+${registryVersion}";

  nativeBuildInputs = with pkgs; [
    unzip
  ];

  src = fetchurl {
    url = "https://github.com/pesde-pkg/pesde/releases/download/${version}/${pname}-${rversion}-linux-x86_64.zip";
    sha256 = "sha256-zZeEsdwVr77F25vbT/giBfMGYSDb0PhPkkBH2RDyNVw=";
  };

  unpackPhase = "unzip $src";

  installPhase = ''
    mkdir -p $out/bin
    cp pesde $out/bin
  '';
}

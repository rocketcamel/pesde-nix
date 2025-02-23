{
  lib,
  stdenv,
  fetchurl,
  pkgs,
}:

let
  rversion = "0.6.0";
  registryVersion = "registry.0.2.0";
in
stdenv.mkDerivation rec {
  pname = "pesde";
  version = "v${rversion}+${registryVersion}";

  nativeBuildInputs = with pkgs; [
    unzip
  ];

  src = fetchurl {
    url = "https://github.com/pesde-pkg/pesde/releases/download/${version}/${pname}-${rversion}-linux-x86_64.zip";
    sha256 = "sha256-Ee8lzkiVCM8FhEoREw/XXEgiNE+iBiAiXjpgDn2LVoc=";
  };

  unpackPhase = "unzip $src";

  installPhase = ''
    mkdir -p $out/bin
    cp pesde $out/bin
  '';
}

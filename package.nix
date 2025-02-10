{
  lib,
  stdenv,
  fetchurl,
  pkgs,
}:

let
  rversion = "0.5.2";
in
stdenv.mkDerivation rec {
  pname = "pesde";
  version = "v0.5.2+registry.0.1.1";

  nativeBuildInputs = with pkgs; [
    unzip
  ];

  src = fetchurl {
    url = "https://github.com/pesde-pkg/pesde/releases/download/${version}/${pname}-${rversion}-linux-x86_64.zip";
    sha256 = "sha256-yF70QLsuLSqXyLP0FAzs2NV+EFO3m6UHovPHDV514XM=";
  };

  unpackPhase = "unzip $src";

  installPhase = ''
    mkdir -p $out/bin
    cp pesde $out/bin
  '';
}

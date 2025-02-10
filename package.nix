{
  lib,
  stdenv,
  fetchurl,
  pkgs,
}:

let
  rversion = "0.5.3";
in
stdenv.mkDerivation rec {
  pname = "pesde";
  version = "v0.5.3+registry.0.1.2";

  nativeBuildInputs = with pkgs; [
    unzip
  ];

  src = fetchurl {
    url = "https://github.com/pesde-pkg/pesde/releases/download/${version}/${pname}-${rversion}-linux-x86_64.zip";
    sha256 = "sha256-6L6ZVAE9yX5ISUAcKCUqJ3K7akhKOXgM3yaVLlw/pI8=";
  };

  unpackPhase = "unzip $src";

  installPhase = ''
    mkdir -p $out/bin
    cp pesde $out/bin
  '';
}

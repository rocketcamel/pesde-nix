{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:

rustPlatform.buildRustPackage rec {
  pname = "pesde";
  version = "0.5";

  src = fetchFromGitHub {
    owner = "pesde-pkg";
    repo = pname;
    rev = version;
    hash = "sha256-cBExxfSZJEBPax9JTdoM+m9thP+PUVaNYJQg4qFdh50=";
  };
  buildFeatures = [ "bin" ];
  useFetchCargoVendor = true;

  cargoHash = "sha256-LeuxOSAZo49i7X3P4TVEHBobQHjubwmyuyAIMNf9j0M=";
}

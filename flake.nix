{
  description = "Pesde flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      binary = pkgs.callPackage ./package.nix { };
    in
    {
      packages.${system}.default = pkgs.buildFHSEnv {
        name = "pesde";
        targetPkgs =
          pkgs: with pkgs; [
            zlib
            openssl
            binary
            dbus
          ];
        runScript = "pesde";
      };
    };
}

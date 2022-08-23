{
  description = "A 2D platform game featuring Tux the penguin";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in rec {
        packages = {
          default = hello;

          hello = pkgs.stdenv.mkDerivation {
            name = "hello";
            src = ./.;

            cmakeFlags = [
              "-DPICO_SDK=${pkgs.pico-sdk}/lib/pico-sdk"
            ];

            nativeBuildInputs = [
              pkgs.cmake
              pkgs.gcc-arm-embedded
            ];

            buildInputs = [
              pkgs.pico-sdk
            ];
          };
      };
    };
}


{
  description = "A 2D platform game featuring Tux the penguin";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    flake-utils.url = "github:numtide/flake-utils";

    pico-sdk_flake.url = "github:grumnix/pico-sdk";
  };

  outputs = { self, nixpkgs, flake-utils, pico-sdk_flake }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        pico-sdk = pico-sdk_flake.packages.${system}.default;
      in {
        packages = rec {
          default = blink;

          # blink = pkgs.pkgsCross.arm-embedded.stdenv.mkDerivation {
          blink = pkgs.stdenv.mkDerivation {
            name = "blink";
            src = ./.;

            PICO_SDK_PATH="${pico-sdk}/lib/pico-sdk";

            cmakeFlags = [
              "-DPICO_SDK_PATH=${pico-sdk}/lib/pico-sdk"
              "-DCMAKE_C_COMPILER=${pkgs.gcc-arm-embedded}/bin/arm-none-eabi-gcc"
              "-DCMAKE_CXX_COMPILER=${pkgs.gcc-arm-embedded}/bin/arm-none-eabi-g++"
            ];

            nativeBuildInputs = with pkgs; [
              cmake
              gcc-arm-embedded
              python3
            ];
          };
        };
      }
    );
}


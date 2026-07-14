{
  description = "Crab potion — a second toolchain, fully isolated from the first";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      # `nix develop` / direnv — bashInteractive so `-c bash` gets a real
      # bash (the stdenv build bash lacks progcomp and chokes on bashrc)
      devShells.${system}.default = pkgs.mkShell {
        packages = [ pkgs.rustc pkgs.cargo pkgs.bashInteractive ];
      };
    };
}

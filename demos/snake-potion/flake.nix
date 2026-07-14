{
  description = "Snake potion — a small runnable flake with a Python dev shell";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      # `nix run .` / `nix build .`
      packages.${system}.default = pkgs.writeShellApplication {
        name = "drink-me";
        runtimeInputs = [ pkgs.cowsay ];
        text = ''
          cowsay "curiouser and curiouser!"
        '';
      };

      # `nix develop` / direnv — bashInteractive so `-c bash` gets a real
      # bash (the stdenv build bash lacks progcomp and chokes on bashrc)
      devShells.${system}.default = pkgs.mkShell {
        packages = [ pkgs.python3 pkgs.git pkgs.cowsay pkgs.bashInteractive ];
      };
    };
}

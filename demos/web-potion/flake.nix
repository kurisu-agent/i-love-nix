{
  description = "Web potion — the repo's dev environment, declared (slide: why people love it)";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let pkgs = import nixpkgs { system = "x86_64-linux"; };
    in {
      # bashInteractive so `nix develop -c bash` gets a real bash — plain
      # interactive `nix develop` loses the devShell PATH in this container
      devShells.x86_64-linux.default = pkgs.mkShell {
        packages = [ pkgs.nodejs_24 pkgs.pnpm pkgs.postgresql_17 pkgs.bashInteractive ];
      };
    };
}

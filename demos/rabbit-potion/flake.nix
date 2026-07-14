{
  description = "Rabbit potion — the shell itself dresses for Wonderland";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      # Even the prompt is declared in the flake: the rabbit hops to a new
      # spot before every prompt. Enter with `nix develop -c bash --norc`
      # so the PS1 below survives (rc files and direnv both overwrite/strip PS1).
      devShells.${system}.default = pkgs.mkShell {
        packages = [ pkgs.cowsay pkgs.bashInteractive ];
        shellHook = ''
          echo '🐇 "Oh dear! Oh dear! I shall be too late!"'
          export PS1='$(printf "%*s" $(($(date +%s%N) % 13)) "")🐇 '
          export POTION_PROMPT="$PS1"
        '';
      };
    };
}

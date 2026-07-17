{
  description = "nix-pres-draft — Slidev deck dev shell + ephemeral NixOS demo VM";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixos-generators,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      # `nix develop` — the node toolchain to run the deck, replacing the
      # .devcontainer. npm still manages the JS deps (package-lock.json);
      # nix just pins node.
      devShells.${system}.default = pkgs.mkShell {
        packages = [ pkgs.nodejs_22 ];
        shellHook = ''
          echo "nix-pres-draft dev shell — node $(node --version)"
          echo "  npm install && npm run dev -- --port 3000 --remote"
        '';
      };

      # `nix build .#vm` — minimal BIOS qcow2 for the ephemeral demo box.
      # Boots rootless under plain qemu (no OVMF/UEFI). Output: result/nixos.qcow2
      packages.${system}.vm = nixos-generators.nixosGenerate {
        inherit system;
        format = "qcow";
        modules = [ ./nix/vm.nix ];
      };
    };
}

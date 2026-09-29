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
      linuxSystems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      # devShell is plain node + npm — no Linux-only bits — so it also runs
      # natively on Mac (Slidev dev, outside the demo VM).
      devShellSystems = linuxSystems ++ [
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forSystems = systems: f: nixpkgs.lib.genAttrs systems f;
    in
    {
      # `nix develop` — the node toolchain to run the deck, replacing the
      # .devcontainer. npm still manages the JS deps (package-lock.json);
      # nix just pins node.
      devShells = forSystems devShellSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default = pkgs.mkShell {
            packages = [ pkgs.nodejs_22 ];
            shellHook = ''
              echo "nix-pres-draft dev shell — node $(node --version)"
              echo "  npm install && npm run dev -- --port 3000 --remote"
            '';
          };
        }
      );

      # `nix build .#vm --impure` — minimal BIOS qcow2 for the ephemeral demo
      # box (impure: vm.nix pulls the SSH pubkey from $DEMO_VM_SSH_PUBKEY; see
      # demos/run-vm.sh). Boots rootless under plain qemu (no OVMF/UEFI).
      # Output: result/nixos.qcow2
      #
      # Linux-only: nixos-generators builds a NixOS image, which needs a
      # Linux system — there's no Darwin equivalent.
      packages = forSystems linuxSystems (system: {
        vm = nixos-generators.nixosGenerate {
          inherit system;
          format = "qcow";
          modules = [ ./demos/vm.nix ];
        };
      });
    };
}

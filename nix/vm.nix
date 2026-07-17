# Bare-minimum NixOS guest for running the deck as a live demo box.
# Ephemeral: rebuilt from this flake, booted rootless under QEMU with
# usermode networking. Independent of any host /etc/nixos config.
{ lib, pkgs, ... }:
{
  networking.hostName = "nix-pres";

  # Usermode (SLiRP) net: DHCP hands the guest 10.0.2.15, NAT to the host
  # for internet (npm / nix fetches). The host reaches services via qemu
  # hostfwd, so nothing needs to bind to a routable address.
  networking.useDHCP = lib.mkDefault true;

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };

  # Slidev dev server ports, reached from the host via qemu hostfwd. Without
  # this the default-DROP firewall silently swallows forwarded connections
  # (guest-local curl still works — loopback bypasses the filter).
  networking.firewall.allowedTCPPorts = [
    3000
    3030
  ];

  users.users.demo = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    # Console fallback; SSH is pubkey-only.
    initialPassword = "demo";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 REDACTED"
    ];
  };
  security.sudo.wheelNeedsPassword = false;

  # Autologin on the serial console (handy via `qemu ... -nographic`).
  services.getty.autologinUser = "demo";

  # Flakes on, so the deck's own devShell works inside the guest.
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.trusted-users = [ "demo" ];

  # Just enough to clone the repo and drive nix; node comes from the deck's
  # devShell (the whole point of replacing the devcontainer).
  environment.systemPackages = with pkgs; [
    git
    curl
    zellij
    bat
    ghostty.terminfo
  ];

  documentation.enable = false;

  system.stateVersion = "25.11";
}

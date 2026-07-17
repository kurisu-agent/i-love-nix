#!/usr/bin/env bash
# Manage the ephemeral nix-pres demo VM: a minimal NixOS qcow (built from
# this repo's flake, `.#vm`) booted rootless under QEMU with usermode
# networking. Host reaches the guest via port forwards:
#   ssh  -> localhost:2222   (neo, pubkey)
#   deck -> localhost:3000   (slidev --port 3000 --remote)
#
# Everything lives under $RUNDIR (default ~/.local/state/nix-pres-vm) and is
# throwaway: `run-vm.sh destroy` removes it entirely.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
RUNDIR="${NIX_PRES_VM_RUNDIR:-$HOME/.local/state/nix-pres-vm}"
IMG="$RUNDIR/disk.qcow2"
PIDFILE="$RUNDIR/qemu.pid"

build_fresh() {
  mkdir -p "$RUNDIR"
  echo "Building $REPO#vm ..."
  nix build "$REPO#vm" --out-link "$RUNDIR/result"
  install -m600 "$RUNDIR/result/nixos.qcow2" "$IMG"
  qemu-img resize "$IMG" +10G
}

running() { [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; }

boot() {
  [ -f "$IMG" ] || build_fresh
  if running; then echo "already running (pid $(cat "$PIDFILE"))"; return 0; fi
  qemu-system-x86_64 \
    -enable-kvm -m 4096 -smp 4 -cpu host \
    -drive file="$IMG",if=virtio,format=qcow2 \
    -netdev user,id=n0,hostfwd=tcp:127.0.0.1:2222-:22,hostfwd=tcp:127.0.0.1:3000-:3000 \
    -device virtio-net-pci,netdev=n0 \
    -display none -serial "file:$RUNDIR/serial.log" \
    -pidfile "$PIDFILE" -daemonize
  echo "nix-pres VM booting."
  echo "  ssh : ssh -p 2222 demo@localhost   (or: $0 ssh)"
  echo "  deck: http://localhost:3000"
}

case "${1:-up}" in
  up)      boot ;;
  fresh)   "$0" down || true; rm -f "$IMG"; build_fresh; boot ;;
  down)    if running; then kill "$(cat "$PIDFILE")" && echo "stopped"; else echo "not running"; fi; rm -f "$PIDFILE" ;;
  destroy) "$0" down || true; rm -rf "$RUNDIR"; echo "destroyed $RUNDIR" ;;
  ssh)     shift; exec ssh -p 2222 \
             -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o LogLevel=ERROR \
             demo@localhost "$@" ;;
  *) echo "usage: $0 {up|fresh|down|destroy|ssh}" >&2; exit 1 ;;
esac

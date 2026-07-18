#!/usr/bin/env bash
# Manage the nix-pres demo VM as a libvirt *system* domain — it shows up
# in virt-manager next to the other VMs. Needs libvirtd-group membership,
# no root. The guest keeps qemu user-mode networking (via qemu:commandline
# passthrough) so the host port forwards stay put:
#   ssh  -> localhost:2222   (demo, pubkey)
#   deck -> localhost:3000   (./start-slidev.sh)
# The image is built from this repo's flake (`nix build .#vm`) and lives
# in the libvirt default pool.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VIRSH=(virsh -c qemu:///system)
POOL=default
VOL=nix-pres.qcow2
IMG="/var/lib/libvirt/images/$VOL"

domain_xml() {
  cat <<XML
<domain type='kvm' xmlns:qemu='http://libvirt.org/schemas/domain/qemu/1.0'>
  <name>nix-pres</name>
  <memory unit='MiB'>4096</memory>
  <vcpu placement='static'>4</vcpu>
  <os><type arch='x86_64'>hvm</type><boot dev='hd'/></os>
  <features><acpi/><apic/></features>
  <cpu mode='host-passthrough' check='none'/>
  <devices>
    <disk type='file' device='disk'>
      <driver name='qemu' type='qcow2'/>
      <source file='$IMG'/>
      <target dev='vda' bus='virtio'/>
    </disk>
    <serial type='pty'><target port='0'/></serial>
    <console type='pty'><target type='serial' port='0'/></console>
    <input type='tablet' bus='usb'/>
    <graphics type='spice' autoport='yes'/>
    <video><model type='virtio' heads='1' primary='yes'/></video>
    <memballoon model='virtio'/>
  </devices>
  <qemu:commandline>
    <qemu:arg value='-netdev'/>
    <qemu:arg value='user,id=n0,hostfwd=tcp:127.0.0.1:2222-:22,hostfwd=tcp:127.0.0.1:3000-:3000'/>
    <qemu:arg value='-device'/>
    <qemu:arg value='virtio-net-pci,netdev=n0,addr=0x0a'/>
  </qemu:commandline>
</domain>
XML
}

have_vol() { "${VIRSH[@]}" vol-info --pool "$POOL" "$VOL" >/dev/null 2>&1; }
defined() { "${VIRSH[@]}" dominfo nix-pres >/dev/null 2>&1; }
running() { "${VIRSH[@]}" domstate nix-pres 2>/dev/null | grep -qx running; }

build_upload() {
  # The guest's authorized SSH key stays out of the repo: vm.nix reads
  # DEMO_VM_SSH_PUBKEY at eval time (hence --impure), loaded here from
  # the gitignored .env.local.
  if [ -z "${DEMO_VM_SSH_PUBKEY:-}" ] && [ -f "$REPO/.env.local" ]; then
    DEMO_VM_SSH_PUBKEY=$(sed -n 's/^DEMO_VM_SSH_PUBKEY=//p' "$REPO/.env.local" | tail -1)
    DEMO_VM_SSH_PUBKEY=${DEMO_VM_SSH_PUBKEY#\"}
    DEMO_VM_SSH_PUBKEY=${DEMO_VM_SSH_PUBKEY%\"}
  fi
  if [ -z "${DEMO_VM_SSH_PUBKEY:-}" ]; then
    echo "DEMO_VM_SSH_PUBKEY is not set — add it to $REPO/.env.local, e.g." >&2
    echo '  DEMO_VM_SSH_PUBKEY="ssh-ed25519 AAAA... me@host"' >&2
    exit 1
  fi
  export DEMO_VM_SSH_PUBKEY
  echo "Building $REPO#vm ..."
  local out
  out=$(nix build "$REPO#vm" --no-link --print-out-paths --impure)
  local src="$out/nixos.qcow2" size
  size=$(qemu-img info --output=json "$src" | sed -n 's/.*"virtual-size": *\([0-9]*\).*/\1/p' | head -1)
  "${VIRSH[@]}" vol-delete --pool "$POOL" "$VOL" >/dev/null 2>&1 || true
  "${VIRSH[@]}" vol-create-as "$POOL" "$VOL" "$size" --format qcow2 >/dev/null
  echo "Uploading image into the $POOL pool ..."
  "${VIRSH[@]}" vol-upload --pool "$POOL" "$VOL" "$src"
  "${VIRSH[@]}" vol-resize --pool "$POOL" "$VOL" 24G
  "${VIRSH[@]}" pool-refresh "$POOL" >/dev/null
}

boot() {
  have_vol || build_upload
  defined || domain_xml | "${VIRSH[@]}" define /dev/stdin
  if running; then echo "already running"; else "${VIRSH[@]}" start nix-pres; fi
  echo "nix-pres VM booting (visible in virt-manager)."
  echo "  ssh : ssh -p 2222 demo@localhost   (or: $0 ssh)"
  echo "  deck: http://localhost:3000"
}

case "${1:-up}" in
  up)      boot ;;
  fresh)   running && "${VIRSH[@]}" destroy nix-pres || true
           defined && "${VIRSH[@]}" undefine nix-pres || true
           build_upload; boot ;;
  down)    running && "${VIRSH[@]}" shutdown nix-pres || echo "not running" ;;
  destroy) running && "${VIRSH[@]}" destroy nix-pres || true
           defined && "${VIRSH[@]}" undefine nix-pres || true
           "${VIRSH[@]}" vol-delete --pool "$POOL" "$VOL" >/dev/null 2>&1 || true
           echo "destroyed domain + image" ;;
  ssh)     shift; exec ssh -p 2222 \
             -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o LogLevel=ERROR \
             demo@localhost "$@" ;;
  *) echo "usage: $0 {up|fresh|down|destroy|ssh}" >&2; exit 1 ;;
esac

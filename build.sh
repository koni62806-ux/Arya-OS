#!/bin/bash
set -e
cd "$(dirname "$0")"
lb clean --purge || true
lb config \
  --distribution bookworm \
  --architectures amd64 \
  --linux-flavours amd64 \
  --archive-areas "main contrib non-free non-free-firmware" \
  --binary-images iso-hybrid \
  --bootloaders "syslinux,grub-efi" \
  --debian-installer none \
  --apt-recommends false \
  --memtest none \
  --iso-application "Arya OS" \
  --iso-publisher "Arya OS" \
  --iso-volume "ARYA_OS" \
  --bootappend-live "boot=live components quiet splash username=arya hostname=aryaos locales=en_US.UTF-8 keyboard-layouts=us timezone=Asia/Tehran"
lb build
mv -f live-image-amd64.hybrid.iso arya-os.iso
ls -lh arya-os.iso

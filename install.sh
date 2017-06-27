#!/bin/bash

echo "Installing Qemu"
apt-get install -y qemu-system-arm qemu-system-mips qemu-system-mipsel

echo "Downloading & setting ARMLE Debian Wheezy"
mkdir armle
wget https://people.debian.org/~aurel32/qemu/armel/debian_wheezy_armel_standard.qcow2 -O armle/debian_wheezy_armel_standard.qcow2
wget https://people.debian.org/~aurel32/qemu/armel/initrd.img-3.2.0-4-versatile -O armle/initrd.img-3.2.0-4-versatile
wget https://people.debian.org/~aurel32/qemu/armel/vmlinuz-3.2.0-4-versatile -O armle/vmlinuz-3.2.0-4-versatile

echo "Downloading & setting MIPSBE Debian Wheezy"
mkdir mipsbe
wget https://people.debian.org/~aurel32/qemu/mips/debian_wheezy_mips_standard.qcow2 -O mipsbe/debian_wheezy_mips_standard.qcow2
wget https://people.debian.org/~aurel32/qemu/mips/vmlinux-3.2.0-4-4kc-malta -O mipsbe/vmlinux-3.2.0-4-4kc-malta

echo "Downloading & setting MIPSLE Debian Wheezy"
mkdir mipsle
wget https://people.debian.org/~aurel32/qemu/mipsel/debian_wheezy_mipsel_standard.qcow2 -O mipsle/debian_wheezy_mipsel_standard.qcow2
wget https://people.debian.org/~aurel32/qemu/mipsel/vmlinux-3.2.0-4-4kc-malta -O mipsle/vmlinux-3.2.0-4-4kc-malta

mkdir aarch64
wget https://cloud-images.ubuntu.com/trusty/current/unpacked/trusty-server-cloudimg-arm64-vmlinuz-generic -O aarch64/trusty-server-cloudimg-arm64-vmlinuz-generic
wget https://cloud-images.ubuntu.com/trusty/current/trusty-server-cloudimg-arm64-disk1.img -O aarch64/trusty-server-cloudimg-arm64-disk1.img

echo "Done"

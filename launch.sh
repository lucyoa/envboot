#!/bin/bash

if [[ $1 == "ssh" ]]; then
    echo > ~/.ssh/known_hosts
    exit
fi

echo "When it will be ready, just connect (credentials: root/root): ssh root@localhost -p2222"
if [[ $1 == "mipsle" ]]; then
    echo "Launching Mipsle machine"
    qemu-system-mipsel -M malta -kernel mipsle/vmlinux-3.2.0-4-4kc-malta -hda mipsle/debian_wheezy_mipsel_standard.qcow2 -append "root=/dev/sda1 console=tty0" -net nic -net user,hostfwd=tcp::2222-:22
fi

if [[ $1 == "mipsbe" ]]; then
    echo "Launching Mipsbe machine"
    qemu-system-mips -M malta -kernel mipsbe/vmlinux-3.2.0-4-4kc-malta -hda mipsbe/debian_wheezy_mips_standard.qcow2 -append "root=/dev/sda1 console=tty0" -net nic -net user,hostfwd=tcp::2222-:22
fi

if [[ $1 == "armle" ]]; then
    echo "Launching Armle machine"
    qemu-system-arm -M versatilepb -kernel armle/vmlinuz-3.2.0-4-versatile -initrd armle/initrd.img-3.2.0-4-versatile -hda armle/debian_wheezy_armel_standard.qcow2 -append "root=/dev/sda1" -net nic -net user,hostfwd=tcp::2222-:22
fi

if [[ $1 == "aarch64" ]]; then
    echo "Launching aarch64 machine"
    qemu-system-aarch64 -m 1024 -cpu cortex-a57 -nographic -machine virt -kernel aarch64/trusty-server-cloudimg-arm64-vmlinuz-generic \
        -append 'root=/dev/vda1 rw rootwait mem=1024M console=ttyAMA0,38400n8 init=/usr/lib/cloud-init/uncloud-init ds=nocloud ubuntu-pass=randomstring' \
        -drive if=none,id=image,file=aarch64/trusty-server-cloudimg-arm64-disk1.img \
        -device virtio-blk-device,drive=image \
        -device virtio-net-device,netdev=user0 \
        -netdev user,id=user0,hostfwd=tcp::2222-:22
fi

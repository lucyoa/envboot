#!/bin/bash

echo > ~/.ssh/known_hosts

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

#!/bin/bash

#create
#qemu-img create -f qcow2 vmname disk_spaceG

echo -e "1. Internal network\n2. simple"
ls | grep qcow2
read -p "vm option: " option
read -p "vm name: " name

case $option in
	1)
		read -p "listen/connect: " union
		qemu-system-x86_64 -m 2G -smp 2 --enable-kvm -name "$name" \
			-netdev socket,id=mynet0,$union=:1234 -device e1000,netdev=mynet0 \
			-boot d -hda $name #-cdrom *.iso
		;;
	2)
		qemu-system-x86_64 -m 4G -smp 2 --enable-kvm -name "$name" \
			-boot d -hda $name #-cdrom *.iso
		;;
	*)
		echo "internal network - simple"
		;;
esac

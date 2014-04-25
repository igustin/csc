#!/bin/bash

# concurrent stick copy

# choose ISO
#iso=openSUSE-13.1-KDE-Live-x86_64.iso
iso=openSUSE-13.1-GNOME-Live-x86_64.iso

umount /dev/sd[bcdef][12]

dd if=$iso of=/dev/sdb bs=8M &
dd if=$iso of=/dev/sdc bs=8M &
dd if=$iso of=/dev/sdd bs=8M &
dd if=$iso of=/dev/sde bs=8M &
dd if=$iso of=/dev/sdf bs=8M &

wait

sync

blockdev --flushbufs /dev/sdb
blockdev --flushbufs /dev/sdc
blockdev --flushbufs /dev/sdd
blockdev --flushbufs /dev/sde
blockdev --flushbufs /dev/sdf

eject /dev/sdb
eject /dev/sdc
eject /dev/sdd
eject /dev/sde
eject /dev/sdf

# beep for finish

echo -e "\a"

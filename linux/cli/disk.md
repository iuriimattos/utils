----
# Disk

Show disks and partitions
```
lsblk
```

Format flash disk {X}=letter {Y}=partition
```
mkfs.vfat -F 32 /dev/sd{X}{Y}
```

Create bootable flash disk {X}=letter
```
dd if=/path/to/file.iso of=/dev/sd{X} bs=4M && sync
```
----
# Filesystem

Scan ext
```
e2fsck -f -y /dev/sda1
```

Mount filesystem
```
sudo mount -o rw /partition/identifier /mount/point
```
## issues
### [ALERT! /dev/disk/by-uuid/xxxxxxxxx does not exist. Dropping to a shell](https://askubuntu.com/questions/516217/alert-dev-disk-by-uuid-xxxxxxxxx-does-not-exist-dropping-to-a-shell/516471#516471)
- mount sda2 in mnt/
- mount sda1 in mnt/boot/efi
```
sudo mount /dev/sda2 /mnt && sudo mount --bind /dev /mnt/dev && sudo mount --bind /proc /mnt/proc && sudo mount --bind /sys /mnt/sys && sudo chroot /mnt
update-initramfs -u
update-grub
```
### [Unable to reach network from chroot](https://unix.stackexchange.com/questions/280500/unable-to-reach-network-from-chroot/280534#280534)
```
cp /etc/resolv.conf /mnt/etc/resolv.conf
```
### [Upgraded to 18.04 and now have many broken packages and unmet dependencies](https://askubuntu.com/questions/1032126/upgraded-to-18-04-and-now-have-many-broken-packages-and-unmet-dependencies/1032453#1032453)
edit file (use vscode prefer)
```
/var/lib/dpkg/status
```
clear out the entire **Depends:** line from the packages that were complaining.
then execute  
```
apt-get update && apt-get upgrade
```
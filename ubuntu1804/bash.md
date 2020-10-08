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

----
# Packages

TTY font-size
```
sudo dpkg-reconfigure console-setup
```

Save all distro packages into packages.txt
```
dpkg -l | grep ^ii | awk '{ print $2 }' > packages.txt
```

Install all packages from packages.txt
```
apt-get install $(grep -vE "^\s*#" packages.txt  | tr "\n" " ")
```

Clean corrupted packages
```
sudo dpkg --purge dpkg --get-selections | grep deinstall | cut -f1
```

DANGER

Set default python version
```
rm /usr/bin/python
ln -s /usr/bin/python2.7 /usr/bin/python
```

Fully reinstall python 
[Broken python dependencies after trying to re-install](https://askubuntu.com/a/1080265)

[Impossible to install with apt-get - python missing](https://askubuntu.com/a/1066587)

[Can anyone help me with this? I am not able to remove or re-install software center or any software](https://askubuntu.com/a/546506)

DANGER

[W: Possible missing firmware /lib/firmware/rtl_nic/](https://askubuntu.com/a/1255803)

[W: Possible missing firmware /lib/firmware/i915](https://askubuntu.com/a/1255803)

for secure, firstly boot livecd and mount filesystem (dev/proc/sys) finally chroot mounted path then
```
git clone git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
sudo cp -r linux-firmware/rtl_nic/ /lib/firmware/
sudo cp -r linux-firmware/i915 /lib/firmware/
```

Install cached packages
```
dpkg -i /var/cache/apt/archives/*.deb
dpkg --configure -a
apt dist-upgrade 
```

restart gui (change lightdm)
```
sudo service lightdm restart
```

start gui
```
startx
```

List applications no longer used
```
for i in {/usr,~/.local}/share/applications/*.desktop; do which $(grep -Poh '(?<=Exec=).*?( |$)' $i) > /dev/null || echo $i; done
```

----
# General

Group strings by pattern
```
grep -E '(pattern1|pattern2)' file
```

Show logs realtime
```
journalctl -f
```

Show application PID
```
ps aux | grep application
```

Kill process by PID
```
kill -9 <PID>
```

usb bootable (change /dev/sdd1)
```
sudo winusb -v --install win7-64x-PTBR.iso /dev/sdd1
```

define folder owner
```
sudo chown -hR iurimatos ./www/
```

search packages
```
apt-cache search keyword
```

Check ssh access
```
ssh -T git@bitbucket.org
```

Connect to postgres
```
sudo -u postgres psql postgres
```

Init android emulator
```
emulator -avd Nexus_5_API_27 -use-system-libs
```



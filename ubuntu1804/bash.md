----
# Mount filesystem 
```
sudo mount -o rw /partition/identifier /mount/point
```
## issues
### [ALERT! /dev/disk/by-uuid/xxxxxxxxx does not exist. Dropping to a shell](https://askubuntu.com/questions/516217/alert-dev-disk-by-uuid-xxxxxxxxx-does-not-exist-dropping-to-a-shell/516471#516471)
```
sudo mount /dev/sda1 /mnt
sudo mount --bind /dev /mnt/dev
sudo mount --bind /proc /mnt/proc
sudo mount --bind /sys /mnt/sys
sudo chroot /mnt
update-initramfs -u
update-grub
reboot
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
# Group strings by pattern
```
grep -E '(pattern1|pattern2)' file
```

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

Fully reinstall python [Broken python dependencies after trying to re-install](https://askubuntu.com/a/1080265)
```
sudo apt-get purge python* && sudo apt-get autoclean && sudo apt-get install python*
```

usb bootable (change /dev/sdd1)
```
sudo winusb -v --install win7-64x-PTBR.iso /dev/sdd1
```

Show logs realtime
```
journalctl -f
```

define folder owner
```
sudo chown -hR iurimatos ./www/
```

search packages
```
apt-cache search keyword
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

Clean corrupted packages
```
sudo dpkg --purge dpkg --get-selections | grep deinstall | cut -f1
```

Scan filesystem
```
e2fsck -f -y /dev/sda1
```

Show nautilus PID
```
ps aux | grep nautilus
```

Kill process by PID
```
kill -9 <PID>
```

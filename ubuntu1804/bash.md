define folder owner
```
sudo chown -hR iurimatos ./www/
```

search packages
```
apt-cache search keyword
```

usb bootable (change /dev/sdd1)
```
sudo winusb -v --install win7-64x-PTBR.iso /dev/sdd1
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

Show logs realtime
```
journalctl -f
```

Save all distro packages into packages.txt
```
dpkg -l | grep ^ii | awk '{ print $2 }' > packages.txt
```

Install all packages from packages.txt
```
apt-get install $(grep -vE "^\s*#" packages.txt  | tr "\n" " ")
```

TTY font-size
```
sudo dpkg-reconfigure console-setup
```

Group strings by pattern
```
grep -E '(pattern1|pattern2)' file
```

Mount filesystem 
```
sudo mount -o rw /partition/identifier /mount/point
```
related issues
* (ALERT! /dev/disk/by-uuid/xxxxxxxxx does not exist. Dropping to a shell)[https://askubuntu.com/questions/516217/alert-dev-disk-by-uuid-xxxxxxxxx-does-not-exist-dropping-to-a-shell/516471#516471]

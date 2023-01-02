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
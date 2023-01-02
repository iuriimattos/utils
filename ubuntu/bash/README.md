----
# General

Clear screen logs
```
clear
```

Show system date
```
date
```

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
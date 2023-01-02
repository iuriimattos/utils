## docs

## [(todo)]((todo))

----

### groupadd

make a group
```
groupadd (groupname)
```

### groupdel

delete a group
```
groupdel (groupname)
```

### useradd

make a user
```
useradd (username)
```

make a user with name details and expiration time
```
useradd (username) -c (short description) -m (home directory name) -r (dd/mm/yyyy)
```

make a user with name details, default bash and password 
```
useradd (username) -c (short description) -s /bin/bash -m -p ${openssl passwd -crypt (password)}
```

make a user with name details, default bash, password and group
```
useradd (username) -c (short description) -s /bin/bash -m -p ${openssl passwd -crypt (password)} -G (groupname)
```

### usermod

change user settings
```
usermod (username)
```

change user settings to acesss default bash
```
usermod (username) -s /bin/bash
```

### userdel

delete a user
```
userdel (username)
```

### passwd

set user password
```
passwd (username)
```

expire user password
```
passwd (username) -e
```

### chsh
change user access shell

set default shell 
```
chsh -s /bin/bash username
```

### chmod
change user permisions

permit user execute file
```
chmod -x filename.extension
```

### logs

users
```
cat /etc/passwd
```

groups
```
cat /etc/group
```
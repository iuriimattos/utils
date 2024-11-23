## docs

### [(todo)]((todo))

----
# rm
> (todo)

Show list of files n d
```
ls | more
```

Show file if exist, file_name can be a regex
```
ls (file_name)
```

## Basic Long Format
Show list of files with details:
```bash
ls -l
```
Displays: permissions, number of links, owner, group, size, modification date, and filename

## Combined Options Explained
The command:
```bash
ls -lsa -it -r
```

### Individual Flags Breakdown

| Flag | Description | Example |
|------|-------------|---------|
| `-l` | Long format listing | `ls -l` |
| `-s` | Show size in blocks | `ls -s` |
| `-a` | Show all (including hidden) | `ls -a` |
| `-h` | Human-readable sizes | `1.5K, 2.1M, 3.0G` |
| `-i` | Show inode numbers | `ls -i` |
| `-t` | Sort by modification time | `ls -t` |
| `-r` | Reverse sort order | `ls -r` |

### Sample Output Without `-h`
```
inode   blocks  permissions  links  owner  group  size     date        filename
123456  4       -rw-r--r--  1      user   group  4096     Nov 23     file.txt
234567  8       drwxr-xr-x  2      user   group  8192     Nov 22     directory
```

### Effect on Output
- Shows detailed file information (`-l`)
- Includes hidden files (`-a`)
- Displays block size (`-s`)
- Shows inode numbers (`-i`)
- Sorts by modification time (`-t`)
- Reverses the order (`-r`) - oldest files first

### Sample Output With `-h`
```
inode   blocks  permissions  links  owner  group  size  date        filename
123456  4       -rw-r--r--  1      user   group  4.0K  Nov 23     file.txt
234567  8       drwxr-xr-x  2      user   group  8.0K  Nov 22     directory
```

### Benefits of `-h` Flag
- Converts bytes to human-readable units:
  - `K` for Kilobytes
  - `M` for Megabytes
  - `G` for Gigabytes
  - `T` for Terabytes
- Makes file sizes easier to understand at a glance
- Particularly useful for larger files
```

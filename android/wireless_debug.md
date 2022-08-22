tested with Windows 11

winver:
21H2 OS Build 22000.856

1. touch
```
Developer options 
```
2. enable
```
Wireless debugging
```
3. touch
```
Wireless debugging
```
4. touch
```
Pair device with pairing code
```
5. open terminal in “scrcpy_folder” and write
```
adb pair “IP address”:“port”
```
6. copy
```
Wi-Fi pairing code displayed
```
7. write in opened terminal
```
“pairing code”
```
8. touch
```
Wireless debugging
```
9. write in opened terminal
```
adb.exe connect “IP address”:“port”
```
10. write in opened terminal
```
scrcpy.exe --tcpip=“IP address”:“port”
```

done.
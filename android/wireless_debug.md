# wireless debub

## sync adb devices without wireless option

1. plug usb

```
adb devices
```
List of devices attached
DEVICE_ID        device

```
adb -s DEVICE_ID tcpip 5555
```
restarting in TCP mode port: 5555

```
adb devices
```

```
adb connect DEVICE_IP:5555
```

```
adb devices
```

2 .plug unplug

## Android 11 wireless debug

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

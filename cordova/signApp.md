```
cordova build --release android
```

```
cd platforms\android\app\build\outputs\apk\release
```

```
keytool -genkey -v -keystore wowkit.keystore -alias wowkit -keyalg RSA -keysize 2048 -validity 10000
```

```
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore wowkit.keystore app-release-unsigned.apk wowkit
```

>copy zipalign android-sdk\build-tools\

```
zipalign -v 4 app-release-unsigned.apk wowkit.apk
```

upload wowkit.apk

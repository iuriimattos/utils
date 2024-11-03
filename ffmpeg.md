[VP9 Encode Guide](https://gist.github.com/mrintrepide/3033c35ee9557e66cff7806f48dbd339)

[Encoding Video](https://gist.github.com/Vestride/278e13915894821e1d6f)


H.264 (x264) 100MB to 64MB
```
ffmpeg -i bruna_trajeto_libras.mp4 -c:v libx264 -crf 28 -c:a aac -b:a 128k halfsize.mp4
```

H.264 (x264) to half-size
```
ffmpeg -i 2023_08 -c:v libx264 -crf 23 -vf "scale=iw/2:ih/2" -c:a aac -b:a 128k output.mp4
```

transcode OGG to 320kbps MP3
```
ffmpeg -i "singing1.ogg" -vn -c:a libmp3lame -b:a 320k "song1.mp3"
```

trim video:

```sh
ffmpeg -ss 00:01:10 -i ./input.mp4 -t 00:00:11 -c copy ./output.mp4
```

- `-ss 00:01:10`: Defines the starting point of the cut.
- `-i ./input.mp4`: Specifies the input file.
- `-t 00:00:20`: Defines the duration of the stretch to be cut.
- `-c copy`: Copies audio and video flows without reunions.
- `./output.mp4`: Output file name.

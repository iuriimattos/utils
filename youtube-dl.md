# YT-DLP

###### update to nightly version
```bash
yt-dlp --update-to nightly
```

###### audio mp3 worst quality
```bash
yt-dlp -o "%(title)s.%(ext)s" -i --extract-audio --audio-format mp3 --audio-quality 0 ${url}
```

###### trim video
```bash
yt-dlp --download-sections "*00:36-01:38" -f "bv[ext=mp4]+ba[ext=m4a]/best[ext=mp4]/best" "https://www.youtube.com/watch?v=iubijJDUZaM" -o "Grinch"
```

# YOUTUBE-DL

###### dont know what output
```
youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' (YOUTUBE_URL)
```

###### video best quality
```
youtube-dl -o "%(title)s.%(ext)s" -f "bestvideo+bestaudio" (YOUTUBE_URL)
```

###### audio mp3 best quality
```
youtube-dl -i -o "%(title)s.%(ext)s" -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 (YOUTUBE_URL)
```

###### audio mp3 best quality (by max seconds duration)
```
youtube-dl --match-filter 'duration < 1200' -i -o "%(title)s.%(ext)s" -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 (YOUTUBE_URL)
```

##### [Download range](https://github.com/ytdl-org/youtube-dl/issues/622#issuecomment-516375945)

###### For video:
```
youtube-dl -o "%(title)s.%(ext)s" -f "bestvideo+bestaudio" --ffmpeg-location "C:\ffmpeg\bin" "(YOUTUBE_URL) --postprocessor-args "-ss 01:30 -t 
00:20"
```

###### For audio:
```
youtube-dl -o "%(title)s.%(ext)s" -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 --ffmpeg-location "c:\ffmpeg\bin" "(YOUTUBE_URL)" --postprocessor-args "-ss 01:30 -t 00:20"
```

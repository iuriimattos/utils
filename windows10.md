[How to terminate all jobs running on a specific virtual desktop?](https://www.tenforums.com/virtualization/206207-how-terminate-all-jobs-running-specific-virtual-desktop.html)

if `C:\Program Files\nodejs` throw `'C:\Program' is not recognized as an internal or external command...` else `C:\Progra~1\nodejs\node.exe`

[SharpKeys is a utility that manages a Registry key that allows Windows to remap one key to any other key.](https://github.com/randyrants/sharpkeys)

[TreeSize](https://apps.microsoft.com/store/detail/treesize-free/XP9M26RSCLNT88?hl=en-us&gl=us)

[Missing dlls after install Microsoft Visual C++ whatever](ahk/README.md)

[How to Repair Windows 10 Issues (Windows Update, Component Store Corruption, etc.)](hackaapl.com/how-to-repair-windows-10-issues-windows-update-component-store-corruption-etc/)

[How To Get Battery Fully charged Notification In Windows 10](https://thegeekpage.com/battery-full-charged-notification-in-windows-10/#:~:text=When%20your%20Laptop's%20battery%20level,when%20the%20battery%20is%20full.&text=If%20you%20are%20using%20any,the%20battery%20level%20is%20full.)

[How to delete large folders in Windows super fast](https://www.ghacks.net/2017/07/18/how-to-delete-large-folders-in-windows-super-fast/)

Google Chrome Canary args

```
"C:\Users\(user_folder)\AppData\Local\Google\Chrome SxS\Application\chrome.exe" --user-data-dir="%LOCALAPPDATA%\Google\Chrome SxS\User Data" --disable-web-security --remote-debugging-port=9222
```

[Set up an SSH key](https://confluence.atlassian.com/bitbucket/set-up-an-ssh-key-728138079.html)
commands detail:
```
eval "$(ssh-agent -s)"
````

[Encoding Video](https://gist.github.com/Vestride/278e13915894821e1d6f)
* VP9
```
ffmpeg -i aws.mp4 -vcodec libvpx-vp9 -b:v 1M -acodec libvorbis aws.webm
```

[Configurar a barra de tarefas do Windows 10](https://docs.microsoft.com/pt-br/windows/configuration//configure-windows-10-taskbar)

[Export StartLayout Windows 10 issue/questions](https://community.spiceworks.com/topic/2026343-export-startlayout-windows-10-issue-questions)

[Keyboard not working in Windows 10 Apps + Start Menu](https://superuser.com/questions/1125367/keyboard-not-working-in-windows-10-apps-start-menu)

[How to Fix: Windows 10 Desktop Icon Spacing](https://www.infopackets.com/news/9719/how-fix-windows-10-desktop-icon-spacing#:~:text=Hold%20down%20the%20CTRL%20key,CTRL%20key%20on%20the%20keyboard.)

Windows Store apps folder

```
shell:AppsFolder
```

Apps (No Windows Store App) Pinned On Taskbar

```
%APPDATA%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar
```

[Windows 10 Tip: Make Apps or Files Launch Automatically During Startup](https://www.groovypost.com/howto/windows-10-make-apps-files-launch-automatically-during-startup/)

Starup apps

```
shell:startup
%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup
```

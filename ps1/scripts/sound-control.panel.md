# Sound Control Panel

Absolutely—there are a few reliable ways to open the Sound settings from PowerShell, depending on whether you want the **modern Settings** pages or the **classic Sound Control Panel**.

Below are ready-to-use snippets you can drop into a `.ps1` script (similar in style to your Defender example).

***

## 1) Open the modern **Sound** page (Settings)

```powershell
# Open main Sound settings (Output device, Input device, Volume)
Start-Process "ms-settings:sound"
```

### Common deep links:

```powershell
# Volume mixer (App volume & device preferences)
Start-Process "ms-settings:apps-volume"

# Microphone privacy settings (per-app mic access)
Start-Process "ms-settings:privacy-microphone"

# Bluetooth & devices > Audio (useful for managing headsets)
Start-Process "ms-settings:bluetooth"
```

> These `ms-settings:` URIs work on Windows 10/11 and are the cleanest way to jump straight into the Settings experience.

***

## 2) Open the **classic Sound Control Panel** (mmsys.cpl)

If you prefer the old Sound dialog (Playback / Recording / Sounds / Communications tabs):

```powershell
# Open the classic Sound Control Panel (defaults to the last tab you used)
Start-Process "control.exe" "mmsys.cpl"

# Open specific tabs directly:
Start-Process "control.exe" "mmsys.cpl,,0"   # Playback
Start-Process "control.exe" "mmsys.cpl,,1"   # Recording
Start-Process "control.exe" "mmsys.cpl,,2"   # Sounds
Start-Process "control.exe" "mmsys.cpl,,3"   # Communications
```

Alternative call style (same result):

```powershell
rundll32.exe shell32.dll,Control_RunDLL mmsys.cpl
```

***

## 3) Example scripts (like your Defender launcher)

### a) Launch modern Sound settings

```powershell
<#
.SYNOPSIS
    Launches Windows Sound settings (modern Settings).
.DESCRIPTION
    Opens the Windows Settings page for Sound.
.EXAMPLE
    PS> ./open-sound-settings.ps1
.NOTES
    Author: You | License: CC0
#>
#requires -version 5.1

Start-Process "ms-settings:sound"
exit 0 # success
```

### b) Launch classic Sound (Playback tab)

```powershell
<#
.SYNOPSIS
    Launches the classic Sound Control Panel on the Playback tab.
.DESCRIPTION
    Opens mmsys.cpl to the Playback devices tab (classic dialog).
.EXAMPLE
    PS> ./open-sound-playback.ps1
.NOTES
    Author: You | License: CC0
#>
#requires -version 5.1

Start-Process "control.exe" "mmsys.cpl,,0"
exit 0 # success
```

### c) Launch Volume Mixer (App volume & device preferences)

```powershell
<#
.SYNOPSIS
    Opens the Volume Mixer settings.
.DESCRIPTION
    Jumps to the modern Settings page for per-app volume and device preferences.
.EXAMPLE
    PS> ./open-volume-mixer.ps1
.NOTES
    Author: You | License: CC0
#>
#requires -version 5.1

Start-Process "ms-settings:apps-volume"
exit 0 # success
```

***

## Tips

*   No admin rights required for these launches.
*   `Start-Process` is the simplest/most readable way from PowerShell.
*   If a URI doesn’t open on a particular build, you can fall back to `control.exe mmsys.cpl`.

***

If you tell me exactly where you want to land (e.g., **Playback devices**, **Recording devices**, **Volume mixer**, or **Mic privacy**), I can tailor one tiny script to your exact target.

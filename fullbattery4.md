Okay, I can help you with alternatives, fixes, and improvements for your VBScript battery monitor, focusing on your preference for a strong, unavoidable visual alert using a fullscreen topmost window with PowerShell.

Here's a breakdown of recommendations:

**1. Enhanced Fullscreen Topmost Alert with PowerShell (Recommended)**

The `[System.Windows.MessageBox]::Show` is good for simple alerts, but for a truly "unavoidable" fullscreen visual, creating a custom PowerShell form (using Windows Forms) is much more effective.

**PowerShell Script (`FullScreenAlert.ps1`):**

Save the following code as a `.ps1` file (e.g., `C:\Scripts\FullScreenAlert.ps1`). This script creates a borderless, maximized, topmost window with your alert message. It will close when clicked or when any key is pressed.

```powershell
param (
    [string]$AlertMessage = "Default Alert Message"
)

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# --- Configuration ---
$alertBackgroundColor = [System.Drawing.Color]::DarkRed # A strong, attention-grabbing color
$alertTextColor = [System.Drawing.Color]::White
$alertFont = New-Object System.Drawing.Font("Segoe UI", 36, [System.Drawing.FontStyle]::Bold) # Modern, large font
$alertTitle = "Battery Alert"
# --- End Configuration ---

$form = New-Object System.Windows.Forms.Form
$form.Text = $alertTitle
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::None # No border, title bar, or buttons
$form.WindowState = [System.Windows.Forms.FormWindowState]::Maximized # Fullscreen
$form.TopMost = $true # Stays on top of other windows
$form.BackColor = $alertBackgroundColor
$form.ShowInTaskbar = $false # Optional: hide from taskbar for a cleaner look

$label = New-Object System.Windows.Forms.Label
$label.Text = $AlertMessage
$label.Font = $alertFont
$label.ForeColor = $alertTextColor
$label.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter # Center the text
$label.Dock = [System.Windows.Forms.DockStyle]::Fill # Make the label fill the form

$form.Controls.Add($label)

# --- Close Handlers ---
# Close the form when it's clicked
$form.Add_Click({ $form.Close() })
$label.Add_Click({ $form.Close() }) # Label might cover the form, so add handler to it too

# Close the form when any key is pressed
$form.Add_KeyDown({ $form.Close() })

# Ensure the form gets focus to receive key events and is activated
$form.Add_Shown({
    $form.Activate() # Bring to foreground and activate
    $form.Focus()    # Set focus to receive key presses
})

# Show the form as a modal dialog (blocks interaction with other windows until closed)
$form.ShowDialog() | Out-Null
```

**2. Improvements to Your VBScript**

Here's your VBScript, modified to:
*   Call the new PowerShell fullscreen alert.
*   Query the full battery capacity only once at the start.
*   Include basic error handling for `FullChargedCapacity`.

```vbscript
Set oShell = CreateObject("WScript.Shell")
Set oLocator = CreateObject("WbemScripting.SWbemLocator")
Set oServices = oLocator.ConnectServer(".", "root\wmi")

Dim iFull, iRemaining, bCharging, iPercent, alertText
Dim sPowerShellScriptPath

' --- Configuration ---
' !!! IMPORTANT: Update this path to where you saved FullScreenAlert.ps1 !!!
sPowerShellScriptPath = "C:\Scripts\FullScreenAlert.ps1" 
' --- End Configuration ---

' Get full battery capacity once
Set oResults = oServices.ExecQuery("Select FullChargedCapacity from BatteryFullChargedCapacity")
iFull = 0 ' Initialize
For Each oResult In oResults
    If Not IsNull(oResult.FullChargedCapacity) And oResult.FullChargedCapacity > 0 Then
        iFull = oResult.FullChargedCapacity
    End If
    Exit For ' Assuming only one battery providing this info
Next

If iFull = 0 Then
    MsgBox "Error: Could not determine full battery capacity. Script will exit.", vbCritical, "Battery Monitor Error"
    WScript.Quit
End If

Do
    Set oResults = oServices.ExecQuery("Select RemainingCapacity, Charging from BatteryStatus")
    For Each oResult In oResults
        If Not IsNull(oResult.RemainingCapacity) Then
            iRemaining = oResult.RemainingCapacity
        Else
            iRemaining = 0 ' Or handle as an error/unknown state
        End If
        bCharging = oResult.Charging
        Exit For ' Assuming one primary battery status
    Next

    If iFull > 0 Then ' Ensure iFull is valid before division
        iPercent = Int((iRemaining / iFull) * 100)
    Else
        iPercent = 0 ' Or handle as an error/unknown state
    End If


    If (bCharging And iPercent > 80) Or (Not bCharging And iPercent < 40) Then
        If bCharging Then
            alertText = "Battery is at " & iPercent & "% and charging." & vbCrLf & vbCrLf & "Consider unplugging soon to preserve battery health." & vbCrLf & "(Click or press any key to dismiss)"
        Else
            alertText = "Battery is at " & iPercent & "% and NOT charging!" & vbCrLf & vbCrLf & "Please connect your charger." & vbCrLf & "(Click or press any key to dismiss)"
        End If

        ' Launch PowerShell fullscreen alert
        ' The command builds: powershell -ExecutionPolicy Bypass -NoProfile -NonInteractive -WindowStyle Hidden -File "C:\Path\To\FullScreenAlert.ps1" "Your alert text here"
        Dim command
        command = "powershell -ExecutionPolicy Bypass -NoProfile -NonInteractive -WindowStyle Hidden -File """ & sPowerShellScriptPath & """ """ & Replace(alertText, """", """""") & """"
        
        ' Use 0 for hidden window style, True to wait for the script to complete
        oShell.Run command, 0, True 
    End If

    WScript.Sleep 300000 ' 5 minutes (300,000 milliseconds)
Loop
```

**Explanation of VBScript Changes:**

*   **`sPowerShellScriptPath`**: Added a variable at the top for you to easily set the path to your `FullScreenAlert.ps1` script. **You must update this path.**
*   **`FullChargedCapacity` Query**: Moved outside the loop so it's queried only once, which is more efficient.
*   **Error Handling for `iFull`**: Added a check to ensure `iFull` is a positive number before performing division. If not, it displays an error and quits.
*   **PowerShell Call**:
    *   `powershell -ExecutionPolicy Bypass`: Allows the script to run even if the system's execution policy is restrictive.
    *   `-NoProfile`: Prevents loading of PowerShell profiles for faster startup and a cleaner environment.
    *   `-NonInteractive`: Ensures the script doesn't prompt for input.
    *   `-WindowStyle Hidden`: Hides the PowerShell console window itself (the alert form is separate).
    *   `-File """ & sPowerShellScriptPath & """`: Specifies the script file to run. Quotes handle paths with spaces.
    *   `""" & Replace(alertText, """", """""") & """"`: Passes the `alertText` as a single argument to the PowerShell script. The `Replace` function handles any double quotes within the `alertText` itself by doubling them, which is the way to escape quotes within a quoted string argument for PowerShell.
    *   `oShell.Run command, 0, True`:
        *   `0`: Hides the PowerShell console window.
        *   `True`: Makes the VBScript wait for the PowerShell alert window to be dismissed before continuing the loop (and starting the `WScript.Sleep`).

**How to Use:**

1.  **Save the PowerShell script:** Copy the PowerShell code, paste it into a plain text file, and save it as `FullScreenAlert.ps1` (or any name you prefer, but update `sPowerShellScriptPath` in the VBScript accordingly). Make sure you know the full path to this file.
2.  **Update VBScript:** Copy the improved VBScript. **Crucially, change the `sPowerShellScriptPath` variable** in the VBScript to the correct full path of your saved `FullScreenAlert.ps1` file.
3.  **Run the VBScript:** Execute the VBScript (`.vbs`) file as you normally would.

**Further Recommendations & Considerations:**

*   **Alert Logic (`If` conditions):** The conditions `(bCharging And iPercent > 80)` and `(Not bCharging And iPercent < 40)` are your current logic. You can adjust these percentages as needed.
*   **Multiple Displays:** The `FormWindowState.Maximized` in PowerShell will typically maximize the alert on the primary display. Creating an alert that truly spans *all* monitors or targets a specific non-primary monitor is significantly more complex and would require more advanced PowerShell scripting to determine screen layouts and sizes. For most "unavoidable alert" scenarios, a fullscreen alert on the primary display is very effective.
*   **Error Handling in VBScript:** The provided VBScript has basic error handling for `FullChargedCapacity`. You could expand this for WMI connection errors or other potential issues if you need more robustness.
*   **Alternative Alert Dismissal:** The PowerShell script currently closes the alert on a click or any key press. You could modify it to include an "OK" button or a timeout if you prefer a different interaction.
*   **Resource Usage:** The 5-minute sleep interval is generally fine. If you need more frequent checks, be mindful of slight increases in background resource usage.

This approach should give you the strong, unavoidable visual alert you're looking for, with more control over its appearance than a standard message box.

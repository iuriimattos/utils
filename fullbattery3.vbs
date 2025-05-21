Set oShell = CreateObject("WScript.Shell")
Set oLocator = CreateObject("WbemScripting.SWbemLocator")
Set oServices = oLocator.ConnectServer(".", "root\wmi")

' Get full battery capacity
Set oResults = oServices.ExecQuery("Select * from BatteryFullChargedCapacity")
For Each oResult In oResults
    iFull = oResult.FullChargedCapacity
Next

Do
    Set oResults = oServices.ExecQuery("Select * from BatteryStatus")
    For Each oResult In oResults
        iRemaining = oResult.RemainingCapacity
        bCharging = oResult.Charging
    Next

    iPercent = ((iRemaining / iFull) * 100) Mod 100

    If (bCharging And iPercent > 20) Or (Not bCharging And iPercent < 40) Then
        If bCharging Then
            alertText = "Battery is at " & iPercent & "% and still charging!"
        Else
            alertText = "Battery is at " & iPercent & "% and not charging!"
        End If

        ' Launch PowerShell fullscreen alert
        oShell.Run "powershell -WindowStyle Hidden -Command ""Add-Type -AssemblyName PresentationFramework;" & _
                   "[System.Windows.MessageBox]::Show('" & alertText & "','Battery Alert','OK','Warning')"""
    End If

    WScript.Sleep 300000 ' 5 minutes
Loop

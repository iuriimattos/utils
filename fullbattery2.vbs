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

    If bCharging And (iPercent > 80) Then
        oShell.Popup "🔋 Battery is at " & iPercent & "% and still charging.", 5, "Battery Monitor", 64
    ElseIf Not bCharging And (iPercent < 40) Then
        oShell.Popup "🔋 Battery is at " & iPercent & "% and not charging.", 5, "Battery Monitor", 48
    End If

    WScript.Sleep 300000 ' 5 minutes
Loop

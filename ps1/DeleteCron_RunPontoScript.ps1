# Define the task name
$taskName = "RunPontoScript"

# Check if the task exists
if (Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue) {
    Unregister-ScheduledTask -TaskName $taskName -Confirm:$false
    Write-Host "Scheduled task '$taskName' has been removed successfully."
} else {
    Write-Host "Scheduled task '$taskName' does not exist."
}
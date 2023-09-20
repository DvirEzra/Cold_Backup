<#
Script Name: Cold Backup PowerShell Script
Description: This PowerShell script performs a cold backup, deletes old files, and sends a backup log via email.
License: MIT
#>

# Define the log file location. Update this path as needed.
$Logfile = "Specify\Your\Log\File\Path"

# Function to write log messages to the specified log file.
function WriteLog
{
    Param ([string]$LogString)
    $Stamp = (Get-Date).ToString("yyyy/MM/dd HH:mm:ss")
    $LogMessage = "$Stamp $LogString"
    Add-content $LogFile -value $LogMessage
}

# Log the start of the backup process.
WriteLog "Backup Started"

# Define the destination folder where backup files will be copied.
$DestinationFolder = "Specify\Your\Destination\Folder\Path"

# Delete old files in the destination folder.
Get-ChildItem -Path $DestinationFolder -Include * -File -Recurse | foreach { $_.Delete() }

# Define the earliest modified time (e.g., 7 days ago).
$EarliestModifiedTime = (Get-date).AddDays(-7)

# Get a list of files to back up from the first source folder.
$Files = Get-ChildItem -recurse "Specify\Your\First\Source\Folder\Path" -include *.bco,*.vbk 

# Get a list of files to back up from the second source folder.
$Files2 = Get-ChildItem -recurse "Specify\Your\Second\Source\Folder\Path" -include *.bco,*.vbk 

# Loop through files in the second source folder.
foreach ($File in $Files2) {
    if ($File.LastWriteTime -gt $EarliestModifiedTime)
    {
        # Copy the file to the destination folder.
        Copy-Item $File -Destination $DestinationFolder
        Write-Host "Copying $File"
        WriteLog $File
    }
    else 
    {
        Write-Host "Not copying $File"
    }
}

# Loop through files in the first source folder.
foreach ($File in $Files) {
    if ($File.LastWriteTime -gt $EarliestModifiedTime)
    {
        # Copy the file to the destination folder.
        Copy-Item $File -Destination $DestinationFolder
        Write-Host "Copying $File"
        WriteLog $File
    }
    else 
    {
        Write-Host "Not copying $File"
    }
}

# Log the completion of the backup process.
WriteLog "Backup Finished"

# Read the content of the backup log into the $body variable.
$body = Get-Content -Path $LogFile | Out-String 

# Send an email with the backup log. Update email settings as needed.
Send-MailMessage -To "recipient@example.com" -From "sender@example.com" -Subject "ColdBackup" -Body $body -SmtpServer "smtp.example.com"

# Move the backup log files to a subfolder with a timestamp in the name.
Get-ChildItem -Path $LogFile | ForEach-Object {
    Move-Item -Path $_.FullName -Destination "Specify\Your\Log\Folder\$($_.BaseName,(Get-Date).ToString("MMddyy"),$_.Extension)"
}

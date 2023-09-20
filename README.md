# Table of Contents

- [Cold Backup PowerShell Script](#cold-backup-powershell-script)
  - [Prerequisites](#prerequisites)
  - [Usage](#usage)
  
  

# Cold Backup PowerShell Script

This PowerShell script is designed to perform a cold backup and provides a logging mechanism for tracking backup operations. Below is a step-by-step guide for using this script.

## Prerequisites

Before using this script, make sure you have the following:

- PowerShell installed on your system.
- Appropriate permissions to read and write files in the source and destination folders.
- Configured email settings to send backup logs.

## Usage

1. Clone or download this repository to your local machine.

2. Open PowerShell as an administrator.

3. Navigate to the directory where you've saved the script.

4. Edit the script to configure the following settings:

   - **Logfile**: Set the path for the log file where backup logs will be stored.
   - **$DestinationFolder**: Set the destination folder where backup files will be copied.
   - **Email settings**: Configure the email parameters in the `Send-MailMessage` section.

   ```powershell
   $Logfile = "Specify\Your\Log\File\Path"
   $DestinationFolder = "Specify\Your\Destination\Folder\Path"
   
   # ...
   
   Send-MailMessage -To "recipient@example.com" -From "sender@example.com" -Subject "ColdBackup" -Body $body -SmtpServer "smtp.example.com"

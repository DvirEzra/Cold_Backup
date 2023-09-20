# Table of Contents

- [Cold Backup PowerShell Script](#cold-backup-powershell-script)
  - [Prerequisites](#prerequisites)
  - [Usage](#usage)
  - [Important Notes](#important-notes)
  
  

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

   
5. Save your changes.

6. Run the script:

   ```powershell
   .\ColdBackup.ps1
   ```

   The script will perform the following actions:
   
   - Log the start of the backup.
   - Delete files from the destination folder.
   - Copy eligible files from the source folders to the destination.
   - Log each file that is copied or not copied.
   - Log the completion of the backup.
   - Send an email with the backup log.

7. After the script completes, you can check the backup log in the specified log file.

8. The script will also move the backup log file to a subfolder with a timestamp in the name.

## Important Notes

- Ensure that you have appropriate permissions and backups of any critical data before running this script.

- Never publish sensitive paths or credentials in public repositories on GitHub or elsewhere. Always review your script for any sensitive information before sharing or uploading to a public repository.

- Modify the script as needed to fit your specific backup requirements and security policies.

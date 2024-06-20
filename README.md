# Uninstall McAfee from Domain Workstations

This PowerShell script uninstalls McAfee software from all user workstations on a specific domain, including hidden DLL files and McAfee LiveSafe (`mcuihost.exe`).

## Prerequisites

1. **PowerShell Remoting** must be enabled on the workstations.
2. The user running the script must have the necessary permissions to execute remote commands and uninstall software on the target machines.
3. Ensure `ActiveDirectory` module is installed to retrieve domain computers.

## Script Overview

The script performs the following steps:

1. Identifies installed McAfee products on the workstations.
2. Uninstalls the identified McAfee products.
3. Removes hidden DLL files from common McAfee directories.
4. Specifically checks for and removes `mcuihost.exe` associated with McAfee LiveSafe.

# Saudi Fix Cleaner

Windows maintenance script that removes temporary files, empties the Recycle Bin, and flushes the DNS cache. Written in native Batch: no installation, no dependencies.

![Platform](https://img.shields.io/badge/platform-Windows%2010%20%7C%2011-0078D4?style=flat-square&logo=windows&logoColor=white)
![Language](https://img.shields.io/badge/language-Batch-4D4D4D?style=flat-square&logo=windowsterminal&logoColor=white)
![Requires](https://img.shields.io/badge/requires-Administrator-B22222?style=flat-square)

## What it does

| Step | Target | Method |
| --- | --- | --- |
| 1 | User temporary files (`%TEMP%`) | Deletes contents; keeps the folder and its permissions |
| 2 | Windows temporary files (`C:\Windows\Temp`) | Deletes contents; keeps the folder and its permissions |
| 3 | Recycle Bin, all drives | `Clear-RecycleBin` (PowerShell) |
| 4 | DNS resolver cache | `ipconfig /flushdns` |

Files locked by running programs are skipped, not forced.

## Usage

1. Download [`SaudiFix.bat`](SaudiFix.bat).
2. Right-click the file and select **Run as administrator**.
3. Review the task list and press any key to start.

The script checks for administrator rights and exits with a message if they are missing.

## Notes

- **Recycle Bin deletion is permanent.** Restore anything you need before running.
- Prefetch is intentionally not cleared. Windows uses it to speed up application launch, and clearing it slows the next startup.
- Review the source before running any script with administrator rights. The full logic is in a single readable file.

## Author

**Rashid Alghamdi** · [SaudiFix](https://github.com/Scrim-Fix)

# GetFirefox PowerShell Script

This is a simple [PowerShell](https://microsoft.com/powershell) script that downloads [Firefox](https://firefox.com).

## Prerequisite
- [PowerShell Core](https://github.com/PowerShell/PowerShell) -- Tested with [6.1](https://github.com/PowerShell/PowerShell/releases/tag/v6.1.0). May or may not work with Windows PowerShell, or other versions.
- Linux (AMD64) -- Probably it is easily adopted to other platforms, too.

## Usage

    getfirefox.ps1 [-FirefoxPath] <string> [-Version] <string> -BuildNumber <int> [-ReleaseCandidate] [-Language <string>] [<CommonParameters>]

    getfirefox.ps1 [-FirefoxPath] <string> [-Version] <string> [-Language <string>] [<CommonParameters>]

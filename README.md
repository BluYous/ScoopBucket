# BluYous Scoop Bucket

[![Tests](https://github.com/BluYous/ScoopBucket/actions/workflows/ci.yml/badge.svg)](https://github.com/BluYous/ScoopBucket/actions/workflows/ci.yml) [![Excavator](https://github.com/BluYous/ScoopBucket/actions/workflows/excavator.yml/badge.svg)](https://github.com/BluYous/ScoopBucket/actions/workflows/excavator.yml)

## Installation

### Prerequisites

- [PowerShell](https://aka.ms/powershell) latest version or [Windows PowerShell 5.1](https://aka.ms/wmf5download)

PowerShell execution policy is required to be one of: `Unrestricted`, `RemoteSigned` or `ByPass` to execute the installer. For example:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Install as Admin

Installation under the administrator console has been disabled by default for security considerations. If you know what you are doing and want to install Scoop as administrator. Please download the installer and manually execute it with the `-RunAsAdmin` parameter in an elevated console. Here is the
example:

```powershell
Invoke-WebRequest -useb get.scoop.sh -OutFile 'install.ps1'
.\install.ps1 -RunAsAdmin
Remove-Item .\install.ps1
```

### Install Utils

```powershell
scoop install 7zip aria2 git -g
git config --system pull.rebase false
git config --system core.autocrlf false
scoop update
```

### Add Basic Buckets

```powershell
scoop bucket add extras
scoop bucket add versions
scoop bucket add java
scoop bucket add games
```

### Add This Bucket

```powershell
scoop bucket add BluYousScoopBucket https://github.com/BluYous/ScoopBucket
```

### Install Manifests

To install, do `scoop install <manifest>`.

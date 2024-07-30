# dotnet-autoupgrader

This script completely automates the process of upgrading a .NET Framework project to .NET 6 using Microsoft's official upgrade tool.

More information about the upgrade process can be found [here](https://docs.microsoft.com/en-us/dotnet/core/porting/).

## Usage

```
dotnet-autoupgrader.py <solution-path> [--no-backup] [-y] [-h | --help]
  <solution-path>    The path to a solution (.sln) file or a directory containing one or more solution files.
                     If a directory with multiple solution files is given, all of them will be upgraded.
  [--no-backup]      If the single projects should be backed up before upgrading.
  [-y]               Don't ask for confirmation before upgrading.
  [-h] [--help]      Show this help message.
```

## Requirements

- Python 3
- dotnet CLI
- .NET 6
- [.NET Upgrade Assistant](https://docs.microsoft.com/en-us/dotnet/core/porting/upgrade-assistant-overview#installation-steps)

## What this does

Microsoft offers a tool to upgrade existing .NET Framework projects to .NET 6.
However, as the tool asks after every step twice for confirmation, it's pretty annoying to upgrade,
especially if you have multiple projects.

This script addresses the issue and confirms the steps automatically.
It also can process multiple projects in one run, without the need to restart the tool over and over again.

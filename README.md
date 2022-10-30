# DotFiles

My first attempt at creating common files for my systems. Only Linux is supported at this time. If I ever setup Windows the same way or get a Mac I will make some adjustments.

## Recommended Development Extensions (VSCode)

* Markdown All in One - Provides table of contents and formatting functionality
* Markdownlint - Provides linting of markdown files
* ShellCheck - Provides linting of script files

## Setup Script

To install these files you need to run the `setup.sh` script. This file by default will not be executable, which can be fixed by running ``chmod +x setup.sh`.

## Install Script

This script will install the programs listed as preconfigured such as git, golang, and starship. The next time a terminal window is opened they will be preconfigured.

## Uninstall Script

TODO

## Bash Aliases

| Alias | Description                                                                                                    | Usage          |
| ----- | -------------------------------------------------------------------------------------------------------------- | -------------- |
| ll    | Lists all files in long mode with type symbol at the end                                                       | ll             |
| la    | Lists all files but `.` and `..` implied directories                                                           | la             |
| l     | Basic ls command with type symbol at the end                                                                   | l              |
| alert | Meant for long running commands to send a notification and play a sound when complete (Requires libnotify-bin) | sleep 5; alert |

## Preconfigured Programs

* [Bash](https://www.gnu.org/software/bash/)
* [Git](https://git-scm.com/)
* [Go](https://go.dev/)
* [Starship](https://starship.rs/)

## Tested Operating Systems

* Pop!_OS 22.04

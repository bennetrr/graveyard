# Setup Script for Ubuntu / Debian-Based Servers

## Content

<!-- TOC -->
- [Setup Script for Ubuntu / Debian-Based Servers](#setup-script-for-ubuntu--debian-based-servers)
  - [Content](#content)
  - [Compatibility](#compatibility)
  - [Usage](#usage)
  - [Applications](#applications)
    - [Maintaining](#maintaining)
    - [Git](#git)
    - [Servers / Runtimes](#servers--runtimes)
    - [Bash](#bash)
<!-- TOC -->

## Compatibility

This setup script is tested with Ubuntu Server 22.04 and Debian 12.

Other compatible operating systems are (as of 25.03.2023):

- Ubuntu 22.10
- Ubuntu 22.04
- Ubuntu 20.04
- Ubuntu 18.04
- Debian 12
- Debian 11
- Debian 10

Derivates like Kali Linux, Lubuntu etc. are also supported in the versions listed above.
Raspberry Pi OS is not supported.

## Usage

> **Note**
> The script must be run as root!

Run the setup script by cloning the repo and editing the files in `ubuntu-server`.
Then run the script:

```bash
cd ubuntu-server && bash setup.sh
```

## Applications

### Maintaining

- [htop](https://htop.dev/)

### Git

- [git](https://git-scm.com/)
- [Github CLI](https://cli.github.com/)

### Servers / Runtimes

- [Docker](https://www.docker.com/)
- [Better Docker PS](https://github.com/Mikescher/better-docker-ps)

### Bash

- [zsh](https://www.zsh.org/)
    - [OhMyZSH!](https://ohmyz.sh/)
    - Themes
        - [PowerLevel10k](https://github.com/romkatv/powerlevel10k)
    - Plugins
        - [colored-man-pages](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/colored-man-pages)
        - [colorize](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/colorize)
        - [command-not-found](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/command-not-found)
        - [docker](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker)
        - [dotenv](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dotenv)
        - [gh](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/gh)
        - [git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git)
        - [ZSH Autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
        - [ZSH Syntax Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
    - Custom Aliases
        - `ls` = `ls -Alhv --color=always`
        - `c` = `clear`
        - `cdl <path>` = `cd <path> && ls`
        - `d` = `docker`
        - `dc` = `docker compose`
    - Configuration
        - Case Insensitive Completion
        - Hyphen Insensitive Completion
        - Disable Globbing Errors
        - Show Hidden Files in Completion
        - Command Correction
        - Completion Waiting Dots
        - Default Editor to `nano`

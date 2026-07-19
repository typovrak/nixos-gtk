[![NixOS 26.05+](https://img.shields.io/badge/NixOS-26.05%2B-a6e3a1?labelColor=45475a)](https://nixos.org/)
[![License MIT](https://img.shields.io/badge/License-MIT-cba6f7.svg?labelColor=45475a)](LICENSE.md)
[![Portal](https://img.shields.io/badge/Portal-typovrak.tv%2Fnixos-eba0ac?labelColor=45475a)](https://typovrak.tv/nixos)
[![Discord join us](https://img.shields.io/badge/Discord-Join%20us-74c7ec?labelColor=45475a&logo=discord&logoColor=white)](https://typovrak.tv/discord)

# 🎨 NixOS GTK

> Declarative NixOS module to deploy GTK-2, GTK-3 and GTK-4 settings with Catppuccin mocha green theme, Papirus icons, cursors, and portal support.

## 🧩 Part of the Typovrak NixOS ecosystem

This module is part of ```Typovrak NixOS```, a fully modular and declarative operating system configuration built entirely with :

- 🧱 **30+ standalone modules :** Each managing a specific tool, feature or aesthetic like ```zsh```, ```i3```, ```lighdm```, ```polybar```, ```gtk``` and more.
- 🎨 **Catppuccin Mocha :** The default theme across terminal, GUI, and login interfaces.
- 🛡️ **100% FOSS compliant :** No proprietary software included unless explicitly chosen.
- 🧑‍💻 **Built for developers :** Optimized for speed, keyboard-centric workflows and expressive CLI tooling.

*Explore the full system : 👉 [github.com/typovrak/nixos](https://github.com/typovrak/nixos)*

> [!CAUTION]
> This module is opinionated, it may **override**, **replace**, or **remove** files and settings **without** prompt. To avoid unexpected changes, **back up** your existing files or **fork** this module to take full control. **Follow this documentation** to avoid any of this problem.

## 📦 Features

- 🔒 **Secure config directories :** Creates and protects ```~/.config/gtk-3.0```, ```~/.config/gtk-4.0``` and ```~/.gtkrc-2.0.mine``` with proper ownership and permissions.
- 🎨 **Catppuccin mocha green theme :** Applies your ```settings.ini``` to GTK-2/3/4, setting theme name, dark preference, icon theme, font, cursor theme, toolbar style, and more.
- 🖼️ **Papirus icon theme :** Installs Papirus-Dark icons for GTK apps.
- 🖱️ **Catppuccin cursors :** Provides Catppuccin mocha green cursor set.
- 🔌 **Portal integration :** Enables ```xdg-desktop-portal-gtk``` for Flatpak and sandboxed GTK apps.
- 🛠️ **dconf support :** Activates ```programs.dconf``` to apply additional GNOME settings.
- 💾 **Backup guidance :** Docs include commands to back up any existing GTK configs before changes.

## 📂 Repository structure

```bash
❯ tree -a -I ".git*"
.
├── configuration.nix # module configuration
├── LICENSE.md        # MIT license
├── README.md         # this documentation
└── settings.ini      # gtk 2/3/4 configuration file with theme, icons, font and cursor

1 directory, 4 files
```

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
Before proceeding, back up existing configuration if needed
```bash
cp ~/.config/mimeapps.list{,.bak}
cp ~/.local/share/applications/*.desktop{,.bak}
```

## ⬇️ Installation

### 🚀 Method 1 : Out-of-the-box

Fetch the module directly in your [main nixos configuration](https://github.com/typovrak/nixos) at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
# /etc/nixos/configuration.nix

let
  nixos-gtk = fetchGit {
    url = "https://github.com/typovrak/nixos-gtk.git";
    ref = "main";
    rev = "610c7f6912961adadd9471d19db8eeb6f7a27f50"; # update to the desired commit
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-gtk}/configuration.nix")
  ];
}
```

Once imported, rebuild your system to apply changes
```bash
sudo nixos-rebuild switch
```

### 🍴 Method 2 : Fork

Want to **personalize** this module ?

Fork it and add this custom module in your [main nixos configuration](https://github.com/typovrak/nixos) at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
let
  nixos-gtk = fetchGit {
    url = "https://github.com/<YOUR_USERNAME>/nixos-gtk.git";
    ref = "main";
    rev = "<COMMIT>"; # see below
  };
in {
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-gtk}/configuration.nix")
  ];
}
```

Get the latest commit hash by executing
```bash
git clone https://github.com/<YOUR_USERNAME>/nixos-gtk.git &&
cd nixos-gtk &&
git log -1 --pretty=format:"%H"
```

## 🎬 Usage

Run ```lxappearance``` in a terminal to view and adjust GTK theme, icons and cursors.

You can also install ```nemo``` temporarily
```bash
nix-shell -p nemo
```
Then run ```nemo``` to see the Catppuccin mocha green theme with Papirus dark icons. The catppuccin mocha green cursors only work on very few apps like chromium.

## 📚 Learn more

- 🎨 [Catppuccin GTK theme](https://github.com/catppuccin/gtk) : Theme used in this module.
- 🧩 [Papirus icon theme](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) : Modern and consistent icon set.
- 🖱️ [Catppuccin cursors](https://github.com/catppuccin/cursors) : Matching cursor set for the theme.
- 🔌 [xdg-desktop-portal-gtk](https://github.com/flatpak/xdg-desktop-portal-gtk) : Portal backend for GTK apps used by Flatpak and sandboxed apps.
- ⚙️ [GTK settings overview](https://wiki.archlinux.org/title/GTK) : How GTK themes, icons, and cursors are applied on Linux systems.

## 🌐 Discover my NixOS system portal

Dive into [typovrak.tv/nixos](https://typovrak.tv/nixos) Catppuccin mocha green themed **gateway** to my GitHub and NixOS setup.

Browse **every module**, example and config in a sleek with an interactive interface that feels just like your desktop.

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.

## 💬 Join the Typovrak community on Discord 🇫🇷

If you've ever ```rm -rf```ed your config by mistake or rebuilt for the 42nd time because a semicolon was missing…

You're not alone, **Welcome home !**

🎯 [Join us on Discord »](https://typovrak.tv/discord)

🧭 What you’ll find is :

- ```💻 #nixos-setup``` - get help with modules, rebuilds and configs.
- ```🌐 #web-dev``` - talk JS, TypeScript, React, Node and more.
- ```🧠 #open-source``` - share your repos, contribute to others and discuss FOSS culture.
- ```⌨️ #typing``` - layouts, mechanical keyboards and speed goals.
- ```🎨 #ricing``` - dotfiles, theming tips and desktop screenshots.

*Everyone's welcome no matter how many times you've broken your system ~~(except for Windows users)~~ 😄*

---

<p align="center"><i>Made with 💜 by <a href="https://typovrak.tv">typovrak</a></i></p>

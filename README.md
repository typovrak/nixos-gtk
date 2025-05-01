# 🎨 NixOS GTK

> Declarative NixOS module to deploy GTK-2, GTK-3 and GTK-4 settings with Catppuccin mocha green theme, Papirus icons, cursors, and portal support.

## 📦 Features

- 🔒 **Secure config directories :** Creates and protects ```~/.config/gtk-3.0```, ```~/.config/gtk-4.0``` and ```~/.gtkrc-2.0.mine``` with proper ownership and permissions.

- 🎨 **Catppuccin mocha green theme :** Applies your ```settings.ini``` to GTK-2/3/4, setting theme name, dark preference, icon theme, font, cursor theme, toolbar style, and more.

- 🖼️ **Papirus icon theme :** Installs Papirus-Dark icons for GTK apps.

- 🖱️ **Catppuccin cursors :** Provides Catppuccin mocha green cursor set.

- 🔌 **Portal integration :** Enables ```xdg-desktop-portal-gtk``` for Flatpak and sandboxed GTK apps.

- 🛠️ **dconf support :** Activates ```programs.dconf``` to apply additional GNOME settings.

- 💾 **Backup guidance :** Docs include commands to back up any existing GTK configs before changes.

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

## 🚀 Installation
Fetch the module directly in your main nixos configuration at ```/etc/nixos/configuration.nix``` using fetchGit
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

## 🎬 Usage

Run ```lxappearance``` in a terminal to view and adjust GTK theme, icons and cursors.

You can also install ```nemo``` temporarily
```bash
nix-shell -p nemo
```
Then run ```nemo``` to see the Catppuccin mocha green theme with Papirus dark icons. The catppuccin mocha green cursors only work on very few apps like chromium.

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://www.buymeacoffee.com/typovrak).

## 📝 License

Distributed under the [MIT license](LICENSE.md).

## 📜 Code of conduct

This project maintains a [code of conduct](.github/CODE_OF_CONDUCT.md) to ensure a respectful, inclusive and constructive community.

## 🛡️ Security

To report vulnerabilities or learn about supported versions and response timelines, please see our [security policy](.github/SECURITY.md).

---

<p align="center"><i>Made with 💜 by typovrak</i></p>

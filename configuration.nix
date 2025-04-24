{ config, pkgs, ... }:

let
	username = "typovrak";
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.gtk = ''
		mkdir -p ${home}/.config
		chown ${username}:${group} ${home}/.config
		chmod 700 ${home}/.config

		rm -rf ${home}/.config/gtk-3.0
		mkdir ${home}/.config/gtk-3.0
		chown ${username}:${group} ${home}/.config/gtk-3.0
		chmod 700 ${home}/.config/gtk-3.0

		cp ${./settings.ini} ${home}/.config/gtk-3.0/settings.ini
		chown ${username}:${group} ${home}/.config/gtk-3.0/settings.ini
		chmod 600 ${home}/.config/gtk-3.0/settings.ini

		cp ${./settings.ini} ${home}/.gtkrc-2.0.mine
		chown ${username}:${group} ${home}/.gtkrc-2.0.mine
		chmod 600 ${home}/.gtkrc-2.0.mine
	'';
	
	environment.systemPackages = with pkgs; [
		gnome-themes-extra
		lxappearance
		xdg-desktop-portal-gtk
		papirus-icon-theme
	];

	 xdg.portal = {
    		enable = true;
    		config.common.default = "gtk";
    		extraPortals = [
			pkgs.xdg-desktop-portal-gtk
		];
  	};

	programs.dconf.enable = true;
}

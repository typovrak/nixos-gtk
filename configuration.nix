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
	'';
	
	environment.systemPackages = with pkgs; [
		glib
		gsettings-desktop-schemas
		gnome-themes-extra
		adwaita-icon-theme
		lxappearance
		xdg-desktop-portal-gtk
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

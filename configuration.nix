{ config, pkgs, ... }:

let
	username = "typovrak";
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.gtk = ''
		mkdir -p ${home}/.config/gtk-3.0
		cat > ${home}/.config/gtk-3.0/settings.ini << EOF
[Settings]
gtk-theme-name=Adwaita-dark
gtk-application-prefer-dark-theme=1
EOF
		chown ${user}:${group} ${home}/.config/gtk-3.0/settings.ini
		chmod 644 ${home}/.config/gtk-3.0/settings.ini
	'';
	
	environment.systemPackages = with pkgs; [
		gnome-themes-extra
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

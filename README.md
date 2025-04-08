# nixos-gtk


nixos-gtk = fetchGit {
	url = "https://github.com/typovrak/nixos-gtk.git";
	ref = "main";
};

(import "${nixos-gtk}/configuration.nix")

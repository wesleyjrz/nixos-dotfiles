#  Wesley Vieira S. Jr.
#
#    ,= ,-_-. =.
#   ((_/)o o(\_))
#    `-'(. .)`-'
#        \_/
#
#  github.com/wesleyjrz
#  gitlab.com/wesleyjrz

{ config, ... }:

{
	environment.sessionVariables = rec {

		# Default programs
		EDITOR = "nvim";
		TERMINAL = "termite";
		BROWSER = "firefox";

		# XDG settings
		XDG_RUNTIME_DIR = "/run/user/1000";
		XDG_CONFIG_HOME = "\${HOME}/.config";
		XDG_DATA_HOME = "\${HOME}/.local/share";
		XDG_CACHE_HOME = "\${HOME}/.local/cache";
		XDG_STATE_HOME = "\${HOME}/.local/state";
		XDG_BIN_HOME = "\${HOME}/.local/bin";
		XAUTHORITY = "\${XDG_RUNTIME_DIR}/Xauthority";

		# Clean up $HOME
		XINITRC = "\${HOME}/.config/X11/xinitrc";
		ZDOTDIR = "\${HOME}/.config/zsh";
		GTK_RC_FILES = "\${HOME}/.config/gtk-1.0/gtkrc";
		GTK2_RC_FILES = "\${HOME}/.config/gtk-2.0/gtkrc";
		PYTHONSTARTUP = "\${HOME}/.config/pythonrc";
		ANDROID_HOME = "\${HOME}/.local/share/android";
		GNUPGHOME = "\${HOME}/.local/share/gnupg";
		CGDB_DIR = "\${HOME}/.config/cgdb";
		ELECTRUMDIR = "\${HOME}/.local/share/electrum";
		NPM_CONFIG_USERCONFIG = "\${HOME}/.config/npm/config";

		# Set QT5 theme
		QT_QPA_PLATFORMTHEME = "qt5ct";

		# IBus
		GTK_IM_MODULE = "ibus";
		QT_IM_MODULE = "ibus";
		XMODIFIERS = "@im=ibus";

		# fzf
		FZF_DEFAULT_OPTS = "--height 40% --border";
	};
}

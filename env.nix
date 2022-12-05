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

		# Default man pager
		MANPAGER="sh -c 'col -bx | bat -l man -p '";

		# IBus
		GTK_IM_MODULE = "ibus";
		QT_IM_MODULE = "ibus";
		XMODIFIERS = "@im=ibus";

		# fzf
		FZF_DEFAULT_OPTS = "--height 40% --border";

		# lf
		LF_ICONS = "tw=:st=:ow=:dt=:di=:fi=:ln=:or=:ex=:*.c=:*.cc=:*.clj=:*.coffee=:*.cpp=:*.css=:*.d=:*.dart=:*.erl=:*.exs=:*.fs=:*.go=:*.h=:*.hh=:*.hpp=:*.hs=:*.html=:*.java=:*.jl=:*.js=:*.json=:*.lua=:*.md=:*.php=:*.pl=:*.pro=:*.py=:*.rb=:*.rs=:*.scala=:*.ts=:*.vim=:*.cmd=:*.ps1=:*.sh=:*.bash=:*.zsh=:*.fish=:*.tar=:*.tgz=:*.arc=:*.arj=:*.taz=:*.lha=:*.lz4=:*.lzh=:*.lzma=:*.tlz=:*.txz=:*.tzo=:*.t7z=:*.zip=:*.z=:*.dz=:*.gz=:*.lrz=:*.lz=:*.lzo=:*.xz=:*.zst=:*.tzst=:*.bz2=:*.bz=:*.tbz=:*.tbz2=:*.tz=:*.deb=:*.rpm=:*.jar=:*.war=:*.ear=:*.sar=:*.rar=:*.alz=:*.ace=:*.zoo=:*.cpio=:*.7z=:*.rz=:*.cab=:*.wim=:*.swm=:*.dwm=:*.esd=:*.jpg=:*.jpeg=:*.mjpg=:*.mjpeg=:*.gif=:*.bmp=:*.pbm=:*.pgm=:*.ppm=:*.tga=:*.xbm=:*.xpm=:*.tif=:*.tiff=:*.png=:*.svg=:*.svgz=:*.mng=:*.pcx=:*.mov=:*.mpg=:*.mpeg=:*.m2v=:*.mkv=:*.webm=:*.ogm=:*.mp4=:*.m4v=:*.mp4v=:*.vob=:*.qt=:*.nuv=:*.wmv=:*.asf=:*.rm=:*.rmvb=:*.flc=:*.avi=:*.fli=:*.flv=:*.gl=:*.dl=:*.xcf=:*.xwd=:*.yuv=:*.cgm=:*.emf=:*.ogv=:*.ogx=:*.aac=:*.au=:*.flac=:*.m4a=:*.mid=:*.midi=:*.mka=:*.mp3=:*.mpc=:*.ogg=:*.ra=:*.wav=:*.oga=:*.opus=:*.spx=:*.xspf=:*.pdf=:*.nix=:";
	};
}

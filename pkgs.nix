#  Wesley Vieira S. Jr.
#
#    ,= ,-_-. =.
#   ((_/)o o(\_))
#    `-'(. .)`-'
#        \_/
#
#  github.com/wesleyjrz
#  gitlab.com/wesleyjrz

{ pkgs, config, ... }:

with pkgs;
let
	python-pkgs = python-packages: with python-packages; [ i3ipc ];
	myPython = python3.withPackages python-pkgs;
in

{
	### Package overlays

	nixpkgs = {
		overlays = [
			(self: super: {
				# Neovim vi/vim aliases
				neovim = super.neovim.override {
					viAlias = true;
					vimAlias = true;
				};
				retroarch = super.retroarch.override {
					cores = [
						libretro.dosbox
						libretro.fceumm
						libretro.snes9x
						libretro.genesis-plus-gx
						libretro.mgba
						libretro.mupen64plus
						libretro.desmume
						libretro.ppsspp
					];
				};
			})
		];
	};

	environment.systemPackages = with pkgs; [
		### Misc

		exfat ntfs3g # file systems
		pinentry-curses # gnupg pinentry

		neovim # PDE (personalised development environment)
		vimwiki-markdown # convert VimWiki markdown to html
		bat # cat replacement
		curl # transfer data (from or to a server)
		wget # CLI downloader
		pandoc # markup converter
		texlive.combined.scheme-full # LaTeX
		ripgrep # find regex pattern inside files
		fzf # fuzzy finder
		edir # text editor batch renamer
		rclone # mount clouds locally
		ncdu # ncurses disk usage
		scrcpy # display and control Android devices
		neofetch # system information
		dmidecode # system hardware information
		cpu-x # GUI for system hardware information
		cmatrix # H4CK3R F33L1NG

		### Desktop Environment

		picom # compositor
		nitrogen # wallpaper engine
		polybarFull # status bar
		pamixer # volume control
		pulsemixer # audio mixing system
		rofi # applications menu
		haskellPackages.greenclip # clipboard manager
		dunst libnotify xclip # notifications
		maim # screenshots
		redshift # blue light filter
		xss-lock i3lock-fancy-rapid # screen locker
		xorg.xkill # kill Xorg applications with cursor
		xdragon # drag-and-drop files
		unclutter-xfixes # hide cursor
		termite # terminal emulator
		htop-vim # process manager
		trash-cli # CLI trash
		exa # list files
		lf # file manager
		bashmount # mount external drives
		imv # image viewer
		mpv-unwrapped # video and audio player
		mupdf # PDF viewer
		firefox # web browser
		tutanota-desktop # email client
		# neomutt
		calcurse # calendar
		gtk-pipe-viewer # youtube client
		zip unzip _7zz unrar # archivers

		### Theme

		nordic papirus-icon-theme

		# Engines
		lxappearance
		libsForQt5.qt5ct
		libsForQt5.qtstyleplugin-kvantum

	];

	users.users.wesleyjrz.packages = with pkgs; [
		### Misc

		# Editors
		gimp # image editor
		inkscape # vector graphics editor
		libresprite # sprite editor and pixel art tool
		tiled # map editor

		# Studying tools
		anki-bin # spaced repetition studying

		# Games
		retroarch # retro games emulator

		# Cryptocurency
		nodePackages.coinmon # price monitor

		### Development

		# Tools
		git git-lfs git-crypt # git + tools
		nix-prefetch-scripts # obtain source hashes
		any-nix-shell # use any shell with nix-shell
		binutils # set of tools for creating and managing binary programs
		gnumake # generate executables and other non-source files easily
		file # show file types
		unixtools.xxd # hexdump
		entr # run arbitrary commands when files change
		jq # JSON processor
		docker # portable containers
		gh # github command line tool

		# C/C++
		gcc # compiler
		gdb cgdb # debugger
		ccls # LSP

		# Lua
		lua # REPL
		sumneko-lua-language-server # LSP

		# Python
		myPython # REPL + packages
		nodePackages.pyright # LSP

		# Julia
		julia-lts-bin

		# Shell script
		shellcheck # analysis tool
		nodePackages.bash-language-server # LSP

		# Web development
		nodePackages.live-server # simple http server
		sass # CSS preprocessor
		hugo # static website engine

		# Game development
		love
	];
}
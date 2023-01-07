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

{
	imports = [
		/etc/nixos/hardware-configuration.nix
		/etc/nixos/env.nix
		/etc/nixos/pkgs.nix
	];

	system.stateVersion = "22.05";

	nixpkgs.config.allowUnfree = true;

	nix.settings.experimental-features = [
		"nix-command"
		"flakes"
	];

	### Kernel

	boot.kernelPackages = pkgs.linuxPackages_zen;

	### Bootloader

	boot.cleanTmpDir = true;
	boot.loader = {
		timeout = 15;
		grub = {
			enable = true;
			version = 2;
			device = "/dev/sda"; # or "nodev" for efi only
			# efiSupport = true;
			# efiInstallAsRemovable = true;
			useOSProber = true; # add other OS automatically
		};
		# efi.efiSysMountPoint = "/boot/efi";
	};

	### Locale and input

	time.timeZone = "America/Sao_Paulo";
	i18n.defaultLocale = "en_GB.UTF-8";
	console = {
		font = "Lat2-Terminus16";
		keyMap = "br-abnt2";
	};

	# IBus input
	i18n.inputMethod = {
		enabled = "ibus";
		ibus.engines = with pkgs.ibus-engines; [ m17n ]; # russian input
	};

	### Users

	# Default shell
	users.defaultUserShell = pkgs.zsh;

	# NOTE: don't forget to set a password with `passwd` on first install
	users.users.wesleyjrz = {
		isNormalUser = true;
		description = "Wesley Jr.";
		home = "/home/wesleyjrz";
		extraGroups = [
			"wheel" # enable `sudo` for the user
			"tty"
			"audio"
			"sound"
			"video"
			"input"
			"disk"
			"docker"
			"libvirt" "libvirtd" "libvirt-qemu" "kvm"
			"adbusers"
			"networkmanager"
		];

		openssh.authorizedKeys.keys = [
			# Default SSH key
			"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDliiOH5pQBXCFf3mNf2lSBJTH8Qi46bsP1qrQzdrnq+ wesleyjrz-nixos"
		];
	};

	### Network

	networking = {
		hostName = "nixos";
		networkmanager.enable = true;

		usePredictableInterfaceNames = false;
		interfaces.eth0.ipv4.addresses = [{
			address = "192.168.0.100";
			prefixLength = 24;
		}];
		defaultGateway = "192.168.0.1";
		nameservers = [ "9.9.9.9" "149.112.112.112" ];

		firewall = {
			enable = true;
			allowedTCPPorts = [ 80 443 ];
			# allowedUDPPorts = [ ... ];
		};
	};

	### Hardware and services

	hardware.enableAllFirmware = true;

	sound.enable = true;
	hardware = {
		pulseaudio = {
			package = pkgs.pulseaudioFull;
			enable = true;
			support32Bit = true;
			# This module creates a file `.esd_auth`
			# extraConfig = "unload-module module-esound-protocol-unix";
		};
	};

	# Control backlight
	programs.light.enable = false;

	# Touchpad support
	services.xserver.libinput.enable = false;

	hardware.bluetooth.enable = false;

	services = {
		# Enable CUPS to print documents
		printing.enable = false;

		# Bluetooth support
		blueman.enable = false;

		# Mount plugged devices
		udisks2.enable = true;
	};

	### SSH and Encryption

	services.openssh = {
		enable = true;
		# permitRootLogin = "yes";

		# Automatically open ports in the firewall
		ports = [ 22 ];
		openFirewall = true;

		# Require public key authentication for better security
		passwordAuthentication = false;
		kbdInteractiveAuthentication = false;
	};

	programs = {
		mtr.enable = true;
		gnupg.agent = {
			enable = true;
			enableSSHSupport = true;
			pinentryFlavor = "curses";
		};
	};

	### Graphical environment

	services.xserver = {
		enable = true;
		layout = "br";
		xkbOptions = "ctrl:nocaps";
		displayManager = {
			startx.enable = true;
			defaultSession = "none+i3";
		};
		windowManager = {
			i3.enable = true;
			i3.package = pkgs.i3-gaps;
		};
	};

	### Fonts

	fonts.fonts = with pkgs; [
		(nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
		noto-fonts noto-fonts-cjk noto-fonts-emoji
		ubuntu_font_family
		corefonts # Microsoft fonts
	];

	### Nix Store

	nix = {
		autoOptimiseStore = true;

		gc = {
			automatic = true;
			dates = "weekly";
			options = "--delete-older-than 14d";
		};

		# Free up to 1GiB whenever is less than 512MiB left
		extraOptions = ''
		min-free = ${toString (512 * 1024 * 1024)}
		max-free = ${toString (1024 * 1024 * 1024)}
		'';
	};

	### Cron jobs

	# services.cron = {
	# 	enable = true;
	# 	systemCronJobs = [
	# 	];
	# };

	### Virtualisation

	virtualisation = {
		docker.enable = true;
		libvirtd.enable = true;
	};

	### Android Debug Shell

	programs.adb.enable = true;

	### Snapper backup

	# services.snapper = {
	# 	snapshotInterval = "hourly";
	# 	cleanupInterval = "1d";
	# 	configs = {
	# 		home = {
	# 			subvolume = "/home";
	# 			extraConfig = ''
	# 			ALLOW_USERS="wesleyjrz"
	# 			TIMELINE_CREATE=yes
	# 			TIMELINE_CLEANUP=yes
	# 			BACKGROUND_COMPARISON=yes
	# 			EMPTY_PRE_POST_CLEANUP=yes
	# 			EMPTY_PRE_POST_MIN_AGE="1800"
	# 			'';
	# 		};
	# 	};
	# };
}

# My NixOS dotfiles

### Install

Run the script `link.sh`:

`$ ./link.sh`

or link files manually:

`$ sudo ln -sf ~/.config/nixos/*.nix /etc/nixos`

and build the system:

`$ sudo nixos-rebuild switch --upgrade-all`

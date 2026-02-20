# nix-cfg

Personal NixOS configuration managed with flakes. Heavily inspired by [Vimjoyer work](https://www.youtube.com/watch?v=a67Sv4Mbxmc).

## Installation

### Using an existing host configuration

1 - Clone the repository

2 - Remove the existing hardware configuration if you want to use an already defined host: 
```bash
rm -f hosts/<host>/hardware-configuration.nix
```

3 - Regenerate the hardware configuration if you want to use an already defined host: 
```bash
sudo nixos-generate-config --show-hardware-config > hosts/<host>/hardware-configuration.nix
```

4 - Switch to the new configuration: 
```bash
sudo nixos-rebuild switch --flake .#<host>
```

### Creating a new host configuration

1 - Clone the repository

2 - Do ur stuff

3 - Generate the hardware configuration: 
```bash
sudo nixos-generate-config --show-hardware-config > hosts/<host>/hardware-configuration.nix
```

4 - Switch to the new configuration: 
```bash 
sudo nixos-rebuild switch --flake .#<host>
```

## Update && Upgrade

```bash
nix flake update
sudo nixos-rebuild switch --flake .#<host>
```

```console
# mount drives
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode mount nixos/disk-config.nix

# install
sudo nixos-install --flake .#laptop
```

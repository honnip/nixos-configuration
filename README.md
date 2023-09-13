# nixos-configuration

```shell
# after formatting (or partitioning with edited hardware-configuration.nix)
nixos-install --root /mnt --flake github:honnip/nixos-configuration#hostname
nixos-enter
passwd honnip
```

## update
```shell
nix flake update
```

## apply
```shell
nixos-rebuild switch --flake .
```

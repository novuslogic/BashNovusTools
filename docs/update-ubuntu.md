# `update-ubuntu.sh`

Refreshes APT package metadata and performs standard and distribution upgrades
without interactive package confirmation.

## Usage

```bash
./bin/update-ubuntu.sh
```

The script accepts no arguments.

## Commands executed

```bash
sudo apt-get update
sudo NEEDRESTART_SUSPEND=1 apt-get upgrade --yes
sudo NEEDRESTART_SUSPEND=1 apt-get dist-upgrade --yes
```

`NEEDRESTART_SUSPEND=1` asks compatible `needrestart` tooling to defer its
service-restart handling during each upgrade command.

## Requirements and effects

- Ubuntu or another Debian-based system with APT
- Network access to configured package repositories
- `sudo` privileges
- Sufficient disk space for downloaded and installed packages

`dist-upgrade` may install new dependencies or remove packages to complete an
upgrade. The script does not run `autoremove`, reboot the host, or report that a
reboot is required.

## Limitations

The script does not use `set -e`, so a failed command does not stop later
commands. Its final exit status is only the status of the last `apt-get`
operation. Use maintenance windows and backups appropriate to the host.

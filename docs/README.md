# BashNovusTools documentation

[Back to the project front page](../README.md) · [View the changelog](../changelog.md)

This directory documents the shell scripts distributed in [`bin`](../bin).
The scripts perform system-level package and Docker administration on Linux and
normally require `sudo` access.

## Script reference

| Script | Purpose | Main platform |
| --- | --- | --- |
| [`install-docker-compose.sh`](install-docker-compose.md) | Install or update the legacy standalone `docker-compose` executable | Linux |
| [`install-docker-engine.sh`](install-docker-engine.md) | Configure Docker repositories and install Docker Engine and plugins | Supported Linux distributions |
| [`refresh-env.sh`](refresh-env.md) | Replace the current process with a login shell | Unix-like systems |
| [`restart-docker.sh`](restart-docker.md) | Stop and start the Docker systemd service | systemd-based Linux |
| [`update-docker-user-group.sh`](update-docker-user-group.md) | Add the current user to the `docker` group | Linux |
| [`update-ubuntu.sh`](update-ubuntu.md) | Update and upgrade Ubuntu packages | Ubuntu/Debian with APT |

See [Script review](script-review.md) for implementation findings and operational
risks. Packaging and release notes remain in [Info.md](Info.md).

## General usage

Run commands from the repository root unless a page says otherwise:

```bash
chmod +x bin/*.sh
./bin/script-name.sh
```

Review each script before running it. These utilities can install packages,
change repository configuration, alter group membership, and restart services.
They are not uniformly idempotent and most do not provide a dry-run mode.

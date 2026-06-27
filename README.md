# BashNovusTools

BashNovusTools is a collection of Linux administration scripts for common
deployment and operations tasks. It provides commands for installing Docker,
managing Docker access and services, and updating Ubuntu packages. The project
can be used directly from source or packaged as a Snap.

## Included tools

| Script | Purpose |
| --- | --- |
| `install-docker-engine.sh` | Installs Docker Engine and its CLI plugins from Docker package repositories. |
| `install-docker-compose.sh` | Installs or updates the standalone `docker-compose` executable. |
| `restart-docker.sh` | Stops and starts the Docker systemd service. |
| `update-docker-user-group.sh` | Adds the current user to the `docker` group. |
| `refresh-env.sh` | Starts a login shell for the current user. |
| `update-ubuntu.sh` | Updates APT metadata and performs package and distribution upgrades. |

For requirements, detailed usage, limitations, and review findings, see the
complete [documentation](docs/README.md).

## Run from source

Clone the repository on a Linux system, make the scripts executable, and invoke
only the tool you need:

```bash
git clone https://github.com/novuslogic/BashNovusTools.git
cd BashNovusTools
chmod +x bin/*.sh
./bin/update-ubuntu.sh
```

Most scripts execute privileged system operations and will request `sudo`
access. Review the relevant documentation and script before running it.

## Install the Snap

The Snap is currently published to the edge channel and uses classic
confinement:

```bash
sudo snap install bashnovustools --channel=edge --classic
```

Snap commands are exposed using the package prefix, for example:

```bash
bashnovustools.update-ubuntu
bashnovustools.install-docker-engine --dry-run
bashnovustools.restart-docker
```

The repository's GitHub Actions workflow builds the Snap on changes to `main`
and publishes successful `main` builds to the edge channel.

## Important safety notes

- These tools can install or remove packages, change package repositories,
  restart Docker, and modify user group membership.
- Membership in the `docker` group grants root-equivalent control of the host.
- The Docker installation scripts require internet access and should be tested
  before use in production environments.
- Review the known implementation issues in the
  [script review](docs/script-review.md).

## Documentation

- [Documentation index](docs/README.md)
- [Script review and findings](docs/script-review.md)
- [Snap packaging and release notes](docs/Info.md)
- [Changelog](changelog.md)

## License

Licensed under the [Apache License 2.0](LICENSE).

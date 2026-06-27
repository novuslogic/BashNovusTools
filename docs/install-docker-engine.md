# `install-docker-engine.sh`

Configures Docker's package repository and installs Docker Engine, the Docker
CLI, containerd, Buildx, Compose, and rootless extras where supported. Most of
the file is a snapshot of Docker's convenience installer, identified in the
script by commit `e5543d473431b782227f8908005543bb4389b8de`.

## Usage

```bash
sudo ./bin/install-docker-engine.sh [options]
```

| Option | Meaning |
| --- | --- |
| `--channel stable` | Install from the stable channel (default). |
| `--channel test` | Install from the test channel. |
| `--version VERSION` | Request a specific Docker version, such as `23.0`. |
| `--mirror Aliyun` | Use the Aliyun Docker package mirror. |
| `--mirror AzureChinaCloud` | Use the Azure China Cloud mirror. |
| `--dry-run` | Print privileged commands instead of executing them. Version pinning is not supported in this mode. |

The same settings can be supplied through `CHANNEL`, `VERSION`, `DOWNLOAD_URL`,
`REPO_FILE`, and `DRY_RUN` environment variables. Command-line options override
the corresponding environment values.

## Supported distribution paths

The embedded installer contains branches for:

- Ubuntu, Debian, and Raspbian via APT
- CentOS, Fedora, and RHEL via YUM/DNF
- SLES via Zypper

Actual support depends on the age of this embedded installer, the detected
distribution release and architecture, and the repositories currently offered
by Docker. WSL is detected but only generates a recommendation and delay before
the Linux installation continues.

## Requirements and effects

- Run on Linux with root access or with `sudo`/`su` available.
- Requires internet access to the selected Docker repository.
- Adds Docker repository keys and package-manager configuration.
- Installs and may enable Docker-related packages and dependencies.
- A production deployment should prefer Docker's current distribution-specific
  instructions and should pin and test package versions.

## Exit behavior and limitations

- If any `docker` command already exists, this repository's added pre-check
  prints `Docker is installed.` and exits with status 1. It cannot upgrade or
  repair such an installation.
- Successful distribution branches call `exit 0` from `do_install`. Therefore,
  the final `bash update-docker-user-group.sh` statement is unreachable.
- Even if that final statement became reachable, its relative path would only
  resolve when the working directory contained that script.
- Unknown `--...` options print `Illegal option` but do not immediately fail.
- Options requiring a value do not validate that a value was supplied.
- The installer is an embedded snapshot and can become inconsistent with
  current Docker repositories and supported OS releases.

To grant a user Docker socket access, invoke
[`update-docker-user-group.sh`](update-docker-user-group.md) separately after
reviewing its security implications.
